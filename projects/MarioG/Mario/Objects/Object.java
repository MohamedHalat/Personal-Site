package Mario.Objects;
import Mario.*;
import Mario.Characters.Character;

/**This class usses a super class to assign all the variables for every object
 * Mohamed Halat
 * June 15 2018
 */
public class Object
{
    //position and size
    private int width, height;
    private int x,y;

    /**This method usses a super class to assign all the variables for every object
     * parameters: x,y,width and height of every object
     * no returns 
     */
    public Object(int x, int y, int width, int height)
    {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }

    //getters
    public int getX(){return x;}

    public int getY(){return y;}

    public int getWidth(){return width;}

    public int getHeight(){return height;}

    //Setters
    public void setX(int x){this.x = x;}

    public void setY(int y){this.y = y;}

    public void setWidth(int width){this.width = width;}

    public void setHeight(int height){this.height = height;}

    //Methods
    
    public void deplacement(){
        if (Main.scene.getObjX() >= 0)
            this.x = this.x - Main.scene.getMoveBx();
    }

    public boolean topContact(Character object){
        if (this.x + this.width <= object.getX() +5
        || this.x >= object.getX() + object.getWidth() -5
        || this.y + this.height <= object.getY() 
        || this.y + this.width >= object.getY())
            return false;
        return true;
    }

}
