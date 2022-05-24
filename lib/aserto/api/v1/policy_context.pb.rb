# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf'


##
# Imports
#
require 'aserto/options/v1/ids.pb'

module Aserto
  module Api
    module V1
      ::Protobuf::Optionable.inject(self) { ::Google::Protobuf::FileOptions }

      ##
      # Message Classes
      #
      class PolicyContext < ::Protobuf::Message; end


      ##
      # File Options
      #
      set_option :go_package, "github.com/aserto-dev/go-grpc/aserto/api/v1;api"
      set_option :csharp_namespace, "Aserto.API.V1"


      ##
      # Message Fields
      #
      class PolicyContext
        optional :string, :id, 1, :".aserto.options.v1.id_type" => ::Aserto::Options::V1::IDType::ID_TYPE_POLICY
        optional :string, :path, 2
        repeated :string, :decisions, 3
      end

    end

  end

end

