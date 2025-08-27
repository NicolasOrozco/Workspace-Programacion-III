defmodule SalarioNeto do

  def calcular_salario(horas, valor_hora) do

    horas_extra = if horas > 160, do: horas - 160, else: 0

    ((horas-horas_extra) * valor_hora) + calcular_salario_extra(horas_extra, valor_hora)
  end

  def calcular_salario_extra(horas_extra, valor_hora) do
    horas_extra * (valor_hora * 1.25)
  end

end

[arg1, arg2] = System.argv()
horas = String.trim(arg1) |> String.to_integer()
valor_hora = String.trim(arg2) |> String.to_integer()
IO.puts(Float.round(SalarioNeto.calcular_salario(horas, valor_hora),2))
