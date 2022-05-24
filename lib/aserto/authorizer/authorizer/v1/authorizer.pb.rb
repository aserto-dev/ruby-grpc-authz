# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf'
require 'protobuf/rpc/service'


##
# Imports
#
require 'google/api/annotations.pb'
require 'protoc-gen-openapiv2/options/annotations.pb'
require 'google/protobuf/struct.pb'
require 'aserto/api/v1/policy_context.pb'
require 'aserto/api/v1/identity_context.pb'

module Aserto
  module Authorizer
    module Authorizer
      module V1
        ::Protobuf::Optionable.inject(self) { ::Google::Protobuf::FileOptions }

        ##
        # Enum Classes
        #
        class PathSeparator < ::Protobuf::Enum
          define :PATH_SEPARATOR_UNKNOWN, 0
          define :PATH_SEPARATOR_DOT, 1
          define :PATH_SEPARATOR_SLASH, 2
        end

        class TraceLevel < ::Protobuf::Enum
          define :TRACE_LEVEL_UNKNOWN, 0
          define :TRACE_LEVEL_OFF, 1
          define :TRACE_LEVEL_FULL, 2
          define :TRACE_LEVEL_NOTES, 3
          define :TRACE_LEVEL_FAILS, 4
        end


        ##
        # Message Classes
        #
        class DecisionTreeRequest < ::Protobuf::Message; end
        class DecisionTreeOptions < ::Protobuf::Message; end
        class DecisionTreeResponse < ::Protobuf::Message; end
        class IsRequest < ::Protobuf::Message; end
        class Decision < ::Protobuf::Message; end
        class IsResponse < ::Protobuf::Message; end
        class QueryOptions < ::Protobuf::Message; end
        class QueryRequest < ::Protobuf::Message; end
        class QueryResponse < ::Protobuf::Message; end


        ##
        # File Options
        #
        set_option :go_package, "github.com/aserto-dev/go-grpc-authz/aserto/authorizer/authorizer/v1;authorizer"
        set_option :csharp_namespace, "Aserto.Authorizer.Authorizer.V1"
        set_option :".grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger", { :consumes => ["application/json"], :produces => ["application/json"], :security_definitions => { :security => [{ :key => "AuthorizerAPIKey", :value => { :type => ::Grpc::Gateway::Protoc_gen_openapiv2::Options::SecurityScheme::Type::TYPE_API_KEY, :name => "authorization", :in => ::Grpc::Gateway::Protoc_gen_openapiv2::Options::SecurityScheme::In::IN_HEADER } }, { :key => "TenantID", :value => { :type => ::Grpc::Gateway::Protoc_gen_openapiv2::Options::SecurityScheme::Type::TYPE_API_KEY, :name => "aserto-tenant-id", :in => ::Grpc::Gateway::Protoc_gen_openapiv2::Options::SecurityScheme::In::IN_HEADER } }] }, :security => [{ :security_requirement => [{ :key => "AuthorizerAPIKey", :value => {  } }, { :key => "TenantID", :value => {  } }] }] }


        ##
        # Message Fields
        #
        class DecisionTreeRequest
          optional ::Aserto::Api::V1::PolicyContext, :policy_context, 1
          optional ::Aserto::Api::V1::IdentityContext, :identity_context, 2
          optional ::Aserto::Authorizer::Authorizer::V1::DecisionTreeOptions, :options, 3
          optional ::Google::Protobuf::Struct, :resource_context, 4
        end

        class DecisionTreeOptions
          optional ::Aserto::Authorizer::Authorizer::V1::PathSeparator, :path_separator, 1
        end

        class DecisionTreeResponse
          optional :string, :path_root, 1
          optional ::Google::Protobuf::Struct, :path, 3
        end

        class IsRequest
          optional ::Aserto::Api::V1::PolicyContext, :policy_context, 1
          optional ::Aserto::Api::V1::IdentityContext, :identity_context, 2
          optional ::Google::Protobuf::Struct, :resource_context, 3
        end

        class Decision
          optional :string, :decision, 1
          optional :bool, :is, 2
        end

        class IsResponse
          repeated ::Aserto::Authorizer::Authorizer::V1::Decision, :decisions, 1
        end

        class QueryOptions
          optional :bool, :metrics, 1
          optional :bool, :instrument, 2
          optional ::Aserto::Authorizer::Authorizer::V1::TraceLevel, :trace, 3
          optional :bool, :trace_summary, 4
        end

        class QueryRequest
          optional ::Aserto::Api::V1::IdentityContext, :identity_context, 1
          optional :string, :query, 2
          optional :string, :input, 3
          optional ::Aserto::Authorizer::Authorizer::V1::QueryOptions, :options, 4
          optional ::Aserto::Api::V1::PolicyContext, :policy_context, 5
          optional ::Google::Protobuf::Struct, :resource_context, 6
        end

        class QueryResponse
          repeated ::Google::Protobuf::Struct, :results, 1
          optional ::Google::Protobuf::Struct, :metrics, 2
          repeated ::Google::Protobuf::Struct, :trace, 3
          repeated :string, :trace_summary, 4
        end


        ##
        # Service Classes
        #
        class Authorizer < ::Protobuf::Rpc::Service
          rpc :decision_tree, ::Aserto::Authorizer::Authorizer::V1::DecisionTreeRequest, ::Aserto::Authorizer::Authorizer::V1::DecisionTreeResponse do
            set_option :".grpc.gateway.protoc_gen_openapiv2.options.openapiv2_operation", { :tags => ["authorizer"], :summary => "Decision tree", :description => "Returns decision tree for given identity context.", :operation_id => "authorizer.decision_tree", :security => [{ :security_requirement => [{ :key => "AuthorizerAPIKey", :value => {  } }, { :key => "TenantID", :value => {  } }] }] }
            set_option :".google.api.http", { :post => "/api/v1/authz/decisiontree", :body => "*" }
          end
          rpc :is, ::Aserto::Authorizer::Authorizer::V1::IsRequest, ::Aserto::Authorizer::Authorizer::V1::IsResponse do
            set_option :".grpc.gateway.protoc_gen_openapiv2.options.openapiv2_operation", { :tags => ["authorizer"], :summary => "Is (authorized)", :description => "Determines if identity context is authorized to access the resource guarded by the given policy.", :operation_id => "authorizer.is", :security => [{ :security_requirement => [{ :key => "AuthorizerAPIKey", :value => {  } }, { :key => "TenantID", :value => {  } }] }] }
            set_option :".google.api.http", { :post => "/api/v1/authz/is", :body => "*" }
          end
          rpc :query, ::Aserto::Authorizer::Authorizer::V1::QueryRequest, ::Aserto::Authorizer::Authorizer::V1::QueryResponse do
            set_option :".grpc.gateway.protoc_gen_openapiv2.options.openapiv2_operation", { :tags => ["authorizer"], :summary => "Query", :description => "Execute query.", :operation_id => "authorizer.query", :security => [{ :security_requirement => [{ :key => "AuthorizerAPIKey", :value => {  } }, { :key => "TenantID", :value => {  } }] }] }
            set_option :".google.api.http", { :post => "/api/v1/authz/query", :body => "*" }
          end
        end

      end

    end

  end

end

