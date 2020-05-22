package Mario.Objects;
import java.awt.*;
import javax.swing.*;

/**Is in charge of all blocks
 * Mohamed Halat
 * June 15 2018
 */
public class Block extends Object
{
    //images
    private Image imgBlock;
    private ImageIcon iconBlock;

    /**This method usses a super class to assign all the variables 
     * parameters: x,y 
     * no returns 
     */
    public Block (int x, int y){
        super(x,y,36,36);
        this.iconBlock = new ImageIcon ("block.png");
        this.imgBlock = this.iconBlock.getImage();
    }

    //getters
    public Image getImgBlock () {return imgBlock;}
}
