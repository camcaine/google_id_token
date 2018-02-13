defmodule GoogleIDToken.JWKSet do
  @moduledoc """
  JWK (JSON Web Key) Set representation.

  The `JWKSet` struct represents a set of `JWK`'s. The struct
  has only one key `:keys`, with its value being a list of `JWK`'s.
  """

  alias GoogleIDToken.JWK
  alias GoogleIDToken.JWKSet.{Endpoint, Endpointable}

  @url "https://www.googleapis.com/oauth2/v3/certs"

  @type t :: %__MODULE__{keys: [JWK.t()]}

  @enforce_keys [:keys]
  defstruct [:keys]

  @doc """
  Fetch the keys.

  Currently fetches the keys directly from the network,
  until a cache can be implemented.
  """
  @spec fetch :: {:ok, JWKSet.t()} | {:error, term}
  def fetch do
    with {:ok, jwk_set, _} <- Endpoint.get(Endpointable.to_endpoint(@url)) do
      {:ok, jwk_set}
    end
  end
end
