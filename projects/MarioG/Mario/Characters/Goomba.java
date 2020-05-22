package Mario.Characters;
import java.awt.*;
import javax.swing.*;
import Mario.*;
import Mario.Objects.Object;
import Mario.Characters.Character;

/**Is in charge of all goombas
 * Mohamed Halat
 * June 15 2018
 */
public class Goomba extends Character
{
    //images
    private Image imgGoomba;
    private ImageIcon iconGoomba;
    //health of goombas
    private static int[] health = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,};

    /**This method usses a super class to assign all the variables for goombas
     * parameters: x,y of goombas
     * no returns 
     */
    public Goomba (int x, int y){
        super(x,y,40,40);
        this.iconGoomba = new ImageIcon ("GoombaRightStill.png");
        this.imgGoomba = this.iconGoomba.getImage();
        this.setWalk(true);
    }

    //getters 
    public Image getImgGoomba () {return imgGoomba;}

    public static int getHealth(int i) {return health[i];}

    //Setters
    public void setImgGoomba (Image imgGoomba) { this.imgGoomba = imgGoomba;}

    public static void setHealth (int Gethealth, int i) {health[i] = Gethealth;}

    /**This method checks to see if goomba is touching an object
     * parameters:object to check collisions with
     * no returns 
     */
    public void contactTo(Object object){
        if (frontContact(object) == true && this.goRight== true){this.goRight= false;} //colision on the right
        else if (backContact(object) && goRight ==false){this.goRight = true;} //colision on the left
    }

    /**This method checks to see if goomba is touching mario
     * parameters: character/mario to check collisions with
     * no returns 
     */
    public void contactTo(Character object){
        if (frontContact(object) == true && this.goRight== true){this.goRight= false;}
        else if (backContact(object) && goRight == false){this.goRight = true;}
    }
}
