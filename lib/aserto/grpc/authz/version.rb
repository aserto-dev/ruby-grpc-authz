# frozen_string_literal: true

module Aserto
  module Grpc
    module Authz
      VERSION = File.read(
        File.join(__dir__, "..", "..", "..", "..", "VERSION")
      ).chomp
    end
  end
end
