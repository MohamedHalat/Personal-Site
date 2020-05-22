package Mario.Characters;
import java.awt.*;
import javax.swing.*;
import Mario.Objects.Object;
import Mario.Characters.Character;

/**Is in charge of all mushrooms
 * Mohamed Halat
 * June 15 2018
 */
public class Mushroom extends Character
{
    //images
    private Image imgMushroom;
    private ImageIcon iconMushroom;
    //position and size
    private int x,y,width,height;

    /**This method usses a super class to assign all the variables for mushrooms
     * parameters: x,y of mushrooms
     * no returns 
     */
    public Mushroom (int x, int y){
        super(x,y,30,30);
        this.iconMushroom = new ImageIcon ("Mushroom.png");
        this.imgMushroom = this.iconMushroom.getImage();
        this.setWalk(true);
        this.x = x;
        this.y = y;
        this.width = 30;
        this.height=30;
    }

    //getter
    public Image getImgMushroom () {return imgMushroom;}

    /**This method checks to see if mushroom is touching objects
     * parameters: object to check collisions with
     * no returns 
     */
    public void contactTo(Object object){
        if (frontContact(object) == true && this.goRight== true){this.goRight= false;}
        else if (backContact(object) && goRight ==false){this.goRight = true;}
    }
}
