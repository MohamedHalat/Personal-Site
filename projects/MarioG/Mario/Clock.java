package Mario;

/**Is the delay that reprint paintComponent after every 4 ticks
 * Mohamed Halat
 * June 15 2018
 */
public class Clock implements Runnable
{
    private int Delay = 4;//amount of ticks till refresh

    @Override
    /**Class called by scene to refresh the screen
     * no parameters
     * no returns 
     */
    public void run(){
        while (true){
            Main.scene.repaint();
            try{
                Thread.sleep(Delay);
            }catch (InterruptedException e){}
        }
    }
}
