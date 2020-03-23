// PlayTag by Hironobu SUZUKI <suzuki dot hironobu at gmail dot com> //<>//
// GPLv3 
void initZero() {
  // init
  dots[0].changeStatus(1);
  dots[0].xv=2;
  dots[0].yv=2;
  game=1;
  start_t=millis();
  end_t=start_t;
}
class SimDot extends Dot {
  int status; // 0: normal, 1: carrier, 2: recover
  int fcount;
  SimDot() {
    super();
    status = 0;
  }
  void reset() {
    super.reset();
    status=0;
  }
  void changeStatus(int s) {
    if (status == 2) {
      return;
    }
    if ( status == 0 && s == 1) {
      sc=#FF0000;
      fc=#FF0000;
      fcount=frameCount;
      if ( id != 0 ) {
        if (random(100) < rspeed) {
          xv = xv/10;
          yv = yv/10;
        }
      }
    }
    if (status == 1 && s == 2) {
      sc=#00EEFF;
      fc=#00EEFF;

      xv = random(speed-2, speed)*v();
      yv= random(speed-2, speed)*v();
    }
    status = s;
  }
  void infection(SimDot[] list) {
    if (status == 1) { //carrier 
      for (int i=0; i < list.length; i++) {
        float l=dist(x, y, list[i].x, list[i].y);
        if ( id != list[i].id && l <= d) {
          list[i].changeStatus(1);
        }
      }
    }
  }
  void recover() {
    if (status == 1 ) {
      if (frameCount > fcount + (60*5)) {
        changeStatus(2);
      }
    }
  }
}