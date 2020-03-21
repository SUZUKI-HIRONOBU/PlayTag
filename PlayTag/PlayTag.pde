// PlayTag by Hironobu SUZUKI <suzuki dot hironobu at gmail dot com>
// Click screen then play start.
// Slider change tagged dot's activity rate.
// GPLv3 
import controlP5.*;
ControlP5 cp5;
Slider s;
int dn=100;
float sspeed=1;
float rspeed=1;
int start_t;
int end_t;
SimDot[] dots;
int game=1;
void setup() {
  size(1024, 512);
  dots  = new SimDot[dn];
  for ( int i=0; i < dots.length; i++) {
    dots[i] = new SimDot();
  }
  rspeed=50;
  initZero();
  cp5 = new ControlP5(this);
  s = cp5.addSlider("SLIDER", 0, 100, 50, 10, 10, 255, 20);
  initText();
}

void draw() {
  background(255);
  for ( int i=0; i < dots.length; i++) {
    dots[i].move();
  }
  for ( int i=0; i < dots.length; i++) {
    dots[i].recover();
  }
  for ( int i=0; i < dots.length; i++) {
    dots[i].infection(dots);
  }
  for ( int i=0; i < dots.length; i++) {
    dots[i].display();
  }
  showText();
}
void restartAll() {
  for ( int i=0; i < dots.length; i++) {
    dots[i].reset();
  }
  initZero();
  initText();
}
void mousePressed() {
  s.updateInternalEvents(this);
  println(s.getValue());
  rspeed = s.getValue();
  restartAll();
}