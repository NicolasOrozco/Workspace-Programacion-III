defmodule NumeroMayor do

  def main do
    lista = [5,7,2,4,3]
    IO.inspect(mayor(lista))
  end

  def mayor([x]), do: x

  def mayor([head | tail]) do
    mayor_tail = mayor(tail)

    if head > mayor_tail do
      head
    else
      mayor_tail
    end
  end
end

NumeroMayor.main()
