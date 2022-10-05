# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: aserto/api/v2/instance_events.proto

require 'google/protobuf'

require 'aserto/options/v1/ids_pb'
require 'aserto/options/v1/events_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("aserto/api/v2/instance_events.proto", :syntax => :proto3) do
    add_message "aserto.api.v2.InstanceUpdated" do
      optional :tenant_id, :string, 1, json_name: "tenantId"
      optional :policy_id, :string, 2, json_name: "policyId"
      optional :label, :string, 3, json_name: "label"
    end
    add_message "aserto.api.v2.InstanceDeleted" do
      optional :tenant_id, :string, 1, json_name: "tenantId"
      optional :policy_id, :string, 2, json_name: "policyId"
      optional :label, :string, 3, json_name: "label"
    end
  end
end

module Aserto
  module Api
    module V2
      InstanceUpdated = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("aserto.api.v2.InstanceUpdated").msgclass
      InstanceDeleted = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("aserto.api.v2.InstanceDeleted").msgclass
    end
  end
end
