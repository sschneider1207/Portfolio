defmodule Portfolio.ViewHelpers do

  def signed_in?(conn) do
    case Guardian.Plug.claims(conn) do
      {:ok, claims} -> true
      {:error, reason} -> false
    end
  end
end
