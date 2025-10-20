defmodule CalculoSalario do
  def main do
    nombre_empleado = "Ingrese el nombre del empleado: "
    |> Util.ingresar(:texto)
    salario_base = "Ingrese su salario base: "
    |> Util.ingresar(:real)
    horas_extra = "Ingrese las horas extra trabajadas: "
    |> Util.ingresar(:entero)
    salario_total = calcular_salario_total(salario_base, horas_extra)
    generar_mensaje(nombre_empleado, salario_total)
    |> Util.mostrar_mensaje()
  end

  def calcular_salario_total(salario_base, horas_extra) do
    #NOTA: Debido a la falta de información del ejercicio y la incongruencia del ejemplo,
    #      tuvimos como base 176 horas de trabajo mensual (decretado en el país como estándar)
    #      para el valor del salario por horas.
    valor_hora = salario_base/176
    valor_hora_extra = valor_hora*1.5
    pago_extra = horas_extra*valor_hora_extra
    salario_base + pago_extra
  end

  def generar_mensaje(nombre_empleado, salario_total) do
    salario_formateado = :erlang.float_to_binary(salario_total, decimals: 2)
    "El salario total de #{nombre_empleado} es de $#{salario_formateado}"
  end

end

CalculoSalario.main()
