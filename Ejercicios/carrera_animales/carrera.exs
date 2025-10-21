defmodule Carrera do
  def iniciar do
    animales = [
      {"Capibara", 300},
      {"Cocodrilo", 500},
      {"Búho", 400}
    ]

    IO.puts("🏁 ¡Comienza la carrera!\n")

    # Lanzamos un proceso por cada animal (sin vincularlos)
    Enum.each(animales, fn {nombre, velocidad} ->
      spawn(fn -> correr(nombre, velocidad, self()) end)
    end)

    # Recibir resultados de todos
    resultados = recibir_resultados(length(animales), [])

    if resultados == [] do
      IO.puts("\n⚠️ Ningún animal terminó la carrera.")
    else
      ganador = Enum.min_by(resultados, fn {_, tiempo} -> tiempo end)
      IO.puts("\n🏆 El ganador es #{elem(ganador, 0)} con un tiempo de #{elem(ganador, 1)} ms!")
    end
  end

  defp correr(nombre, velocidad, pid_principal) do
    IO.puts("#{nombre} está corriendo...")

    # Tiempo aleatorio basado en su velocidad
    tiempo = :rand.uniform(1000) + velocidad
    :timer.sleep(tiempo)

    # Enviar resultado al proceso principal
    send(pid_principal, {:llego, nombre, tiempo})
  end

  defp recibir_resultados(0, resultados), do: resultados

  defp recibir_resultados(restantes, resultados) do
    receive do
      {:llego, nombre, tiempo} ->
        IO.puts("🐾 #{nombre} llegó en #{tiempo} ms")
        recibir_resultados(restantes - 1, [{nombre, tiempo} | resultados])
    after
      5000 ->
        IO.puts("⏰ Se agotó el tiempo de espera, algún animal no llegó.")
        resultados
    end
  end
end

Carrera.iniciar()
