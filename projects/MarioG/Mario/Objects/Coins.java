package Mario.Objects;
import java.awt.*;
import javax.swing.*;
import Mario.Main;

/**Is in charge of all coins
 * Mohamed Halat
 * June 15 2018
 */
public class Coins extends Object
{
    //images
    private Image imgCoin;
    private ImageIcon iconCoin;
    //postion
    public int x;
    public int y;

    /**This method usses a super class to assign all the variables 
     * parameters: x,y
     * no returns 
     */
    public Coins (int x, int y){
        super(x,y,36,36);
        this.x = x;
        this.y = y;
        this.iconCoin = new ImageIcon ("Coin.png");
        this.imgCoin = this.iconCoin.getImage();
    }

    /**Makes the coins move on the background and not on the screen. Wouldn't work thru the object class for some reason
     *no parameters
     *no returns 
     */
    public void deplacement(){
        if (Main.scene.getObjX() >= 0)
            this.x = this.x - Main.scene.getMoveBx();
    }

    //setters
    public void setX(int x){this.x = x;}

    public void setY(int y){this.y = y;}

    //getters
    public int getY(){return this.y;}

    public int getX(){return this.x;}

    public Image getImgCoin () {return imgCoin;}
}

