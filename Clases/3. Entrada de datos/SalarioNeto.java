package Ejercicios.seguimiento2;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import javax.swing.JOptionPane;

public class SalarioNeto {
    public static void main(String[] args) {

        try {
            // Solicitar datos al usuario
            String nombre = JOptionPane.showInputDialog("Ingrese su nombre:");
            String horas = JOptionPane.showInputDialog("Ingrese las horas trabajadas:");
            String valor_hora = JOptionPane.showInputDialog("Ingrese el valor de su trabajo por hora:");

            // ProcessBuilder permite crear y ejecutar procesos del sistema operativo desde Java.
            // Aquí se construye el comando: elixir LongitudPalabra.exs <palabra>
            // Esto ejecuta el script de Elixir y le pasa la palabra como argumento.
            ProcessBuilder pb = new ProcessBuilder("C:\\\\Program Files\\\\Elixir\\\\bin\\\\elixir.bat", "SalarioNeto.exs", horas.trim(), valor_hora.trim());

            // Redirige el flujo de error al flujo de salida estándar, así puedes leer ambos por el mismo canal
            pb.redirectErrorStream(true);

            // Inicia el proceso (ejecuta el comando)
            Process process = pb.start();

            // Crea un BufferedReader para leer la salida del proceso (lo que imprime el script de Elixir)
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));

            // Lee la primera línea de la salida (que será la cantidad de letras)
            String salarioNeto = reader.readLine();

            JOptionPane.showMessageDialog(null, "El Salario Neto de " + nombre + " es: " + salarioNeto);

        } catch (Exception e) {
            e.printStackTrace();
        
        }
    }
}
