# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf'


##
# Imports
#
require 'google/protobuf/struct.pb'

module Grpc
  module Gateway
    module Protoc_gen_openapiv2
      module Options
        ::Protobuf::Optionable.inject(self) { ::Google::Protobuf::FileOptions }

        ##
        # Enum Classes
        #
        class Scheme < ::Protobuf::Enum
          define :UNKNOWN, 0
          define :HTTP, 1
          define :HTTPS, 2
          define :WS, 3
          define :WSS, 4
        end


        ##
        # Message Classes
        #
        class Swagger < ::Protobuf::Message
        end

        class Operation < ::Protobuf::Message
        end

        class Header < ::Protobuf::Message; end
        class Response < ::Protobuf::Message
        end

        class Info < ::Protobuf::Message
        end

        class Contact < ::Protobuf::Message; end
        class License < ::Protobuf::Message; end
        class ExternalDocumentation < ::Protobuf::Message; end
        class Schema < ::Protobuf::Message; end
        class JSONSchema < ::Protobuf::Message
          class JSONSchemaSimpleTypes < ::Protobuf::Enum
            define :UNKNOWN, 0
            define :ARRAY, 1
            define :BOOLEAN, 2
            define :INTEGER, 3
            define :NULL, 4
            define :NUMBER, 5
            define :OBJECT, 6
            define :STRING, 7
          end

          class FieldConfiguration < ::Protobuf::Message; end

        end

        class Tag < ::Protobuf::Message; end
        class SecurityDefinitions < ::Protobuf::Message
        end

        class SecurityScheme < ::Protobuf::Message
          class Type < ::Protobuf::Enum
            define :TYPE_INVALID, 0
            define :TYPE_BASIC, 1
            define :TYPE_API_KEY, 2
            define :TYPE_OAUTH2, 3
          end

          class In < ::Protobuf::Enum
            define :IN_INVALID, 0
            define :IN_QUERY, 1
            define :IN_HEADER, 2
          end

          class Flow < ::Protobuf::Enum
            define :FLOW_INVALID, 0
            define :FLOW_IMPLICIT, 1
            define :FLOW_PASSWORD, 2
            define :FLOW_APPLICATION, 3
            define :FLOW_ACCESS_CODE, 4
          end

        end

        class SecurityRequirement < ::Protobuf::Message
          class SecurityRequirementValue < ::Protobuf::Message; end

        end

        class Scopes < ::Protobuf::Message
        end



        ##
        # File Options
        #
        set_option :go_package, "github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2/options"


        ##
        # Message Fields
        #
        class Swagger
          optional :string, :swagger, 1
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::Info, :info, 2
          optional :string, :host, 3
          optional :string, :base_path, 4
          repeated ::Grpc::Gateway::Protoc_gen_openapiv2::Options::Scheme, :schemes, 5
          repeated :string, :consumes, 6
          repeated :string, :produces, 7
          map :string, ::Grpc::Gateway::Protoc_gen_openapiv2::Options::Response, :responses, 10
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::SecurityDefinitions, :security_definitions, 11
          repeated ::Grpc::Gateway::Protoc_gen_openapiv2::Options::SecurityRequirement, :security, 12
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::ExternalDocumentation, :external_docs, 14
          map :string, ::Google::Protobuf::Value, :extensions, 15
        end

        class Operation
          repeated :string, :tags, 1
          optional :string, :summary, 2
          optional :string, :description, 3
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::ExternalDocumentation, :external_docs, 4
          optional :string, :operation_id, 5
          repeated :string, :consumes, 6
          repeated :string, :produces, 7
          map :string, ::Grpc::Gateway::Protoc_gen_openapiv2::Options::Response, :responses, 9
          repeated ::Grpc::Gateway::Protoc_gen_openapiv2::Options::Scheme, :schemes, 10
          optional :bool, :deprecated, 11
          repeated ::Grpc::Gateway::Protoc_gen_openapiv2::Options::SecurityRequirement, :security, 12
          map :string, ::Google::Protobuf::Value, :extensions, 13
        end

        class Header
          optional :string, :description, 1
          optional :string, :type, 2
          optional :string, :format, 3
          optional :string, :default, 6
          optional :string, :pattern, 13
        end

        class Response
          optional :string, :description, 1
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::Schema, :schema, 2
          map :string, ::Grpc::Gateway::Protoc_gen_openapiv2::Options::Header, :headers, 3
          map :string, :string, :examples, 4
          map :string, ::Google::Protobuf::Value, :extensions, 5
        end

        class Info
          optional :string, :title, 1
          optional :string, :description, 2
          optional :string, :terms_of_service, 3
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::Contact, :contact, 4
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::License, :license, 5
          optional :string, :version, 6
          map :string, ::Google::Protobuf::Value, :extensions, 7
        end

        class Contact
          optional :string, :name, 1
          optional :string, :url, 2
          optional :string, :email, 3
        end

        class License
          optional :string, :name, 1
          optional :string, :url, 2
        end

        class ExternalDocumentation
          optional :string, :description, 1
          optional :string, :url, 2
        end

        class Schema
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::JSONSchema, :json_schema, 1
          optional :string, :discriminator, 2
          optional :bool, :read_only, 3
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::ExternalDocumentation, :external_docs, 5
          optional :string, :example, 6
        end

        class JSONSchema
          class FieldConfiguration
            optional :string, :path_param_name, 47
          end

          optional :string, :ref, 3
          optional :string, :title, 5
          optional :string, :description, 6
          optional :string, :default, 7
          optional :bool, :read_only, 8
          optional :string, :example, 9
          optional :double, :multiple_of, 10
          optional :double, :maximum, 11
          optional :bool, :exclusive_maximum, 12
          optional :double, :minimum, 13
          optional :bool, :exclusive_minimum, 14
          optional :uint64, :max_length, 15
          optional :uint64, :min_length, 16
          optional :string, :pattern, 17
          optional :uint64, :max_items, 20
          optional :uint64, :min_items, 21
          optional :bool, :unique_items, 22
          optional :uint64, :max_properties, 24
          optional :uint64, :min_properties, 25
          repeated :string, :required, 26
          repeated :string, :array, 34
          repeated ::Grpc::Gateway::Protoc_gen_openapiv2::Options::JSONSchema::JSONSchemaSimpleTypes, :type, 35
          optional :string, :format, 36
          repeated :string, :enum, 46
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::JSONSchema::FieldConfiguration, :field_configuration, 1001
          map :string, ::Google::Protobuf::Value, :extensions, 48
        end

        class Tag
          optional :string, :description, 2
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::ExternalDocumentation, :external_docs, 3
        end

        class SecurityDefinitions
          map :string, ::Grpc::Gateway::Protoc_gen_openapiv2::Options::SecurityScheme, :security, 1
        end

        class SecurityScheme
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::SecurityScheme::Type, :type, 1
          optional :string, :description, 2
          optional :string, :name, 3
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::SecurityScheme::In, :in, 4
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::SecurityScheme::Flow, :flow, 5
          optional :string, :authorization_url, 6
          optional :string, :token_url, 7
          optional ::Grpc::Gateway::Protoc_gen_openapiv2::Options::Scopes, :scopes, 8
          map :string, ::Google::Protobuf::Value, :extensions, 9
        end

        class SecurityRequirement
          class SecurityRequirementValue
            repeated :string, :scope, 1
          end

          map :string, ::Grpc::Gateway::Protoc_gen_openapiv2::Options::SecurityRequirement::SecurityRequirementValue, :security_requirement, 1
        end

        class Scopes
          map :string, :string, :scope, 1
        end

      end

    end

  end

end

