defmodule SumaObjetivo do
  def main do
    lista = [2, 4, 6, 8]
    objetivo = 10

    if existe_combinacion?(lista, objetivo) do
      IO.puts("Se puede sumar #{objetivo}")
    else
      IO.puts("No se puede sumar #{objetivo}")
    end
  end

  def existe_combinacion?(_, 0), do: true

  def existe_combinacion?([], _), do: false

  def existe_combinacion?([cabeza | cola], objetivo) do
    incluir = existe_combinacion?(cola, objetivo - cabeza)
    excluir = existe_combinacion?(cola, objetivo)
    incluir or excluir
  end
end

SumaObjetivo.main()
