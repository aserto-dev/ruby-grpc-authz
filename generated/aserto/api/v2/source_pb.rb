# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: aserto/api/v2/source.proto

require 'google/protobuf'

require 'aserto/options/v1/ids_pb'
require 'google/protobuf/timestamp_pb'
require 'protoc-gen-openapiv2/options/annotations_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("aserto/api/v2/source.proto", :syntax => :proto3) do
    add_message "aserto.api.v2.Source" do
      optional :policy_id, :string, 1, json_name: "policyId"
      optional :connection_id, :string, 2, json_name: "connectionId"
      optional :org, :string, 3, json_name: "org"
      optional :repo, :string, 4, json_name: "repo"
      optional :created_at, :message, 5, "google.protobuf.Timestamp", json_name: "createdAt"
      optional :updated_at, :message, 6, "google.protobuf.Timestamp", json_name: "updatedAt"
    end
  end
end

module Aserto
  module Api
    module V2
      Source = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("aserto.api.v2.Source").msgclass
    end
  end
end