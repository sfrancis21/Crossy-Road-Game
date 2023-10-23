import processing.sound.*;
SoundFile song;
Blob b;
Bomb y;
Bomb x;
int MAX=5;
int MAXLOG=3;
int deathCount;
int levelCount;
boolean onLog;
car[] mycar=new car[MAX];
Log[] mylog=new Log[MAXLOG];
void setup() {
  size(1250, 750);
  frameRate(12);

  //Creating new Cars and Logs
  for (int i=0; i<MAX; i++) {
    mycar[i]=new car();
  }
  for (int k=0; k<MAXLOG; k++) {
    mylog[k]=new Log();
  }
  b=new Blob();
  y=new Bomb();
  x=new Bomb();
  deathCount=5;
  levelCount=0;
}

void draw() {
  frameRate(12+levelCount);
  background(#00FF00);
  //Level and Life Count
  textAlign(CENTER);
  fill(0);
  textSize(20);
  text("Lives:"+ deathCount, 50, 50);
  text("Level:"+ levelCount/5, 1200, 50);
  //Draws River and Road
  river(625, 260, 1250, 225, 10);
  road(625, 570, 1250, 240);
  //Drawing Bombs
  y.DrawBomb();
  x.DrawBomb();
  //Drawing Logs
    onLog=false;
  for (int k=0; k<MAXLOG; k++) {
    mylog[k].yLog=190;
    mylog[k].DrawTopLog();
    mylog[k].yLog=345;
    mylog[k].DrawTopLog();
    mylog[k].yLog=275;
    mylog[k].DrawMidLog();
    mylog[k].LogSpeed();
    //Making Blob Follow Top and Bottom Log when jumped on
    if (((b.yBlob+b.wBlob/2<=220)&&(b.yBlob+b.wBlob/2>=147.5))||((b.yBlob+b.wBlob/2<=371)&&(b.yBlob+b.wBlob/2>=319))) {
      if ((b.xBlob<=mylog[k].TopxLog+mylog[k].wLog/2)&&(b.xBlob>=mylog[k].TopxLog-mylog[k].wLog/2)) 
      {
        b.xBlob=mylog[k].TopxLog;
        onLog=true;
      }
    }
    //Makes Blob follow Mid Logs when jumped on
    if ((b.yBlob+b.wBlob/2<=300)&&(b.yBlob+b.wBlob/2>=250)) {
      if ((b.xBlob<=mylog[k].MidxLog+mylog[k].wLog/2)&&(b.xBlob>=mylog[k].MidxLog-mylog[k].wLog/2)) {
        b.xBlob=mylog[k].MidxLog;
        onLog=true;
      }
      
    }
}

  //Blob dies in Water
  if ((b.yBlob-b.wBlob/2>=147.5)&&(b.yBlob+b.wBlob/2<=372.5)&&(onLog==false)) {
    b.xBlob=625;
    b.yBlob=720;
    deathCount=deathCount-1;
  }

  //Draws Cars
  for (int i=0; i<MAX; i++) {
    mycar[i].yCar=485;
    mycar[i].drawCar(); 
    mycar[i].speed();
    mycar[i].yCar=570;
    mycar[i].drawCar(); 
    mycar[i].speed();
    mycar[i].yCar=655;
    mycar[i].drawCar(); 
    mycar[i].speed();
    //Kills BLob when hit by car and resets
    if ((b.yBlob+b.wBlob/2>=450)&&(b.yBlob+b.wBlob/2<=690)) {
      {
        if ((mycar[i].xCar+mycar[i].wCar/2>=b.xBlob-b.wBlob/2)&&(mycar[i].xCar+mycar[i].wCar/2<=b.xBlob+b.wBlob/2))
        {
          b.xBlob=625;
          b.yBlob=720;
          deathCount=deathCount-1;
        }
      }
    }
  }
  //Draws Blob
  b.drawBlob();
  //Blob dies if steps on Bomb
  if (((b.xBlob<=x.xBomb+x.wBomb/2)&&(b.xBlob>=x.xBomb-x.wBomb/2)&&(b.yBlob<=435)&&(b.yBlob>=385))||((b.xBlob<=y.xBomb+y.wBomb/2)&&(b.xBlob>=y.xBomb-y.wBomb/2)&&(b.yBlob<=435)&&(b.yBlob>=385))) {
    b.xBlob=625;
    b.yBlob=720;
    deathCount=deathCount-1;
  }
  //Level Count
  if ((b.yBlob<=50)&&(b.yBlob>=0))
  {
    levelCount=levelCount+5;
    b.xBlob=625;
    b.yBlob=720;
  }

  //Adds to death count if Blob goes outside screen
  if (b.BadBlob()==true) {
    deathCount=deathCount-1;
  }
  //If you die 5 times the death screen comes up
  if (deathCount<=0) {
    background(#FF0000);
    Restart();
    textAlign(CENTER);
    fill(0);
    textSize(100);
    text("YOU DIED", 625, 375);
    levelCount=0;
    noLoop();
  }
}



//Moves Blob
void keyPressed() {
  b.speedBlob();
}
void mousePressed() {
  //Loops game on death screen
  if ((deathCount<=0)&&(mouseX>=525)&&(mouseX<=725)&&(mouseY<=650)&&(mouseY>=550)) {
    deathCount=5;
    loop();
    b.xBlob=625;
    b.yBlob=720;
  }
  //Removes bombs if clicked on
  if (x.MouseOverBomb()==true) {
    x.wBomb=0;
    x.rBomb=0;
    x.smallwBomb=0;
  }
  if (y.MouseOverBomb()==true) {
    y.wBomb=0;
    y.rBomb=0;
    y.smallwBomb=0;
  }
}
//Road
void road(int xroad, int yroad, int wroad, int lroad) {
  rectMode(CENTER);
  fill(#7C7C7C);
  noStroke();
  rect(xroad, yroad, wroad, lroad);
  strokeWeight(5);
  stroke(#FFFF00);
  int dash=0;
  //Dash lines on road
  for (int i=0; i<500; i++) {
    line(0+dash, yroad-lroad/6, dash+25, yroad-lroad/6);
    line(0+dash, yroad+lroad/6, dash+25, yroad+lroad/6);
    dash=dash+50;
  }
}
//River
void river(int xRiver, int yRiver, int wRiver, int hRiver, int xWaves) {
  noStroke();
  rectMode(CENTER);
  fill(#78C3FB);
  rect(xRiver, yRiver, wRiver, hRiver);
  fill(#A7FFF6);
  int wavesPosition=0;
  //Waves on River
  for (int i=0; i<10; i++) {
    waves(int(random(xRiver-wRiver/2, xRiver+wRiver/2)), int(random(yRiver-hRiver/3, yRiver+hRiver/3)));
    xWaves=xWaves+wavesPosition;
    wavesPosition=wavesPosition-1;
  }
}
//Waves
void waves(int xWaves, int yWaves) {
  strokeWeight(random(1, 5));
  stroke(255);
  line(xWaves, yWaves, xWaves+75, yWaves);
}
//Restart Button
void Restart() {
  noStroke();
  fill(#FF0000);
  rect(625, 600, 200, 100);
  textAlign(CENTER);
  fill(255);
  textSize(24);
  text("Click to Try Again", 625, 600);
}
