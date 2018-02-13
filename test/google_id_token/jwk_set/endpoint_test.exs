defmodule GoogleIDToken.JWKSet.EndpointTest do
  use ExUnit.Case, async: true

  alias GoogleIDToken.JWKSet
  alias GoogleIDToken.JWKSet.{Endpoint, Endpointable}

  @url "https://www.googleapis.com/oauth2/v3/certs"

  setup do
    [endpoint: Endpointable.to_endpoint(@url)]
  end

  describe "Endpointable.to_endpoint/1" do
    test "implementations", %{endpoint: endpoint} do
      assert %Endpoint{} = Endpointable.to_endpoint(endpoint)
      assert %Endpoint{} = Endpointable.to_endpoint(endpoint.uri)
      assert %Endpoint{} = Endpointable.to_endpoint(@url)
    end
  end

  describe "Endpoint type" do
    test "enforces keys" do
      assert %Endpoint{} = struct!(Endpoint, uri: %URI{})

      assert_raise KeyError, fn ->
        struct!(Endpoint, bad_key: "")
      end
    end
  end

  describe "Endpoint.get/1" do
    test "gets the public keys", %{endpoint: endpoint} do
      assert {:ok, _, %{}} = Endpoint.get(endpoint)
    end

    test "parses the body into a JWT Set", %{endpoint: endpoint} do
      assert {:ok, %JWKSet{}, _} = Endpoint.get(endpoint)
    end
  end
end
