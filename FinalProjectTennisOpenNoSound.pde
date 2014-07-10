/* @pjs preload = "raquet.png";*/
/* @pjs preload = "raquet2.png";*/
/* @pjs preload = "court.png";*/
PImage RACQUET;
PImage RACQUET2;
PImage COURT;
Ball play;
int racX = 500;
int racY = 571;
int score = 0;
int XSPEED = 1;
int YSPEED = -1;
void setup()
{
  size(1000, 600);
  RACQUET = loadImage("racquet.png");
  RACQUET2 = loadImage("racquet2.png");
  COURT = loadImage("court.png");
  play = new Ball(color(73, 232, 111), 500, 300, XSPEED, YSPEED);
  frameRate(1000);
}  
void draw()
{
  background(COURT);
  imageMode(CENTER);
  image(RACQUET, racX, racY);
  imageMode(CORNER);  
  image(RACQUET2, play.xpos-45, 0);
  play.display();
  play.move();
  fill(0);
  textSize(32);
  textMode(CENTER);
  text(score, 500, 100);
  if(score==10)
  {
    play.xpos = 500;
    play.ypos = 300;
    play.xspeed = 0;
    play.yspeed = 0;
    fill(0, 0, 255);
    text("YOU WIN!", 445, 140);
  }
}
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      racX-=15;
    }
    if (keyCode == RIGHT)
    {
      racX+=15;
    }
  }
}
  class Ball
  {
    color c;
    int xpos;
    int ypos;
    int xspeed;
    int yspeed;
    Ball(color tempC, int tempXpos, int tempYpos, int tempXspeed, int tempYspeed){
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    yspeed = tempYspeed;  
    }
  
    void display(){
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,15,15); 
    }
  
    void move(){
      xpos += xspeed;
      ypos += yspeed;
    //side collision
      if(xpos > width - 15){
      xspeed = -1 * xspeed;
      }  
      if(xpos < 10){
      xspeed = -1 * xspeed; 
      }
    //top and bottom collision
      if(ypos > height - 15){
      fill(255, 0, 0);
      text("YOU LOSE!", 435, 140); 
      }
      if(ypos< 45){
      yspeed = -1 * yspeed;
      }
    //racquet collision
    if(xpos>racX-47 && xpos<racX-19 && ypos>565 && ypos<600 && score!=10)
    {
      xspeed*=1;
      yspeed*=-1;
      score++;
    }
    if(xpos>racX-19 && xpos<racX+10 && ypos>565 && ypos<600 && score!=10)
    {
      xspeed*=-1;
      yspeed*=-1;
      score++;
    }
    }
  }

