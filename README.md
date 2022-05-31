# Aserto::Grpc::Authz

Ruby generated GRPC client for Aserto Authorizer

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aserto-grpc-authz'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install aserto-grpc-authz

## Usage
```ruby
require 'aserto-grpc-authz'

query_request = Aserto::Authorizer::Authorizer::V1::QueryRequest.new(
  {
    query: 'x=data',
    policy_context: Aserto::Api::V1::PolicyContext.new(
      { id: 'my-policy-id' }
    )
  }
)

client = Aserto::Authorizer::Authorizer::V1::Authorizer::Stub.new(
  "authorizer.eng.aserto.com:8443",
  GRPC::Core::ChannelCredentials.new
)

begin
  resp = client.query(
    query_request,
    {
      metadata: {
        "aserto-tenant-id": 'my-tenant-id',
        "authorization": 'my-bearer-token',
      }
    }
  )

  # use response
  puts resp.inspect
rescue GRPC::BadStatus => e
  # handle error
  puts e.inspect
end
```

## Development
Prerequisites:

    - go >= 1.17 to generate Ruby code
    - Ruby >= 2.7.0 to run the code

After checking out the repo, run `mage generate` to generate Ruby code.

 Run `bundle install` to install dependencies. Then, run `bundle exec rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aserto-dev/ruby-grpc-authz. This project is intended to be a safe, welcoming space for collaboration.

## License

The gem is available as open source under the terms of the [Apache-2.0 License](https://www.apache.org/licenses/LICENSE-2.0).

