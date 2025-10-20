defmodule SilleteriaCine do

  @moduledoc """
  Módulo que gestiona la reserva de sillas en un cine.

  ## Funcionalidades
  - Definición de un mapa con el número de sillas disponibles en cada sala.
  - Reserva de sillas en una sala específica.
  - Manejo de errores para salas no encontradas o sillas insuficientes.
  """

  @doc"""
  Función principal que define un mapa de salas y sillas, y realiza reservas de sillas.
  Se realizan tres intentos de reserva para demostrar el funcionamiento.
  1. Reserva exitosa en la sala 1.
  2. Intento de reserva en una sala no existente (sala 4).
  3. Intento de reserva con más sillas de las disponibles en la sala
  """
  def main do
    salas = %{
      1 => 20,
      2 => 15,
      3 => 10
    }

    reservar_sillas(salas, 1, 5)
    reservar_sillas(salas, 4, 1)
    reservar_sillas(salas, 2, 16)
  end

  @doc """
  Función que gestiona la reserva de sillas en una sala específica.
  Verifica si la sala existe y si hay suficientes sillas disponibles.
  Actualiza el mapa de salas si la reserva es exitosa.

  ## Parámetros
    - `mapa`: Mapa que contiene el número de sillas disponibles en cada sala.
    - `numero_sala`: Número de la sala donde se desea reservar sillas.
    - `sillas_solicitadas`: Número de sillas que se desean reservar.
  """
  defp reservar_sillas(mapa, numero_sala, sillas_solicitadas) do
    cond do
      not Map.has_key?(mapa, numero_sala) ->
        "Sala no encontrada.\n"
        |> Util.mostrar_error()

      mapa[numero_sala] < sillas_solicitadas ->
        "No hay suficientes sillas disponibles.\n"
        |> Util.mostrar_error()

      true ->
        nuevas_sillas = mapa[numero_sala] - sillas_solicitadas
        nuevo_mapa = Map.put(mapa, numero_sala, nuevas_sillas)
        IO.inspect(nuevo_mapa)
    end
  end

end

SilleteriaCine.main()
