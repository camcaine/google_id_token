defmodule GoogleIDToken.JWKSetTest do
  use ExUnit.Case, async: true
  alias GoogleIDToken.JWKSet

  describe "JWKSet.fetch/0" do
    test "fetches the JWK Set" do
      assert {:ok, %JWKSet{}} = JWKSet.fetch()
    end
  end
end
