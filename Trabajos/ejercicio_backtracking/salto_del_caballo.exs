defmodule SaltoCaballo do
  @moduledoc """
  Resolución del problema del salto del caballo (Knight's Tour) usando backtracking puro en Elixir.
  Permite al usuario ingresar el tamaño del tablero y la posición inicial.
  """

  @movimientos [
    {2, 1}, {1, 2}, {-1, 2}, {-2, 1},
    {-2, -1}, {-1, -2}, {1, -2}, {2, -1}
  ]

  # Punto de entrada del programa
  def main do
    # Leer el tamaño del tablero
    n =
      IO.gets("Ingrese el tamaño del tablero (por ejemplo 5, 6, 8): ")
      |> String.trim()
      |> String.to_integer()

    # Leer la posición inicial
    sx =
      IO.gets("Ingrese la coordenada X inicial (0..#{n - 1}): ")
      |> String.trim()
      |> String.to_integer()

    sy =
      IO.gets("Ingrese la coordenada Y inicial (0..#{n - 1}): ")
      |> String.trim()
      |> String.to_integer()

    # Resolver el tour con los datos del usuario
    resolver_tour(n, sx, sy)
  end

  # Resolver el tour para un tamaño n y punto inicial (sx, sy)
  def resolver_tour(n, sx, sy) do
    tablero =
      for _ <- 1..n do
        for _ <- 1..n do
          -1
        end
      end

    tablero = set_cell(tablero, sx, sy, 0)

    case backtrack(tablero, sx, sy, 1, n) do
      {:ok, sol} ->
        IO.puts("\nTour encontrado:\n")
        imprimir_tablero(sol)

        if cerrado?(sol, sx, sy, n) do
          IO.puts("\nEs un tour CERRADO.\n")
        else
          IO.puts("\nEs un tour ABIERTO.\n")
        end

      :error ->
        IO.puts("No se encontró solución.")
    end
  end

  # Caso base: si ya dimos n*n pasos, terminamos
  defp backtrack(tablero, _x, _y, paso, n) when paso == n * n do
    {:ok, tablero}
  end

  # Caso recursivo
  defp backtrack(tablero, x, y, paso, n) do
    @movimientos
    |> Enum.reduce_while(:error, fn {dx, dy}, _acc ->
      nx = x + dx
      ny = y + dy

      if valido?(nx, ny, tablero, n) do
        tablero2 = set_cell(tablero, nx, ny, paso)

        case backtrack(tablero2, nx, ny, paso + 1, n) do
          {:ok, sol} -> {:halt, {:ok, sol}}
          :error -> {:cont, :error}
        end
      else
        {:cont, :error}
      end
    end)
  end

  # Comprueba si (x,y) es una celda válida y sin visitar
  defp valido?(x, y, tablero, n) do
    x >= 0 && y >= 0 && x < n && y < n && Enum.at(Enum.at(tablero, x), y) == -1
  end

  # Reemplaza una celda en el tablero
  defp set_cell(tablero, x, y, val) do
    fila = Enum.at(tablero, x)
    nueva_fila = List.replace_at(fila, y, val)
    List.replace_at(tablero, x, nueva_fila)
  end

  # Imprime el tablero
  defp imprimir_tablero(tablero) do
    Enum.each(tablero, fn fila ->
      fila
      |> Enum.map(&String.pad_leading(Integer.to_string(&1), 2, " "))
      |> Enum.join(" ")
      |> IO.puts()
    end)
  end

  # Determina si el tour es cerrado
  defp cerrado?(tablero, sx, sy, n) do
    {lx, ly} = encontrar_celda(tablero, n * n - 1)
    Enum.any?(@movimientos, fn {dx, dy} -> lx + dx == sx and ly + dy == sy end)
  end

  # Busca una celda con valor específico
  defp encontrar_celda(tablero, val) do
    tablero
    |> Enum.with_index()
    |> Enum.reduce_while(nil, fn {fila, i}, _ ->
      case Enum.find_index(fila, &(&1 == val)) do
        nil -> {:cont, nil}
        j -> {:halt, {i, j}}
      end
    end)
  end
end

# Ejecutar el programa automáticamente
SaltoCaballo.main()
