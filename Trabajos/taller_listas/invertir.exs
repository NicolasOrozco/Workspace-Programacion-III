defmodule Invertir do

  def main do
    IO.inspect(invertir(["a","b","c",1,2,3]))
  end

  def invertir([]), do: []

  def invertir([cabeza | cola]), do: invertir(cola) ++ [cabeza]

end

Invertir.main
