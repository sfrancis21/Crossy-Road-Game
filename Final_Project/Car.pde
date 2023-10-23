class car {
  int xCar;
  int yCar;
  float wCar;
  float lCar;
  float wTire;
  float lTire;
  color colorTire;
  float speedCar;
  int velCar;
  int r, g, b;
  car() {
    r=int(random(255));
    g=int(random(255));
    b=int(random(255));
    xCar=50;
    wCar=55;
    lCar=30;
    wTire=22.5;
    lTire=17.5;
    velCar=int(random(10, 20));
  }
  //Draws Car 
  void drawCar() { 

    rectMode(CENTER);
    noStroke();
    fill(colorTire);
    rect(xCar-wCar/3, yCar-lCar/2, wTire, lTire, 10);
    rect(xCar-wCar/3, yCar+lCar/2, wTire, lTire, 10);
    rect(xCar+wCar/3, yCar-lCar/2, wTire, lTire, 10);
    rect(xCar+wCar/3, yCar+lCar/2, wTire, lTire, 10);
    fill(r, g, b);
    rect(xCar, yCar, wCar, lCar, 10);
  }
  //Moves Car
  void speed() {
    if (xCar+wCar/2>=1250) {
      xCar=0;
    }
    xCar=xCar+velCar;
  }
}
