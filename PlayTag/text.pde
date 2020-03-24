// PlayTag by Hironobu SUZUKI <suzuki dot hironobu at gmail dot com>
// GPLv3 
void initText() {
  textSize(32);
  textAlign(CENTER);
}
void showText()
{
  int v=0;
  int r=0;
  int n=0;
  for ( int i=0; i < dots.length; i++) {
    if ( dots[i].status == 1) {
      v++;
    }
    if ( dots[i].status == 2) {
      r++;
    }
    n = dots.length - (v + r);
  }
  if ( v < 1 && end_t==start_t ) {
    end_t=millis();
  }
  if ( game==1 && v > dn/4) {
    game = -100;
  }
  if ( game == 1 && v < 1 ) {
    game = 100;
  }
  textSize(32);
  fill(#888888);
  text(n, 32, height);

  textSize(32);
  fill(#00FFFF);
  text(r, width-32, 32);

  textSize(32);
  fill(#FF0000);
  text(v, width-32, height);

  if (game==-100) {
    textSize(64);
    textAlign(CENTER);
    text("Failed", width/2, height/2);
  }
  if (game==100) {
    fill(#20FFAA);
    textSize(64);
    textAlign(CENTER);
    text("Finished", width/2, height/2);
  }
  if ( end_t!=start_t ) {
    textSize(32);
    int s=(end_t - start_t);
    String msg = str(int(s/1000)) +"." +str((s%1000)) + " sec";
    text(msg, width/2, height/2+38);
  }
}