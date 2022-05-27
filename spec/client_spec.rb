# frozen_string_literal: true

describe "Ruby GRPC client" do
  let(:client) do
    Aserto::Authorizer::Authorizer::V1::Authorizer::Stub.new(
      "authorizer.eng.aserto.com:8443",
      GRPC::Core::ChannelCredentials.new
    )
  end

  describe ".query" do
    before do
      GrpcMock.stub_request("/aserto.authorizer.authorizer.v1.Authorizer/Query").to_return do
        Aserto::Authorizer::Authorizer::V1::QueryResponse.new(
          {
            results: [],
            metrics: {}
          }
        )
      end
    end

    it "executes with success" do
      query_request = Aserto::Authorizer::Authorizer::V1::QueryRequest.new(
        {
          query: "x=data",
          policy_context: Aserto::Api::V1::PolicyContext.new(
            {
              id: "my-policy-context-id"
            }
          )
        }
      )
      resp = client.query(
        query_request,
        {
          metadata: {
            "aserto-tenant-id": "my-tenant-id",
            authorization: "authorization-token"
          }
        }
      )
      expect(resp.to_json).to eq("{\"metrics\":{}}")
    end
  end
end
