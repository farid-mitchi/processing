PImage target;
PImage fist;
float tx = 0, fx = 0;
float vx = 2;
int punched = 0, punched_count = 60;
int tw = 0, th = 0;

boolean is_colliding(float x1, float w1, float x2, float w2) {
  if ( x1 > x2 + w2 || x2 > x1 + w1) {
    return false;
  } else {
    return true;
  }
}

void mousePressed() {
  if (punched > 0)
    return;
    
  if (is_colliding(tx, target.width, fx, fist.width)) {
    punched = punched_count;
    if (vx > 0) {
      vx += 1;
    } else {
      vx -= 1;
    }
  }
}

void setup() {
  size(1600, 360);
  target = loadImage("chimp.png");
  tw = target.width;
  th = target.height;
  fist = loadImage("fist.png");
  noCursor();
}

void draw() {
  background(170, 238, 187);

  if (tx >= width - target.width && vx > 0) {
    vx = -vx;
  } else if (tx <= 0 && vx < 0) {
    vx = -vx;
  }
  tx += vx;
  if (punched > 0) {
    image(target, tx + tw/3, 60 + th/3, tw/2, th/2);
    --punched;
  } else {
    image(target, tx, 40);
  }


  fx = mouseX;
  float fy = mouseY;
  if (mousePressed) {
    fx += 15;
    fy += 25;
  }
  image(fist, fx, fy);
}
