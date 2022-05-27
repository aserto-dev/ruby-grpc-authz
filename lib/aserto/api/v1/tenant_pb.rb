# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: aserto/api/v1/tenant.proto

require 'google/protobuf'

require 'aserto/api/v1/connection_pb'
require 'aserto/options/v1/ids_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("aserto/api/v1/tenant.proto", :syntax => :proto3) do
    add_message "aserto.api.v1.TenantMember" do
      optional :id, :string, 1, json_name: "id"
    end
    add_message "aserto.api.v1.Tenant" do
      optional :id, :string, 1, json_name: "id"
      optional :name, :string, 2, json_name: "name"
      repeated :members, :message, 3, "aserto.api.v1.TenantMember", json_name: "members"
      repeated :connections, :message, 4, "aserto.api.v1.Connection", json_name: "connections"
      optional :personal, :bool, 5, json_name: "personal"
      optional :max_hosted_instances, :int32, 6, json_name: "maxHostedInstances"
    end
  end
end

module Aserto
  module Api
    module V1
      TenantMember = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("aserto.api.v1.TenantMember").msgclass
      Tenant = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("aserto.api.v1.Tenant").msgclass
    end
  end
end
