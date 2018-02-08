defmodule GoogleIDToken.JWKSet.Endpoint do
  @moduledoc """
  The endpoint for getting public keys.

  An `%Endpoint{}` specifies the URI of the public keys. The methods
  here rely on this endpoint to know where to go.
  """

  @type t :: %__MODULE__{uri: URI.t()}

  @enforce_keys [:uri]
  defstruct [:uri]

  @doc """
  Get the keys from the endpoint over the network.
  """
  @spec get(t) :: {:ok, map, map} | {:error, term}
  def get(%__MODULE__{} = endpoint) do
    url = URI.to_string(endpoint.uri)

    with {:ok, %{status_code: 200, body: body, headers: headers}} <- HTTPoison.get(url) do
      {:ok, body, Enum.into(headers, %{})}
    end
  end
end
