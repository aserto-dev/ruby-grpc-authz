# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf'

module Aserto
  module Api
    module V1
      ::Protobuf::Optionable.inject(self) { ::Google::Protobuf::FileOptions }

      ##
      # Enum Classes
      #
      class IdentityType < ::Protobuf::Enum
        define :IDENTITY_TYPE_UNKNOWN, 0
        define :IDENTITY_TYPE_NONE, 1
        define :IDENTITY_TYPE_SUB, 2
        define :IDENTITY_TYPE_JWT, 3
      end


      ##
      # Message Classes
      #
      class IdentityContext < ::Protobuf::Message; end


      ##
      # File Options
      #
      set_option :go_package, "github.com/aserto-dev/go-grpc/aserto/api/v1;api"
      set_option :csharp_namespace, "Aserto.API.V1"


      ##
      # Message Fields
      #
      class IdentityContext
        optional :string, :identity, 2
        optional ::Aserto::Api::V1::IdentityType, :type, 3
      end

    end

  end

end

