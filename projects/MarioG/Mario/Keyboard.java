package Mario;
import java.awt.event.*;
import javax.swing.*;
import java.awt.*;

/** This class is responsible for the keyboard inputs in the game
 * Mohamed Halat
 * June 15 2018
 */
public class Keyboard implements KeyListener
{

    /** This method detects the keys pressed
     * takes in keyevents
     * no returns as it only changes setters
     */
    @Override
    public void keyPressed (KeyEvent e){
        if (e.getKeyCode() == KeyEvent.VK_RIGHT || e.getKeyCode() == KeyEvent.VK_D){
            if (Main.scene.getObjX() == -1)
                Main.scene.setObjX(0);
            Main.scene.mario.setWalk(true);
            Main.scene.mario.setGoRight(true);
            Main.scene.setMoveBx(1);

        }
        else if (e.getKeyCode() == KeyEvent.VK_LEFT || e.getKeyCode() == KeyEvent.VK_A){
            Main.scene.mario.setWalk(true);
            Main.scene.mario.setGoRight(false);
            Main.scene.setMoveBx(-1);
        }
        else  if (e.getKeyCode() == KeyEvent.VK_UP || e.getKeyCode() == KeyEvent.VK_SPACE || e.getKeyCode() == KeyEvent.VK_A){
            Main.scene.mario.setJump(true);
        }
    }

    /** This class is responsible for the keyboard inputs in the game
     * Mohamed Halat
     * June 15 2018
     */
    @Override
    public void keyReleased (KeyEvent e){

        if (e.getKeyCode() == KeyEvent.VK_RIGHT || e.getKeyCode() == KeyEvent.VK_D){
            Main.scene.mario.setWalk(false);
            Main.scene.setMoveBx(0);

        }
        else if (e.getKeyCode() == KeyEvent.VK_LEFT || e.getKeyCode() == KeyEvent.VK_A){
            Main.scene.mario.setWalk(false);
            Main.scene.setMoveBx(0);
        }
        else  if (e.getKeyCode() == KeyEvent.VK_RIGHT && e.getKeyCode() == KeyEvent.VK_LEFT){
            Main.scene.mario.setWalk(false);
            Main.scene.setMoveBx(0);
        }
    }

    // Not used
    @Override
    public void keyTyped(KeyEvent e){}
}
