defmodule Habitacion do
  defstruct numero: "", tipo: ""
end

defmodule Reserva do
  defstruct codigo: "",
            fecha_reserva: "",
            total: 0.0,
            fecha_entrada: "",
            cliente: "",
            habitaciones: []

  def solicitar(mensaje, tipo) do
    Util.ingresar(mensaje, tipo)
  end

  def solicitarhabitaciones() do
    num = solicitar("Ingrese el numero de habitaciones a registrar: ", :entero)

    Enum.map(1..num, fn  ->
      numero = solicitar("Numero de habitación: ", :texto)
      tipo = solicitar("Tipo de habitación (sencilla/doble): ", :texto)
      %Habitacion{numero: numero, tipo: tipo}
    end)
  end

  def registrar_reserva() do
    codigo = solicitar("Codigo de reserva: ", :texto)
    fecha_reserva = solicitar("Fecha de reserva: ", :texto)
    total = solicitar("Total: ", :real)
    fecha_entrada = solicitar("Techa de entrada: ", :texto)
    cliente = solicitar("Nombre del cliente: ", :texto)
    habitaciones = solicitar_habitaciones()

    %Reserva{
      codigo: codigo,
      fecha_reserva: fecha_reserva,
      total: total,
      fecha_entrada: fecha_entrada,
      cliente: cliente,
      habitaciones: habitaciones
    }
  end

  def guardar_reserva_csv(reserva, archivo) do
    encabezado = "codigo (codigo),fecha_reserva (fecha_reserva),total (total),fecha_entrada (fecha_entrada),cliente (cliente),habitaciones (habitaciones)\n"
    habitaciones = Enum.map(reserva.habitaciones, fn h -> "#{h.numero}-#{h.tipo}" end) |> Enum.join("|")
    contenido = "codigo (#{reserva.codigo}),fecha_reserva (#{reserva.fecha_reserva}),total (#{reserva.total}),fecha_entrada (#{reserva.fecha_entrada}),cliente (#{reserva.cliente}),habitaciones (#{habitaciones})\n"

    if File.exists?(archivo) do
      File.write(archivo, contenido, [:append])
    else
      File.write(archivo, encabezado <> contenido)
    end
  end

  def main do
    Util.mostrar_mensaje("Bienvenido al hotel\n")
    reserva = registrar_reserva()
    guardar_reserva_csv(reserva, "reservas.csv")
    Util.mostrar_mensaje("Reserva registrada")
  end
end

Reserva.main()
