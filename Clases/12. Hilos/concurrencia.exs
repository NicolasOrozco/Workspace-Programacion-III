defmodule MiniProcesos do
  def main do
    t1 = Task.async(fn -> sumar(5, 7) end)
    t2 = Task.async(fn -> multiplicar(3, 4) end)
    t3 = Task.async(fn -> imprimir("Hola desde el proceso 3!") end)
    t4 = Task.async(fn -> concatenar("Hola", "mundo") end)

    r1 = Task.await(t1)
    r2 = Task.await(t2)
    r3 = Task.await(t3)
    r4 = Task.await(t4)

  end

  defp sumar(a, b) do
    :timer.sleep(1000)
    IO.puts(a + b)
  end

  defp multiplicar(a, b) do
    :timer.sleep(500)
    IO.puts(a * b)
  end

  defp imprimir(msg) do
    IO.puts(msg)
    "Mensaje impreso"
  end

  defp concatenar(a, b) do
    :timer.sleep(700)
    IO.puts(a <> "" <> b)
  end
end

MiniProcesos.main()
