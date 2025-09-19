defmodule FortalezaContrasenia do
  @moduledoc """
  Módulo que evalúa la fortaleza de una contraseña basada en varios criterios:
  - Longitud mínima de 8 caracteres.
  - Contiene al menos una letra mayúscula.
  - Contiene al menos un número.
  - No contiene espacios en blanco.
  """

  @doc """
  Función principal que inicia el proceso de evaluación de la fortaleza de la contraseña.
  """
  def main do
    "Ingrese una contraseña para evaluar su fortaleza: "
    |> IO.gets()
    |> String.trim()
    |> evaluar_fortaleza()
    |> IO.inspect()
  end

  @doc """
  Evalúa la fortaleza de una contraseña basada en varios criterios.
  ## Parámetros
    - `contrasenia`: Cadena de texto que representa la contraseña a evaluar.
  """
  def evaluar_fortaleza(contrasenia) do
    convertida = String.graphemes(contrasenia)

    #Determinación del cumplimiento de los criterios de seguridad.
    cond do

      #Longitud mínima de 8 carácteres
      length(convertida) < 8 ->
        {:error, "La contraseña debe tener al menos 8 caracteres"}

      #Al menos una letra mayúscula
      not Enum.any?(convertida, fn c ->
                    String.upcase(c) == c and c != String.downcase(c)
                    end) ->
        {:error, "La contraseña debe contener al menos una letra mayúscula"}

      #Al menos un número
      not tiene_numero?(convertida) ->
        {:error, "La contraseña debe contener al menos un número"}

      #No contener espacios en blanco
      String.contains?(contrasenia, " ") ->
        {:error, "La contraseña no debe contener espacios en blanco"}

      #Si todo sale bien, la contraseña es segura
      true ->
        {:ok, "La contraseña es fuerte"}
    end
  end

  @doc """
  Verifica si una lista de caracteres contiene al menos un número.
  ## Parámetros
    - `contrasenia`: Lista de caracteres que representa la contraseña.
  """
  def tiene_numero?(contrasenia_convertida) do
    Enum.any?(contrasenia_convertida, fn x ->
      case Integer.parse(x) do
        {_, _} -> true  # Integer.parse("123abc") -> Devuelve {123, "abc"}

        :error -> false # Integer.parse("abc")    -> Devuelve :error

      end
    end)
  end
end

FortalezaContrasenia.main()
