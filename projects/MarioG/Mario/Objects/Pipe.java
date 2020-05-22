package Mario.Objects;
import javax.swing.*;
import java.awt.*;

/**Is in charge of all pipes
 * Mohamed Halat
 * June 15 2018
 */
public class Pipe extends Object
{
    //images
    private Image imgPipe;
    private ImageIcon iconPipe;
    int width, height;

    /**This method usses a super class to assign all the variables for pipes
     * parameters: x,y of pipes
     * no returns 
     */
    public Pipe (int x, int y, int width, int height){
        super(x,y,width, height);
        this.iconPipe = new ImageIcon ("pipe.png");
        this.imgPipe = this.iconPipe.getImage();
    }

    //getter
    public Image getImgPipe () {return imgPipe;}
}
