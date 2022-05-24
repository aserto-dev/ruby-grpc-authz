# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf'


##
# Imports
#
require 'google/protobuf/descriptor.pb'

module Aserto
  module Options
    module V1
      ::Protobuf::Optionable.inject(self) { ::Google::Protobuf::FileOptions }

      ##
      # Enum Classes
      #
      class IDType < ::Protobuf::Enum
        define :ID_TYPE_UNKNOWN, 0
        define :ID_TYPE_ACCOUNT, 1
        define :ID_TYPE_TENANT, 2
        define :ID_TYPE_ERROR, 3
        define :ID_TYPE_POLICY, 4
        define :ID_TYPE_REQUEST, 5
        define :ID_TYPE_PROVIDER, 6
        define :ID_TYPE_CONNECTION, 7
        define :ID_TYPE_INVITE, 8
        define :ID_TYPE_POLICY_BUILDER, 9
        define :ID_TYPE_POLICY_REPO, 10
      end


      ##
      # File Options
      #
      set_option :go_package, "github.com/aserto-dev/go-grpc/aserto/options/v1;options"


      ##
      # Extended Message Fields
      #
      class ::Google::Protobuf::FieldOptions < ::Protobuf::Message
        optional ::Aserto::Options::V1::IDType, :".aserto.options.v1.id_type", 50002, :extension => true
      end

    end

  end

end

