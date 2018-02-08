defmodule GoogleIDToken.JWK do
  @moduledoc """
  JWK (JSON Web Key) representation.
  """

  @type t :: %__MODULE__{
          alg: String.t(),
          e: String.t(),
          kid: String.t(),
          kty: String.t(),
          e: String.t(),
          use: String.t()
        }

  defstruct [:alg, :e, :kid, :kty, :n, :use]
end
