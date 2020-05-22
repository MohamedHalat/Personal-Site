package Mario.Objects;
import java.awt.*;
import javax.swing.*;
import Mario.Characters.Character;

/**Is in charge of all item blocks
 * Mohamed Halat
 * June 15 2018
 */
public class itemBlock extends Object
{
    //imaegs
    private Image imgItemBlock;
    private ImageIcon iconItemBlock;

    //position and size
    private int x;
    private int y;
    private int width;
    private int height;

    /**This method usses a super class to assign all the variables 
     * parameters: x,y
     * no returns 
     */
    public itemBlock (int x, int y){
        super(x,y,36,36);
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;

        this.iconItemBlock = new ImageIcon ("itemBlock.png");
        this.imgItemBlock = this.iconItemBlock.getImage();
    }

    //getter
    public Image getImgItemBlock () {return imgItemBlock;}
}
