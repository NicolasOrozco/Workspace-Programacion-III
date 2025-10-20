defmodule TriviaMapa do
  def run do
    IO.puts("Bienvenido a la Trivia con Mapas para Robinson")
    IO.puts("Responde con la opción correcta (a, b, c)\n")

    preguntas = [
      {"¿Cuál es el lenguaje que estamos usando?",
        %{opciones: ["a) Java", "b) Elixir", "c) Python"], respuesta: "b"}},

      {"¿Qué estructura de datos es %{a: 1, b: 2}?",
        %{opciones: ["a) Lista", "b) Tupla", "c) Mapa"], respuesta: "c"}},

      {"¿Cuál es la capital de Colombia?",
        %{opciones: ["a) Medellín", "b) Cali", "c) Bogotá"], respuesta: "c"}}
    ]

    resultados = jugar(preguntas, [])
    mostrar_resultados(resultados)
  end

  # Caso base
  defp jugar([], resultados), do: Enum.reverse(resultados)

  defp jugar([{pregunta, datos} | resto], resultados) do
    IO.puts("\n#{pregunta}")
    Enum.each(datos.opciones, &IO.puts/1)

    respuesta =
      IO.gets("Tu respuesta: ")
      |> String.trim()
      |> String.downcase()

    nuevo_resultado =
      if respuesta == datos.respuesta do
        IO.puts("Correcto!")
        "correcto"
      else
        IO.puts("Incorrecto!")
        "incorrecto"
      end

    jugar(resto, [nuevo_resultado | resultados])
  end

  defp mostrar_resultados(resultados) do
    IO.puts("\nResultados de la Trivia:")
    Enum.each(resultados, fn estado ->
      IO.puts("- #{estado}")
    end)
  end
end

TriviaMapa.run()
