defmodule GoogleIDToken.JWKSet do
  @moduledoc """
  JWK (JSON Web Key) Set representation.

  The `JWKSet` struct represents a set of `JWK`'s. The struct
  has only one key `:keys`, with its value being a list of `JWK`'s.
  """

  alias GoogleIDToken.JWK

  @type t :: %__MODULE__{keys: [JWK.t()]}

  @enforce_keys [:keys]
  defstruct [:keys]
end
