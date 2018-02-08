defprotocol GoogleIDToken.JWKSet.Endpointable do
  @moduledoc """
  Converts a data structure into a `GoogleIDToken.JWKSet.Endpoint`.
  """

  def to_endpoint(data)
end

alias GoogleIDToken.JWKSet.{Endpoint, Endpointable}

defimpl Endpointable, for: Endpoint do
  def to_endpoint(%Endpoint{} = endpoint) do
    endpoint
  end
end

defimpl Endpointable, for: URI do
  def to_endpoint(uri) do
    %Endpoint{uri: uri}
  end
end

defimpl Endpointable, for: BitString do
  def to_endpoint(url) do
    %Endpoint{uri: URI.parse(url)}
  end
end
