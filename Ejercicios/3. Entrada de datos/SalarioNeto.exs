defmodule SalarioNeto do
  def main(horas, valor_hora) do
    calcular_salario(horas, valor_hora)
  end

  def calcular_salario(horas, valor_hora) do
    horas_extra =
      if horas > 160 do
        horas - 160
      else
        0
      end

    (horas * valor_hora) + calcular_salario_extra(horas_extra, valor_hora)
  end

  def calcular_salario_extra(horas_extra, valor_hora) do
    horas_extra * (valor_hora * 1.25)
  end

end

[arg1, arg2] = System.argv()
horas = String.to_integer(arg1)
valor_hora = String.to_float(arg2)
IO.puts(SalarioNeto.main(horas, valor_hora))
