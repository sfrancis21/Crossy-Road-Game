class Log {
  int TopxLog;
  int yLog;
  int MidxLog;
  int wLog;
  int lLog;
  int velLog;
  Log() {
    TopxLog=0;
    MidxLog=1250;
    wLog=100;
    lLog=50;
    velLog=int(random(10, 30));
  }
  //Draws Top and Bottom Log
  void DrawTopLog() {
    fill(#D2691E);
    noStroke();
    rect(TopxLog, yLog, wLog, lLog, 10);
  }
  //Draws Middle Log
  void DrawMidLog() {
    fill(#D2691E);
    noStroke();
    rect(MidxLog, yLog, wLog, lLog, 10);
  }
  //Moves logs
  void LogSpeed() {
    TopxLog=TopxLog+velLog;
    MidxLog=MidxLog-velLog;
    //Resets bottom and top logs once off screen
    if (TopxLog+wLog/2>=1250) {
      TopxLog=0;
    }
    //Resets Mid logs once off screen
    if (MidxLog-wLog/2<=0) {
      MidxLog=1250;
    }
  }
}
