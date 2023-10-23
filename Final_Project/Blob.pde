class Blob {
  int xBlob;
  int yBlob;
  int wBlob;
  int velBlob;
  Blob() {
    xBlob=625;
    yBlob=720;
    wBlob=50;
    velBlob=75;
  }
  //Draws Blob
  void drawBlob() {
    fill(#9400D3);
    stroke(#800080);
    rect(xBlob, yBlob, wBlob, wBlob);
    stroke(0);
    rect(xBlob+wBlob/4, yBlob-wBlob/4, 5, 5);
    rect(xBlob-wBlob/4, yBlob-wBlob/4, 5, 5);
    arc(xBlob, yBlob+wBlob/4, 10, 5, radians(0), radians(180));
  }
  //Blob Movements
  void speedBlob() {
    if (key=='w') {
      yBlob=yBlob-velBlob;
    } else if (key=='d') {
      xBlob=xBlob+velBlob;
    } else if (key=='s') {
      yBlob=yBlob+velBlob;
    } else if (key=='a') {
      xBlob=xBlob-velBlob;
    }
  }
  //Restarts blob if moves off screen
  boolean BadBlob() {
    if ((xBlob>=1250)||(xBlob<=0)||(yBlob>=750)||(yBlob<=0)) {
      xBlob=625;
      yBlob=720;
      return true;
    } else return false;
  }
}
