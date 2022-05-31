//go:build mage
// +build mage

package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
	"strings"

	"github.com/aserto-dev/mage-loot/buf"
	"github.com/aserto-dev/mage-loot/common"
	"github.com/aserto-dev/mage-loot/deps"
	"github.com/aserto-dev/mage-loot/fsutil"
	"github.com/aserto-dev/mage-loot/mage"
	"github.com/magefile/mage/sh"
)

const (
	googleApiBufImage   = "buf.build/googleapis/googleapis"
	grpcGatewayBufImage = "buf.build/grpc-ecosystem/grpc-gateway"
	asertoBufImage      = "buf.build/aserto-dev/aserto"
	gemName             = "aserto-grpc-authz"
)

func All() error {
	Deps()
	err := Clean()
	if err != nil {
		return err
	}
	return Generate()
}

// install required dependencies.
func Deps() {
	deps.GetAllDeps()
}

// Generate Ruby code
func Generate() error {
	bufImage := "buf.build/aserto-dev/aserto"

	tag, err := buf.GetLatestTag(bufImage)
	if err != nil {
		fmt.Println("Could not retrieve tags, using latest")
	} else {
		bufImage = fmt.Sprintf("%s:%s", bufImage, tag.Name)
	}

	return gen(bufImage, bufImage)
}

// Generates from a dev build.
func GenerateDev() error {
	err := BuildDev()
	if err != nil {
		return err
	}

	bufImage := filepath.Join(getProtoRepo(), "bin", "aserto.bin#format=bin")
	fileSources := filepath.Join(getProtoRepo(), "public#format=dir")

	return gen(bufImage, fileSources)
}

// Builds the aserto proto image
func BuildDev() error {
	return mage.RunDir(getProtoRepo(), mage.AddArg("build"))
}

// Removes generated files
func Clean() error {
	err := os.RemoveAll("build")
	if err != nil {
		return err
	}

	return os.RemoveAll("generated")

}

// builds the gem
func Build() error {
	err := sh.RunV("mkdir", "-p", "build")
	if err != nil {
		return err
	}

	version, err := sh.Output("cat", "VERSION")
	if err != nil {
		return err
	}

	return sh.RunV("gem", "build", "--output", fmt.Sprintf("./build/%s-%s.gem", gemName, version))
}

func Bump(next string) error {
	nextVersion, err := common.NextVersion(next)
	if err != nil {
		return err
	}
	fmt.Println("Bumping version to", nextVersion)

	fi, err := os.OpenFile("VERSION", os.O_RDWR|os.O_CREATE, 0755)
	if err != nil {
		return err
	}
	defer fi.Close()

	_, err = fi.WriteString(nextVersion)
	return err
}

func Push() error {
	version, err := sh.Output("cat", "VERSION")
	if err != nil {
		return err
	}

	return sh.RunV("gem", "push", fmt.Sprintf("./build/%s-%s.gem", gemName, version))
}

func Release() error {
	err := Build()
	if err != nil {
		return err
	}
	return Push()
}

func getProtoRepo() string {
	protoRepo := os.Getenv("PROTO_REPO")
	if protoRepo == "" {
		protoRepo = "../proto"
	}
	return protoRepo
}

func gen(bufImage, fileSources string) error {
	files, err := getClientFiles(fileSources)
	if err != nil {
		return err
	}

	oldPath := os.Getenv("PATH")
	pathSeparator := string(os.PathListSeparator)
	path := oldPath +
		pathSeparator +
		filepath.Dir(deps.BinPath("protoc"))

	for bufImage, clientFiles := range files {
		err = buf.RunWithEnv(map[string]string{
			"PATH": path,
		},
			buf.AddArg("generate"),
			buf.AddArg("--template"),
			buf.AddArg(filepath.Join("buf", "buf.gen.yaml")),
			buf.AddArg(bufImage),
			buf.AddPaths(clientFiles),
		)
		if err != nil {
			return err
		}
	}

	return nil

}

func getClientFiles(fileSources string) (map[string][]string, error) {
	var clientFiles = make(map[string][]string)

	bufExportDir, err := ioutil.TempDir("", "bufimage")
	if err != nil {
		return clientFiles, err
	}
	bufExportDir = filepath.Join(bufExportDir, "")

	defer os.RemoveAll(bufExportDir)
	err = buf.Run(
		buf.AddArg("export"),
		buf.AddArg(fileSources),
		buf.AddArg("-o"),
		buf.AddArg(bufExportDir),
	)
	if err != nil {
		return clientFiles, err
	}

	authorizerPatterns := []string{
		filepath.Join(bufExportDir, "aserto", "authorizer", "authorizer", "**", "*.proto"),
		filepath.Join(bufExportDir, "aserto", "api", "**", "*.proto"),
		filepath.Join(bufExportDir, "aserto", "options", "**", "*.proto"),
	}

	googleApiPatterns := []string{
		filepath.Join(bufExportDir, "google", "api", "**", "*.proto"),
	}

	grpcGatewayPatterns := []string{
		filepath.Join(bufExportDir, "protoc-gen-openapiv2", "options", "**", "*.proto"),
	}

	for _, pattern := range authorizerPatterns {
		files, err := fsutil.Glob(pattern, "")
		if err != nil {
			return clientFiles, err
		}
		for _, file := range files {
			clientFiles[asertoBufImage] = append(clientFiles[asertoBufImage], strings.TrimPrefix(file, bufExportDir+string(filepath.Separator)))
		}
	}

	for _, pattern := range googleApiPatterns {
		files, err := fsutil.Glob(pattern, "")
		if err != nil {
			return clientFiles, err
		}
		for _, file := range files {
			clientFiles[googleApiBufImage] = append(clientFiles[googleApiBufImage], strings.TrimPrefix(file, bufExportDir+string(filepath.Separator)))
		}
	}

	for _, pattern := range grpcGatewayPatterns {
		files, err := fsutil.Glob(pattern, "")
		if err != nil {
			return clientFiles, err
		}
		for _, file := range files {
			clientFiles[grpcGatewayBufImage] = append(clientFiles[grpcGatewayBufImage], strings.TrimPrefix(file, bufExportDir+string(filepath.Separator)))
		}
	}

	return clientFiles, nil
}
