
package Dev;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


public class ZZZ {
    public static void main(String[] args) throws Exception {
        String[] rutaS = {"-parser", "Sintax", "C:/Users/joabe/OneDrive/Documents/NetBeansProjects/ProyectilloAnalizador/src/Dev/Sintaxis.cup"};
        generar( rutaS);
    }
    public static void generar(String[] rutaS) throws IOException, Exception{

        java_cup.Main.main(rutaS);
        
        Path rutaSym = Paths.get("C:/Users/joabe/OneDrive/Documents/NetBeansProjects/ProyectilloAnalizador/src/Dev/sym.java");
        if (Files.exists(rutaSym)) {
            Files.delete(rutaSym);
        }
        Files.move(
                Paths.get("C:/Users/joabe/OneDrive/Documents/NetBeansProjects/ProyectilloAnalizador/sym.java"), 
                Paths.get("C:/Users/joabe/OneDrive/Documents/NetBeansProjects/ProyectilloAnalizador/src/Dev/Sym.java")
        );
        
        Files.move(
                Paths.get("C:/Users/joabe/OneDrive/Documents/NetBeansProjects/ProyectilloAnalizador/Sintax.java"), 
                Paths.get("C:/Users/joabe/OneDrive/Documents/NetBeansProjects/ProyectilloAnalizador/src/Dev/Sintax.java")
        );
    }
}
