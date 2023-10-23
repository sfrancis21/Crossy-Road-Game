class Bomb {
  int xBomb;
  int yBomb;
  int wBomb;
  int rBomb;
  int smallwBomb;
  Bomb() {
    xBomb=int(random(50, 1200));
    yBomb=410;
    wBomb=50;
    rBomb=30;
    smallwBomb=10;
  }
  //Draws Bomb
  void DrawBomb() {
    noStroke();
    fill(#A9A9A9);
    rect(xBomb, yBomb, wBomb, wBomb);
    fill(#D3D3D3);
    ellipse(xBomb, yBomb, rBomb, rBomb);
    fill(#FF0000);
    rect(xBomb, yBomb, smallwBomb, smallwBomb);
  }
  //Sets to true if mouse over bomb
  boolean MouseOverBomb() {
    if ((mouseX<=xBomb+wBomb/2)&&(mouseX>=xBomb-wBomb/2)&&(mouseY<=435)&&(mouseY>=385)) {
      return true;
    } else return false;
  }
}
