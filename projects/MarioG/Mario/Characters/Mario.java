package Mario.Characters;
import java.awt.*;
import javax.swing.*;
import Mario.*;
import Mario.Objects.Object;
import Mario.Objects.Coins;
import Mario.Objects.itemBlock;
import Mario.Characters.*;

/**Is in charge of mario
 * Mohamed Halat
 * June 15 2018
 */
public class Mario extends Character
{
    //images
    private Image imgMario;
    private ImageIcon iconMario;

    private boolean jump; //if jump
    private int jumpCounter; // height
    private boolean coinChecker; // if coins
    public int health; // marios health 

    /**This method usses a super class to assign all the variables for mario
     * parameters: x,y, width and height of mario
     * no returns 
     */
    public Mario (int x, int y, int width, int height){
        super(x,y,width,height);
        health = 1;
        this.jump = false;
        this.jumpCounter = 0;
        this.coinChecker = true;
    }

    //getters 
    public Image getImgMario () {return imgMario;}

    public boolean getJump() {return jump;}

    public int getJumpCounter() {return jumpCounter;}

    //Setters
    public void setJump(boolean jump){this.jump = jump;}

    public void setJumpCounter(int jumpCounter){this.jumpCounter = jumpCounter;}

    //Methods
    /**This method changes mario's image depends on his health, 1 is small 2 is big
     * no parameters
     * returns mario's image
     */
    public String health(){
        if (health == 2)
            return "mario";
        if (health == 1)
            return "marioSmall";
        return "marioSmall";
    }

    /**This method is responsible for mario falling
     * name of mario, small or big
     * returns mario's jump image
     */
    public String Fall(String name){
        String str;

        //if he is going left or right while falling
        if (this.goRight) str = name +"RightJump.png";
        else str = name +"LeftJump.png";
        //fall animation
        if (this.getY() + this.getHeight() <= Main.scene.getFloorY()){ 
            this.setY(this.getY() + 2);
            if (this.goRight) str = name +"RightJump.png";
            else str = name +"LeftJump.png";
        }
        //reset variables
        else {
            this.jumpCounter = 0;
            this.jump = false;
        }
        return str;
    }

    /**This method is responsible for mario jumping
     * name of mario, small or big
     * returns mario's jump image
     */
    public Image jump(String name){
        ImageIcon icon;
        String str = name+"RightStill.png";

        //marios jump animation
        this.jumpCounter++;
        if (this.jumpCounter <= 65 && jumpCounter != -1){
            if (this.getY() > Main.scene.getCeillingY()) this.setY(this.getY()-3);
            if (this.goRight) str = name +"RightJump.png";
            else str = name +"LeftJump.png";
        }
        //fall when done jumping
        else if (this.getY() + this.getHeight() <= Main.scene.getFloorY()){ 
            str = Fall(name);
        }
        //reset when on the floor
        else {
            if (this.goRight) str = name +"RightStill.png";
            else str = name +"LeftStill.png";
            this.jumpCounter = 0;
            this.jump = false;
        }
        //return image
        icon = new ImageIcon (str);
        return icon.getImage();
    }

    /**This method checks to see if mario is touching an object
     * parameters:object to check collisions with
     * no returns 
     */
    public void contact(Object object){
        //if he touches the front of object
        if (super.frontContact(object) == true && this.goRight== true || super.backContact(object) && goRight ==false){
            Main.scene.setMoveBx(0);
            this.setWalk(false);
        }
        //if he touches the top of object

        if (super.topContact(object) == true && this.jump == true){Main.scene.setFloorY(object.getY());}
        else if (super.topContact(object) == false){
            Main.scene.setFloorY(400);
            if (this.jump == false)Fall("mario");
        }

        //if he touches the back of object
        if (super.bottomContact(object) == true){
            if (Main.scene.item && this.coinChecker){
                this.coinChecker = false;
                Main.scene.coins(object.getX(), object.getY());
                Main.scene.score+=100;
                Main.scene.numCoins+=1;
            }
            Main.scene.setCeillingY(object.getY() + object.getHeight()-Main.scene.getAddY());
        }

        //if he touches the bottom of object
        else if (super.bottomContact(object) == false && this.jump ==false){
            this.coinChecker = true;
            Main.scene.setCeillingY(-100 - Main.scene.getAddY());
        }
    }

    /**This method checks to see if mario is touching a character (goomba or mushroom)
     * parameters:object to check collisions with
     * no returns 
     */
    public void contact(Character object, int i){
        //if he touches the front of character
        if (super.frontContact(object) == true && this.goRight == true|| super.backContact(object) == true && this.goRight == false){
            Main.scene.setMoveBx(0);
            health = i;
        }

        //if he touches the top of character
        if (super.topContact(object) == true){
            health = i;
            object.setWalk(false);
            this.jump=true;
            Main.scene.score+=500;
        }
        //if he doesn't touches the top of character
        else if (super.topContact(object) == false){
            if (this.jump == false){
                this.setY(400 - this.getHeight());
                health = i;
            }
            else {
                Goomba.setHealth(0,Main.scene.getNumGoomba());
                if (i == 2){health = i;}
                else object.setWalk(false);
            }
        }

        //if he touches the bottom of character
        if (super.bottomContact(object) == true){
            health = i;
            Main.scene.setCeillingY(object.getY() + object.getHeight()-Main.scene.getAddY());
        }
        else if (super.bottomContact(object) == false && this.jump == false){
            Main.scene.setCeillingY(0 - Main.scene.getAddY());
        }
    }
}
