defmodule Util do
  @moduledoc """
  Módulo con funciones reutilizadas comúnmente
  - autor: Nicolás Orozco
  - fecha: 19/08/2025
  - licencia: GNU GLP v3
  """

  @doc """
  Función para mostrar un mensaje en la consola
  """
  def mostrar_mensaje(mensaje) do
    mensaje
    |> IO.puts()
  end

  @doc """
  Función para mostrar un mensaje en PopUp
  """
  def mostrar_mensajeGUI(mensaje) do
    System.cmd("java", ["PopUp", mensaje])
  end

  @doc """
  Función para manejar el input de texto
  """
  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
    |> String.downcase()
  end

  def ingresar(mensaje, :entero) do
    try do
      mensaje

      |> ingresar(:texto)
      |> String.to_integer()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un número entero\n"
        |> mostrar_error()

        mensaje
        |> ingresar(:entero)
    end
  end

  def ingresar(mensaje, :real) do
    numero = mensaje
    |> ingresar(:texto)

    case Float.parse(numero) do
      {num, ""} -> num   # lo pudo parsear como float directamente
      :error ->
        case Integer.parse(numero) do
          {int, ""} -> int * 1.0  # entero convertido a float
          :error ->
            "Error, se espera que ingrese un número real\n"
            |> mostrar_error()

            mensaje
            |> ingresar(:real)
        end
    end
  end

  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end

  @doc """
  Función para manejar el input de texto mediante interfaz gráfica
  """
  def ingresarGUI(mensaje,:texto) do
    # Llama al programa Java para ingresar texto y capturar la entrada
    case System.cmd("java", ["-cp", ".", "Mensaje","input", mensaje]) do
    {output, 0} ->
    IO.puts("Texto ingresado correctamente.")
    IO.puts("Entrada: #{output}")
    String.trim(output) # Retorna la entrada sin espacios extra
    {error, code} ->
    IO.puts("Error al ingresar el texto. Código: #{code}")
    IO.puts("Detalles: #{error}")
    nil
    end
  end

end
