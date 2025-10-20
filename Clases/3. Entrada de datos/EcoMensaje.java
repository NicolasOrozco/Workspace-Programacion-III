package Ejercicios.seguimiento2;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class EcoMensaje {
    public static void main(String[] args) {
        try {
            // String fija
            String mensaje = "Hola mundo";

            // Ejecutar el script de Elixir
            ProcessBuilder pb = new ProcessBuilder("C:\\Program Files\\Elixir\\bin\\elixir.bat", "EcoMensaje.exs", mensaje);
            pb.redirectErrorStream(true);
            Process process = pb.start();
 
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            StringBuilder output = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
            output.append(line).append("\n");
            }
            String respuesta = output.toString().trim();

            System.out.println("Respuesta de Elixir: " + respuesta);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
