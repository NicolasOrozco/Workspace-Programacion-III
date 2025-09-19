defmodule EmpresaEnvios do
  @moduledoc """
  Módulo que gestiona el sistema de envíos de la empresa,
  incluyendo el cálculo de tarifas, descuentos y recargos según el tipo de cliente y servicio.

  ## Funcionalidades

  - Cálculo de tarifas base según el peso del paquete.
  - Aplicación de descuentos según el tipo de cliente.
  - Aplicación de recargos según el tipo de servicio.
  """

  @doc """
  Función principal que inicia el proceso de cálculo de tarifas.
  """
  def main do
    "Bienvenido al sistema de envíos de la empresa\n"
    |> Util.mostrar_mensaje()

    peso = "Ingrese el peso del paquete en kg: "
    |> Util.ingresar(:real)

    tarifa_base = calcular_tarifa_base(peso)

    tipo_cliente = "Ingrese el tipo de cliente (1 = corporativo, 2 = estudiante, 3 = regular): "
    |> Util.ingresar(:entero)
    |> determinar_cliente()

    descuento = calcular_descuento(tipo_cliente)

    tipo_servicio = "Ingrese el tipo de servicio deseado (1 = express, 2 = estándar): "
    |> Util.ingresar(:entero)
    |> determinar_servicio()

    recargo = calcular_recargo(tipo_servicio)

    tarifa_final = calcular_tarifa_final(tarifa_base, descuento, recargo)

    mensaje = generar_mensaje(tarifa_base, descuento, recargo, tarifa_final)
    Util.mostrar_mensaje(mensaje)
  end

  @doc """
  Determina el tipo de descuento basado en la selección del usuario.

  ## Parámetros

    - `seleccion`: Entero que representa la selección del usuario.
  """
  defp determinar_cliente(seleccion) do
    case seleccion do
      1 -> :corporativo
      2 -> :estudiante
      3 -> :regular
      _ ->
        "Opción inválida. Intente nuevamente.\n"
        |> Util.mostrar_error()

        # Volver a pedir la selección si es inválida
        "Ingrese el tipo de cliente (1 = corporativo, 2 = estudiante, 3 = regular): "
        |> Util.ingresar(:entero)
        |> determinar_cliente()
    end
  end

  @doc """
  Determina el tipo de recargo basado en la selección del usuario.

  ## Parámetros

    - `seleccion`: Entero que representa la selección del usuario.
  """
  defp determinar_servicio(seleccion) do
    case seleccion do
      1 -> :express
      2 -> :estandar
      _ ->
        "Opción inválida. Intente nuevamente.\n"
        |> Util.mostrar_error()

        "Ingrese el tipo de servicio deseado (1 = express, 2 = estándar): "
        |> Util.ingresar(:entero)
        |> determinar_servicio()
    end
  end

  @doc """
  Función con guarda para evitar el ingreso de números menores o iguales a 0.

  ## Parámetros

    - `peso`: Peso del paquete en kg.
  """
  defp calcular_tarifa_base(peso) when peso <= 0 do
    "El peso debe ser un número positivo mayor a 0, intente nuevamente.\n"
    |> Util.mostrar_error()

    "Ingrese el peso del paquete en kg: "
    |> Util.ingresar(:real)
    |> calcular_tarifa_base()
  end

  @doc """
  Calcula la tarifa base según el peso del paquete.

  ## Parámetros

    - `peso`: Peso del paquete en kg (número real positivo).
  """
  defp calcular_tarifa_base(peso) do
    cond do
      peso <= 1 -> 8000
      peso <= 5 -> 12000
      true -> 20000
    end
  end

  @doc """
  Calcula el porcentaje de descuento según el tipo de cliente.

  ## Parámetros

    - `tipo_cliente`: Átomo que representa el tipo de cliente.
  """
  defp calcular_descuento(:corporativo), do: 0.15
  defp calcular_descuento(:estudiante), do: 0.10
  defp calcular_descuento(:regular), do: 0.0

  @doc """
  Calcula el porcentaje de recargo según el tipo de servicio.

  ## Parámetros

    - `tipo_servicio`: Átomo que representa el tipo de servicio.
  """
  defp calcular_recargo(:express), do: 0.25
  defp calcular_recargo(:estandar), do: 0.0

  @doc """
  Calcula la tarifa final aplicando el descuento y el recargo a la tarifa base.

  ## Parámetros

    - `tarifa_base`: Tarifa base calculada según el peso del paquete.
    - `descuento`: Porcentaje de descuento según el tipo de cliente.
    - `recargo`: Porcentaje de recargo según el tipo de servicio.
  """
  defp calcular_tarifa_final(tarifa_base, descuento, recargo) do
    (tarifa_base - (tarifa_base * descuento)) + (tarifa_base * recargo)
  end

  @doc """
  Genera un mensaje detallado con la información del envío.

  ## Parámetros

    - `tarifa_base`: Tarifa base calculada según el peso del paquete.
    - `descuento`: Porcentaje de descuento según el tipo de cliente.
    - `recargo`: Porcentaje de recargo según el tipo de servicio.
    - `tarifa_final`: Tarifa final calculada después de aplicar descuento y recargo.
  """
  defp generar_mensaje(tarifa_base, descuento, recargo, tarifa_final) do
    subtotal = tarifa_base - (tarifa_base * descuento)
    subtotal_formateado = :erlang.float_to_binary(subtotal, decimals: 2)
    tarifa_final_formateada = :erlang.float_to_binary(tarifa_final, decimals: 2)
    """
    Estimado/a usuario, los detalles de su envío son los siguientes: 
    Tarifa base: #{tarifa_base}
    Descuento: #{descuento * 100}%
    Subtotal: #{subtotal_formateado}
    Recargo: #{recargo * 100}%
    Total: #{tarifa_final_formateada}
    """
  end
end

EmpresaEnvios.main()
