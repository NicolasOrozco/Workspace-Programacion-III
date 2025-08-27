import javax.swing.JOptionPane;

/***
 * Clase para lanzar una ventana emergente con mensaje
 */
public class PopUp {
    /*
     * Método main de la clase
     */
    public static void main(String[] args){

        String mensaje;

        mensaje = args[0]; // tomar el mensaje que llega desde Elixir

        JOptionPane.showMessageDialog(null, mensaje, "Bienvenida", JOptionPane.INFORMATION_MESSAGE);
    } 
}