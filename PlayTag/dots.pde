// PlayTag by Hironobu SUZUKI <suzuki dot hironobu at gmail dot com>
// GPLv3 
int v() {
  if(int(random(0,2)) == 0 ) {
    return -1;
  }
  else {
    return 1;
  }
}
int dotnumber=0;
float speed=2;
class Dot {
  float x;
  float xv;
  float y;
  float yv;
  int d=10; //diameter
  color sc; // stroke color
  color fc; //fill color
  int id;

  
  Dot() {
     x = random(d,width-d);
     xv = random(speed-2,speed)*v();
     y = random(d,height-d);
     yv = random(speed-1,speed)*v();
     sc = #000000;
     fc =#FFFFFF;
     id=dotnumber++;
  }
  void reset() {
        x = random(d,width-d);
     xv = random(speed-2,speed)*v();
     y = random(d,height-d);
     yv = random(speed-1,speed)*v();
     sc = #000000;
     fc =#FFFFFF;

  }
  void display() {
    stroke(sc);
    fill(fc);
    ellipse(x,y,d,d);
  }
  void showValue() {
    println(x,y,d,sc,fc);
  }
  void changeColor(color s, color f) {
    sc=s;
    fc=f;
  }
  void move() {
    float nx = x + xv;
    float ny = y + yv;
    if ( (nx < d/2) || (nx > width - d/2) ) { 
      xv = xv*-1;
    }
    if ( (ny < d/2) || (ny > height - d/2) ) {
      yv = yv*-1;
    }
    x += xv;
    y += yv;
  }
}