package Mario;
import javax.swing.*;
import java.awt.*;
import Mario.Characters.*;
import Mario.Objects.*;
import Mario.*;
import java.util.*;
import java.applet.*;
import java.net.*;

/**
 * Mohamed Halat
 * Friday June 15th
 * This class assembles the entire program and prints it to the frame
 */
public class Scene extends JPanel
{
    //Background images
    private ImageIcon iconBack;
    private Image imgBack1;
    private Image imgBack2;

    //static object images
    private ImageIcon iconLogo, iconArrow, iconCastle, iconCastleR, iconFloor;
    private Image imgLogo, imgArrow, imgCastle, imgCastleR, imgFloor;

    //character images
    private ImageIcon iconGoomba, iconMario;
    private Image imgGoomba, imgMario;
    public String strMario;
    public static String strMarioS;

    //Classes
    public Mario mario;
    public Mushroom[] mushroom;
    public Coins coin;
    public Goomba[] goomba;
    public Pipe[] pipe;
    public Block[] blocks;
    public itemBlock[] itemBlocks;

    //Clock thread
    Thread clockScreen;

    //background/ collisions
    private int backx1;
    private int backx2;
    private int objx; //
    private int moveBx; //keyboard input 
    private int ceillingY;
    private int floorY;
    public boolean falling;

    //score/checkers for coins
    public int score;
    public int numCoins;
    public boolean item; //which item block to print the coin from

    //Identifies which mario to print
    private boolean checker;
    private boolean checker2;
    private int addY;  //adjust collision: big is 0, small is 28 pixels smaller

    //Health
    private int health;
    private int healthTime; //used for animations
    private int numGoomba;  //which goomba injured mario

    //Animation/time
    private int time; //used for animations
    private long gameTime; //the printed time
    private long milliseconds; //System.currentTime()

    //number of every object/characters
    public int blocksNum = 2;
    public int itemBlocksNum = 3;
    public int pipesNum = 3;
    public int goombasNum = 3;
    public int mushroomsNum = 0;

    //Constants
    final public int screen = 869*2;
    final public int screenHeight = 232*2;
    final public int Floor = 400;
    final private int timeLimit = 55;

    /**Scene constructer
     *no returns
     *no parameters
     */
    public Scene (){
        this.backx1 = -50; //background x
        this.backx2 = screen-50; //background 2 x
        this.objx = -1; //Moves objects on screen
        this.moveBx = 0; //direction of movement
        this.ceillingY = -100;
        this.floorY = Floor;
        falling = false;

        //Choses which mario to print
        strMario = "marioSmall";
        this.strMarioS = strMario;

        //depending on the mario on screen, change his collisions
        checker = true;
        checker2 = true;
        addY = 0;

        //HUD
        health = 1;
        score = 0;
        numCoins = 0;
        milliseconds = System.currentTimeMillis();
        time = 0;


        Classes(); //calls classes
        Images();   //Assigns images

        //Jpanel + keyboard
        this.setFocusable(true);
        this.requestFocusInWindow();
        this.addKeyListener(new Keyboard());

        //Clock thread
        clockScreen = new Thread(new Clock());
        clockScreen.start();
    }

    /**Assigns the images for every print
     *no parameters
     *no returns as it only changes global variables
     */
    public void Images(){
        iconBack = new ImageIcon ("background.png"); //y 400 = floor
        imgBack1 = this.iconBack.getImage();
        imgBack2 = this.iconBack.getImage();

        iconLogo = new ImageIcon ("logo.png");
        imgLogo = this.iconLogo.getImage();
        iconArrow = new ImageIcon ("arrow.png");
        imgArrow = this.iconArrow.getImage();
        iconCastle = new ImageIcon ("Castle.png");
        imgCastle = this.iconCastle.getImage();
        iconCastleR = new ImageIcon ("castleRight.png");
        imgCastleR = this.iconCastleR.getImage();

        iconGoomba = new ImageIcon ("GoombaDead.png");
    }

    /**Calls the classes used in this program
     *no parameters
     *no returns as it only changes global variables
     */
    public void Classes(){
        mario = new Mario(200,Floor - 68, 40 ,68); //Mario

        blocksNum = 9;
        itemBlocksNum = 4;
        pipesNum = 5;
        goombasNum = 14;
        mushroomsNum = 1;

        //array of characters and objects
        blocks = new Block[blocksNum+1];
        itemBlocks = new itemBlock[itemBlocksNum+1];
        pipe = new Pipe[pipesNum+1];
        mushroom = new Mushroom[mushroomsNum+1];   
        goomba = new Goomba[goombasNum+1]; 
        coin = new Coins(-700,300);

        //Blocks in order of left to right
        blocks [0] = new Block(936,260);
        blocks [1] = new Block(1008,260);
        blocks [2] = new Block(1078,260);
        blocks [3] = new Block(2378,280);
        blocks [4] = new Block(4200,280);
        blocks [5] = new Block(4300,260);
        blocks [6] = new Block(4400,240);
        blocks [7] = new Block(4500,220);
        blocks [8] = new Block(4600,200);
        blocks [9] = new Block(4700,180);

        //Item Blocks in order of left to right
        itemBlocks [0] = new itemBlock(800,260);
        itemBlocks [1] = new itemBlock(1008,100);
        itemBlocks [2] = new itemBlock(2900,260);
        itemBlocks [3] = new itemBlock(3300,260);
        itemBlocks [4] = new itemBlock(3360,220);

        //Pipes in order of left to right
        pipe[0] = new Pipe (1300,400-96, 64, 96);
        pipe[1] = new Pipe (1800,400-96, 64,96);
        pipe[2] = new Pipe (2200,400-144, 96,144 );
        pipe[3] = new Pipe (2600,400-96, 64,96);
        pipe[4] = new Pipe (3500,400-288, 192,288);
        pipe[5] = new Pipe (4800,400-288, 192,288);

        //Goomba in order of left to right
        goomba[0] = new Goomba(1400,Floor-40);
        goomba[1] = new Goomba(1750,Floor-40);
        goomba[2] = new Goomba(1850,Floor-40);
        goomba[3] = new Goomba(2250,Floor-40);
        goomba[4] = new Goomba(2380,Floor-40);
        goomba[5] = new Goomba(2400,Floor-40);
        goomba[6] = new Goomba(2550,Floor-40);
        goomba[7] = new Goomba(2680,Floor-40);
        goomba[8] = new Goomba(2750,Floor-40);
        goomba[9] = new Goomba(2700,Floor-40);
        goomba[10] = new Goomba(2850,Floor-40);
        goomba[11] = new Goomba(2990,Floor-40);
        goomba[12] = new Goomba(3130,Floor-40);
        goomba[13] = new Goomba(3300,Floor-40);
        goomba[14] = new Goomba(5000,Floor-40);

        for (int i = 0; i <= goombasNum; i++)
            if (i%2 == 0){this.goomba[i].setGoRight(true);}
            else{this.goomba[i].setGoRight(true);}

        //Mushrooms
        mushroom[0] = new Mushroom(1750,Floor-30);
        mushroom[1] = new Mushroom(2450,Floor-30);
    }

    /**Is called by mario class to reset the location of coin after mario hits a block
     *x and y are the positions of the coin
     *no returns as it only changes setters on another class
     */
    public void coins(int x, int y){coin = new Coins(x+3,y);}

    //getters
    public int getMoveBx(){return moveBx;}

    public int getObjX(){return objx;}

    public int getCeillingY(){return ceillingY;}

    public int getFloorY(){return floorY;}

    public int getAddY(){return addY;}

    public int getNumGoomba(){return numGoomba;}

    //setters
    public void setMoveBx(int moveBx){this.moveBx = moveBx;}

    public void setimgMario(Image imgMario){this.imgMario = imgMario;}

    public void setObjX(int objx){this.objx = objx;}

    public void setCeillingY(int ceillingY){this.ceillingY = ceillingY;}

    public void setFloorY(int floorY){this.floorY = floorY;}

    /**This method sets and carries out collision  
     * no parametes as everything are passed in through global variables and methods/classes
     *no returns as it only changes global variables and setters
     */
    public void collisions(){

        //Mario Collisions for blocks
        if (this.mario.closeTo(blocks[0])) this.mario.contact(blocks[0]);
        else if (this.mario.closeTo(blocks[1])) this.mario.contact(blocks[1]);
        else if (this.mario.closeTo(blocks[2])) this.mario.contact(blocks[2]);
        else if (this.mario.closeTo(blocks[3])) this.mario.contact(blocks[3]);
        else if (this.mario.closeTo(blocks[4])) this.mario.contact(blocks[4]);
        else if (this.mario.closeTo(blocks[5])) this.mario.contact(blocks[5]);
        else if (this.mario.closeTo(blocks[6])) this.mario.contact(blocks[6]);
        else if (this.mario.closeTo(blocks[7])) this.mario.contact(blocks[7]);
        else if (this.mario.closeTo(blocks[8])) this.mario.contact(blocks[8]);
        else if (this.mario.closeTo(blocks[9])) this.mario.contact(blocks[9]);

        //Mario collisinos for item blocks
        else if (this.mario.closeTo(itemBlocks[0])){
            item = true;
            this.mario.contact(itemBlocks[0]);}
        else if (this.mario.closeTo(itemBlocks[1])){
            item = true;
            this.mario.contact(itemBlocks[1]);}
        else if (this.mario.closeTo(itemBlocks[2])){
            item = true;
            this.mario.contact(itemBlocks[2]);}
        else if (this.mario.closeTo(itemBlocks[3])){
            item = true;
            this.mario.contact(itemBlocks[3]);}
        else if (this.mario.closeTo(itemBlocks[4])){
            item = true;
            this.mario.contact(itemBlocks[4]);}

        //Mario collisinos for pipes
        else if (this.mario.closeTo(pipe[0]))this.mario.contact(pipe[0]);  
        else if (this.mario.closeTo(pipe[1]))this.mario.contact(pipe[1]);  
        else if (this.mario.closeTo(pipe[2]))this.mario.contact(pipe[2]);  
        else if (this.mario.closeTo(pipe[3]))this.mario.contact(pipe[3]);  
        else if (this.mario.closeTo(pipe[4]))this.mario.contact(pipe[4]);  
        else if (this.mario.closeTo(pipe[5]))this.mario.contact(pipe[5]);  

        //if he isn't touching anything make him fall or touch the floor
        else{
            if (mario.getJump() == false){
                mario.Fall("marioSmall");
                falling = true;
            }
            ceillingY = -100;
            floorY = Floor;
        }
        item = false; // Coins

        //Set marios health 
        if (mario.health == 2){
            health = 1;
            healthTime = time;
        }
        else if (mario.health == 1 && healthTime < time-100){
            health = 0;
            healthTime = time;
        }

        //Collisions for goombas and decrease health
        for (int i = 0; i <= goombasNum; i++){
            this.numGoomba = i;
            for (int n = 0; n <= pipesNum; n++)
                if (this.goomba[i].closeTo(pipe[n]))
                    this.goomba[i].contactTo(pipe[n]);

            if (goomba[i].getHealth(i) != 0 && this.mario.closeTo(goomba[i])){
                this.mario.contact(goomba[i],health);
            }

            if (goomba[i].getHealth(i) != 0 && this.goomba[i].closeTo(mario)){
                this.goomba[i].contactTo(mario);
            }
        }

        //Collisions for mushrooms and increase health
        for (int i = 0; i <= mushroomsNum; i++)
            if ( this.mario.closeTo(mushroom[i]) && this.mario.health == 1){
                this.mario.contact(mushroom[i],2);
                mushroom[i].setY(600);
                score += 200;
            }

        //Collisions for mushrooms against pipes
        for (int i = 0; i <= mushroomsNum; i++)
            for (int n = 0; n <= pipesNum; n++)
                if (this.mushroom[i].closeTo(pipe[n]))
                    this.mushroom[i].contactTo(pipe[n]);

        //collisions for goombas against goombas
        for (int i = 0; i <= goombasNum; i++)
            for (int n = 0; n <= goombasNum; n++)
                if (n == i){}
                else if (this.goomba[i].closeTo(goomba[n]) && goomba[i].getHealth(i) != 0 && goomba[n].getHealth(n) != 0)
                    this.goomba[i].contactTo(goomba[n]);
    }

    /**This method displaces everything on the screen
     * no parametes as everything are passed in through global variables and methods/classes
     *no returns as it only changes global variables and setters
     */
    public void backgroundMovement(){
        //moves the background depending on which key is pressed
        if (this.objx >= 0){
            this.backx1 = this.backx1 - this.moveBx;
            this.backx2 = this.backx2 - this.moveBx;
            this.objx = this.objx + this.moveBx;
        }

        //Makes the screen infinite
        if (this.backx1 == -screen) this.backx1 = screen;
        else if (this.backx2 == -screen) this.backx2 = screen;
        else if (this.backx1 == screen) this.backx1 = -screen;
        else if (this.backx2 == screen) this.backx2 = -screen;

        // Allows Mushrooms to move
        for (int i = 0; i<= mushroomsNum; i++)
            this.mushroom[i].move();

        //Moves everything on screen to follow the movements of the screen
        this.coin.deplacement();
        for (int i = 0; i <= mushroomsNum; i++)
            this.mushroom[i].deplacement();
        for (int i = 0; i <= blocksNum; i++)
            this.blocks[i].deplacement();
        for (int i = 0; i <= itemBlocksNum; i++)
            this.itemBlocks[i].deplacement();
        for (int i = 0; i <= pipesNum; i++)
            this.pipe[i].deplacement();
        for (int i = 0; i <= goombasNum; i++)
            this.goomba[i].deplacement();
    }

    /**This method draws everything except mario
     * Graphics and everything else is passed in through global variables and methods/classes
     *no returns as it only changes global variables and setters and is printed
     */
    public void Drawing(Graphics g2){
        //Two background images to make the background infinite
        g2.drawImage(this.imgBack1, this.backx1, 0,screen,screenHeight, null);
        g2.drawImage(this.imgBack2, this.backx2, 0,screen,screenHeight, null);

        //Drawing objects that don't have any influence on game (no collisions) 
        g2.drawImage(this.imgLogo, 60-this.objx, 30, 360, 200, null);
        g2.drawImage(imgArrow, 700 -this.objx, 350, 50, 50, null);
        g2.drawImage(imgCastle, 5700-this.objx, 203, 250, 200, null);

        //Draws text at the begining and in the HUD
        g2.drawString("Description: Get to the castle while", 450 -this.objx, 60);
        g2.drawString("trying to survive by avoiding ennemies", 450 -this.objx, 80);
        g2.drawString("or jump on their heads to kill them.", 450 -this.objx, 100);
        g2.drawString("Falling on them can't kill them and ", 450 -this.objx, 120);
        g2.drawString("will result in your injury. Hurry and", 450 -this.objx, 140);
        g2.drawString("coins along the way to increase score", 450 -this.objx, 160);
        g2.drawString("By: Mohamed Halat", 80-this.objx, 250);

        //Draws the Time portion of the HUD
        time++;
        gameTime = System.currentTimeMillis();
        g2.drawString("Time: " + (timeLimit-(gameTime-milliseconds)/1000), 100, 20);
        g2.drawString("Coins: " + numCoins, 700,20);
        g2.drawString("Score: " + score, 600, 20);
        //Health part of HUD
        if (mario.health == 0)
            g2.drawString("GameOver", screen/2, 20);
        else
            g2.drawString("Health: " + mario.health + "/2", 10, 20);

        //Coins HUD
        if (coin.getX() !=-700){
            coin.setY(coin.getY()-2);
            g2.drawImage(this.coin.getImgCoin(), coin.getX(), coin.getY(), 30, 30, null);
        }

        //Draws all objects and characters except mario
        for (int i = 0; i <= mushroomsNum; i++)
            g2.drawImage(this.mushroom[i].getImgMushroom(), this.mushroom[i].getX(), this.mushroom[i].getY(),30, 30, null);
        for (int i = 0; i <= blocksNum; i++)
            g2.drawImage(this.blocks[i].getImgBlock(), this.blocks[i].getX(), this.blocks[i].getY(),36, 36, null);
        for (int i = 0; i <= itemBlocksNum; i++)
            g2.drawImage(this.itemBlocks[i].getImgItemBlock(), this.itemBlocks[i].getX(), this.itemBlocks[i].getY(),36, 36, null);
        for (int i = 0; i <= pipesNum; i++)
            g2.drawImage(this.pipe[i].getImgPipe(),this.pipe[i].getX(), this.pipe[i].getY(),this.pipe[i].getWidth(),this.pipe[i].getHeight(),null);
        for (int i = 0; i <= goombasNum; i++)
            g2.drawImage(this.goomba[i].walk("goomba",25), this.goomba[i].getX(), this.goomba[i].getY(), 40, 40, null);
    }

    /**This method sets which mario to print
     * no parametes as everything are passed in through global variables and methods/classes
     *no returns as it only changes global variables and setters
     */
    public void marioPrint(){
        strMario = mario.health(); //gets mario's health
        //changes mario's hitbox accordingly
        if (strMario.equals("marioSmall") && checker){
            checker = false;
            addY = 28;
            checker2=true;
        }
        else if (strMario.equals("mario") && checker2){
            addY = 0;
            checker2 = false;
            checker = true;
        }
    }

    /**This method print everything through Graphics2D 
     * Graphics are used and everything else is passed in through global variables and methods/classes
     * No returns as it prints
     */
    public void paintComponent (Graphics g){
        super.paintComponent(g);
        Graphics g2 = (Graphics2D)g;

        //Made it to the end of the map
        if (mario.getX() >= 5700+138 -this.objx){
            g.fillRect(0,0,1000,1000);
            g2.setColor(Color.WHITE);
            g2.drawString("You Win", 10, 20);
            g2.drawString("Score: "+score, 10, 30);
        }
        //Gameover
        else if (health == 0 && mario.health == 0 && healthTime+500 < time ){
            g.fillRect(0,0,1000,1000);
            g2.setColor(Color.WHITE);
            g2.drawString("GameOver", 10, 20);

        }

        //When mario dies
        else if (mario.health == 0 || (timeLimit -(gameTime-milliseconds)/1000) < 0) {
            collisions();
            Drawing(g2);
            mario.health = 0;
            if (healthTime+200 < time)
                mario.setY(mario.getY()+1);
            g2.drawImage(new ImageIcon ("marioDead.png").getImage(), this.mario.getX(), this.mario.getY()+30, 40, 40, null);
        }
        //Drawing the game
        else{
            marioPrint();
            collisions();
            backgroundMovement();
            Drawing(g2);
            //if mario is jumping or walking
            if (this.mario.getJump())
                g2.drawImage(this.mario.jump(strMario), this.mario.getX(), this.mario.getY(), 40, 68, null);
            else
                g2.drawImage(this.mario.walk(strMario,25), this.mario.getX(), this.mario.getY(), 40, 68, null);
            g2.drawImage(imgCastleR, 5700+136 -this.objx , 203,112,200, null);
        }
    }
}
