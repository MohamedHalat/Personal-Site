package Mario.Characters;

//imports
import Mario.*;
import java.awt.*;
import javax.swing.*;
import Mario.Objects.Object;

/**This class usses a super class to assign all the variables for every character
 * Mohamed Halat
 * June 15 2018
 */
public class Character
{
    //x,y,width and height of the character
    private int width, height;
    private int x,y;
    public boolean walk, goRight;    //If the character is moving and is going rigtht or left
    public int counter;    //animation rate of characters

    /**This method usses a super class to assign all the variables for every character
     * parameters: x,y,width and height of every character
     * no returns 
     */
    public Character(int x, int y, int width, int height){
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.counter = 0;
        this.walk = false;
        this.goRight = true;
    }

    //getters
    public int getX(){return x;}

    public int getY(){return y;}

    public int getWidth(){return width;}

    public int getHeight(){return height;}

    public int getCounter(){return counter;}

    //Setters
    public void setX(int x){this.x = x;}

    public void setY(int y){this.y = y;}

    public void setWalk(boolean walk){this.walk = walk;}

    public void setGoRight(boolean goRight){this.goRight = goRight;}

    public void setCounter(int counter){this.counter = counter;}

    /**Assigns the images to print based on walking cyle
     *name is the name of the the character being printed, amount is the refresh rate of the animation, global variables and getters
     *returns the image to print
     */
    public Image walk (String name, int amount){
        String str = name + "RightStill.png";
        ImageIcon icon;
        Image img;

        //if the character is still, print associated image 
        if (this.walk == false || Main.scene.getObjX() == -50){
            if (this.goRight == true) str = name + "RightStill.png";
            else str = name + "LeftStill.png";
            //if character is goomba print associated image 
            if (name == "goomba"){
                str = name+"Dead.png";
                Goomba.setHealth(0,Main.scene.getNumGoomba());
            }
        }
        //if the character is moving, print associated image 
        else{  
            //Changes the x of goomba, makes him move
            if (name == "goomba"){
                if (this.goRight == false)
                    this.x--;
                else
                    this.x++;
            }

            //Walking animation
            this.counter++;
            if (this.counter/amount==0)
                if (this.goRight) str = name + "RightStill.png";
                else str = name + "LeftStill.png";
            else {
                if (this.goRight) str = name + "Right.png";
                else str = name + "Left.png";}
            if (this.counter  == 2*amount){
                this.counter = 0;}
        }
        //return
        icon = new ImageIcon(str);
        return  img = icon.getImage();
    }

    /**Makes the mushroom move
     *no parameters as it only uses global variables and getters
     *no returns as it only changes global variables
     */
    public void move(){
        if (this.goRight == false)
            this.x--;
        else
            this.x++;
    }

    /**Makes the characters move on the background and not on the screen
     *no parameters as it only uses global variables and getters
     *no returns as it only changes global variables
     */
    public void deplacement(){
        if (Main.scene.getObjX() >= 0)
            this.x -= Main.scene.getMoveBx();
    }

    //Collisions
    /**if the hitbox of the character is hitting the left side of anything
     *the object the character is hitting
     *returns if they are colliding
     */
    public boolean frontContact(Object object){
        if (this.x + this.width < object.getX()+5 
        || this.x >= object.getX() + 5
        || this.y + this.height  <= object.getY() + 5 
        || this.y >= object.getY() + object.getHeight())
            return false;
        return true;
    }

    /**if the hitbox of the character is hitting the right side of anything
     *the object the character is hitting
     *returns if they are colliding
     */
    public boolean backContact(Object object){
        if (this.x >= object.getWidth() + object.getX() -5
        || this.x + this.width <= object.getWidth() + object.getX() -10
        || this.y + this.height  <= object.getY() + 5 
        || this.y >= object.getY() + object.getHeight())
            return false;
        return true;
    }

    /**if the hitbox of the character is hitting the top side of anything
     *the object the character is hitting
     *returns if they are colliding
     */
    public boolean topContact(Object object){
        if (this.x + this.width <= object.getX() +5
        || this.x >= object.getX() + object.getWidth() -5
        || this.y + this.height <= object.getY() 
        || this.y + this.width >= object.getY())
            return false;
        return true;
    }

    /**if the hitbox of the character is hitting the bottom side of anything
     *the object the character is hitting
     *returns if they are colliding
     */
    public boolean bottomContact(Object object){
        if (this.x + this.width <= object.getX() + 5 
        || this.x >= object.getX() + object.getWidth() - 5
        || this.y + this.height <= object.getY() 
        || this.y <= object.getY() + object.getHeight())
            return false;
        return true;
    }

    /**if the hitbox of the character is approaching any objects, used to make sure he cant collide with multiple things at once
     *the object the character is hitting
     *returns if they are close
     */
    public boolean closeTo (Object object){
        if (this.x >= object.getX() - this.width - 10 && this.x <= object.getX() + object.getWidth() + 10 && this.y + this.height >= object.getY() -10&& this.y <= object.getY()+ object.getHeight() + 10)
            return true;
        return false;
    }

    //Repetition code but checks if two characters are colliding instead of a character and an object

    /**if the hitbox of the character is hitting the left side of anything
     *the object the character is hitting
     *returns if they are colliding
     */
    public boolean frontContact(Character character){
        if (this.x + this.width < character.getX()+5 
        || this.x >= character.getX() + 5
        || this.y + this.height  <= character.getY() + 5 
        || this.y >= character.getY() + character.getHeight())
            return false;
        return true;
    } 

    /**if the hitbox of the character is hitting the right side of anything
     *the object the character is hitting
     *returns if they are colliding
     */
    public boolean backContact(Character object){
        if (this.x >= object.getWidth() + object.getX() -5
        || this.x + this.width <= object.getWidth() + object.getX() -10
        || this.y + this.height  <= object.getY() + 5 
        || this.y >= object.getY() + object.getHeight())
            return false;
        return true;
    }

    /**if the hitbox of the character is hitting the bottom side of anything
     *the object the character is hitting
     *returns if they are colliding
     */
    public boolean topContact(Character object){
        if (this.x + this.width <= object.getX() +5
        || this.x >= object.getX() + object.getWidth() -5
        || this.y + this.height <= object.getY() 
        || this.y + this.width >= object.getY())
            return false;
        return true;
    }

    /**if the hitbox of the character is hitting the top side of anything
     *the object the character is hitting
     *returns if they are colliding
     */
    public boolean bottomContact(Character object){
        if (this.x + this.width <= object.getX() + 5 
        || this.x >= object.getX() + object.getWidth() - 5
        || this.y + this.height <= object.getY() 
        || this.y <= object.getY() + object.getHeight())
            return false;
        return true;
    }

    /**if the hitbox of the character is approaching any objects, used to make sure he cant collide with multiple things at once
     *the object the character is hitting
     *returns if they are close
     */
    public boolean closeTo (Character object){
        if (!(this.x >= object.getX() - this.width - 10 && this.x <= object.getX() + object.getWidth() + 10 && this.y + this.height >= object.getY() -10&& this.y <= object.getY()+ object.getHeight() + 10))
            return false;
        return true;
    }
}
