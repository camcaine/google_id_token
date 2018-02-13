defmodule GoogleIDToken.JWKSet.Endpoint do
  @moduledoc """
  The endpoint for getting public keys.

  An `%Endpoint{}` specifies the URI of the public keys. The methods
  here rely on this endpoint to know where to go.
  """

  alias GoogleIDToken.{JWK, JWKSet}

  @type t :: %__MODULE__{uri: URI.t()}

  @enforce_keys [:uri]
  defstruct [:uri]

  @doc """
  Get the keys from the endpoint over the network.
  """
  @spec get(t) :: {:ok, JWKSet.t(), map} | {:error, term}
  def get(%__MODULE__{} = endpoint) do
    url = URI.to_string(endpoint.uri)

    with {:ok, %{status_code: 200, body: body, headers: headers}} <- HTTPoison.get(url),
         {:ok, jwk_set} <- Poison.decode(body, as: %JWKSet{keys: [%JWK{}]}) do
      {:ok, jwk_set, Enum.into(headers, %{})}
    end
  end
end
