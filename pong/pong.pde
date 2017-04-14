PShape model;






int px=100;
int py=200;
int pw=50;
int ph=200;
int Yspeed=10;

int Xspeed=10;


int X=350;
int Y=350;
void setup() {
  model= loadShape("dinosuar.obj");
    size(700, 700, P3D);
    noStroke();
  }
  boolean intersect(int bx, int by, int px, int py, 
    int pw, int ph) {
    if (bx>px && bx<(px+pw) && by>py &&by<(py+ph)) {
      return true;
    }
    return false;
  }
  void draw() {
    background(0);
    directionalLight(255, 255, 255, -1, 1, -1);
    pushMatrix();

    translate(X, Y, 0);
    X=X+Xspeed;
    Y=Y+Yspeed;
    scale(30);
    rotateZ(PI);
    shape(model);

    popMatrix();

    if (X>=width) {
      Xspeed=-Xspeed;
    }
    if (X<=0) {
      Xspeed=-Xspeed;
    }
    if (Y>=height) {
      Yspeed=-Yspeed;
    }
    if (Y<=0) {
      Yspeed=-Yspeed;
    }
    py=mouseY;
    fill(255, 0, 0);
    rect(px, py, pw, ph);
    if (intersect(X, Y, px, py, pw, ph)) {
      Xspeed=-Xspeed;
    }
  }