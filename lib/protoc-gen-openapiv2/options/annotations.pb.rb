# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf'


##
# Imports
#
require 'google/protobuf/descriptor.pb'
require 'protoc-gen-openapiv2/options/openapiv2.pb'

module Grpc
  module Gateway
    module Protoc_gen_openapiv2
      module Options
        ::Protobuf::Optionable.inject(self) { ::Google::Protobuf::FileOptions }

        ##
        # File Options
        #
        set_option :go_package, "github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2/options"


        ##
        # Extended Message Fields
        #
        class ::Google::Protobuf::FileOptions < ::Protobuf::Message
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::Swagger, :".grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger", 1042, :extension => true
        end

        class ::Google::Protobuf::MethodOptions < ::Protobuf::Message
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::Operation, :".grpc.gateway.protoc_gen_openapiv2.options.openapiv2_operation", 1042, :extension => true
        end

        class ::Google::Protobuf::MessageOptions < ::Protobuf::Message
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::Schema, :".grpc.gateway.protoc_gen_openapiv2.options.openapiv2_schema", 1042, :extension => true
        end

        class ::Google::Protobuf::ServiceOptions < ::Protobuf::Message
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::Tag, :".grpc.gateway.protoc_gen_openapiv2.options.openapiv2_tag", 1042, :extension => true
        end

        class ::Google::Protobuf::FieldOptions < ::Protobuf::Message
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::JSONSchema, :".grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field", 1042, :extension => true
        end

      end

    end

  end

end

