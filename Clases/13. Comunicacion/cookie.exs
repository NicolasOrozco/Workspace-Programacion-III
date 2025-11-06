defmodule Cookie do
  @longitud_llave 64

  def main() do
    :crypto.strong_rand_bytes(@longitud_llave)
    |> Base.encode64()
    |> Uti.mostrar
  end
end

Cookie.main()

# elixir cookie.exs >my_cookie
