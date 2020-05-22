package Mario;

import javax.swing.*;
import Mario.*;
import java.awt.*;


/**This game is a recreation of the original Super Mario Bros but with updated graphics and slight changes
 * Mohamed Halat
 * June 15 2018
 */
public class Main
{
    //sets up keyboard and scene classes
    public static Scene scene;
    public static Keyboard keyboard;

    public static void main(String args[]){
        //Sets frame
        JFrame frame = new JFrame ("Mario");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(800,480);
        frame.setLocationRelativeTo(null);
        frame.setResizable(false);

        //Calls classes
        scene = new Scene();
        keyboard = new Keyboard();
        frame.setContentPane(scene);
        frame.setVisible(true);

    }
}
