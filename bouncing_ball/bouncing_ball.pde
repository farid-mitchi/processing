float vx = 0, vy = 0;
float bx = 0, by = 0;
float r = 20;

void reset_ball() {
  bx = width / 2;
  by = height / 2;
  float speed = 5;
  vx = random(-speed, speed);
  vy = sqrt(speed * speed - vx * vx);
}

void mousePressed() {
  reset_ball();
}

void setup() {
  size(640, 640);
  //noCursor();
  rectMode(CENTER);
  
  reset_ball();
}


void draw() {
  background(0);
  
  circle(bx, by, 2 * r);
  bx += vx;
  by += vy;
  
  rect(mouseX, 15, 100, 10);
  rect(mouseX, height - 15, 100, 10);
  rect(15, mouseY, 10, 100);
  rect(width - 15, mouseY, 10, 100);
  
  float left = bx - r, right = bx + r;
  float top = by - r, bottom = by + r;
  
  if (0 <= left && left <= 20) {
    if (abs(mouseY - by) <= 50) {
      if (vx < 0) {
        vx = -vx;
      }
    }
  } else if (width - 20 <= right && right <= width) {
    if (abs(mouseY - by) <= 50) {
      if (vx > 0) {
        vx = -vx;
      }
    }
  }
  
  if (0 <= top && top <= 20) {
    if (abs(mouseX - bx) <= 50) {
      if (vy < 0) {
        vy = -vy;
      }
    }
  } else if (height - 20 <= bottom && bottom <= height) {
    if (abs(mouseX - bx) <= 50) {
      if (vy > 0) {
        vy = -vy;
      }
    }
  }
  
}
