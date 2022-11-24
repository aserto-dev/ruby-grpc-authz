# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: aserto/api/v1/invite.proto

require 'google/protobuf'

require 'google/protobuf/timestamp_pb'
require 'aserto/options/v1/ids_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("aserto/api/v1/invite.proto", :syntax => :proto3) do
    add_message "aserto.api.v1.Invite" do
      optional :id, :string, 1, json_name: "id"
      optional :email, :string, 2, json_name: "email"
      optional :status, :enum, 3, "aserto.api.v1.InviteStatus", json_name: "status"
      optional :created_at, :message, 4, "google.protobuf.Timestamp", json_name: "createdAt"
      optional :responded_at, :message, 5, "google.protobuf.Timestamp", json_name: "respondedAt"
      optional :invited_by, :string, 6, json_name: "invitedBy"
      optional :role, :string, 7, json_name: "role"
    end
    add_enum "aserto.api.v1.InviteStatus" do
      value :INVITE_STATUS_UNKNOWN, 0
      value :INVITE_STATUS_ACCEPTED, 1
      value :INVITE_STATUS_DECLINED, 2
      value :INVITE_STATUS_EXPIRED, 3
      value :INVITE_STATUS_CANCELED, 4
      value :INVITE_STATUS_ACTIVE, 5
    end
  end
end

module Aserto
  module Api
    module V1
      Invite = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("aserto.api.v1.Invite").msgclass
      InviteStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("aserto.api.v1.InviteStatus").enummodule
    end
  end
end
