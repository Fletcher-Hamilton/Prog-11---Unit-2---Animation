// Fletcher Hamilton
int x,y;

void setup() {
  size(600, 600);
  x = 0;
  y = 700;
  strokeWeight(5);
}

void draw() {
  background(255);
  x += 1;
  y -= 1;
  circle(150, x, 200);
  circle(450, y, 200);
  if (x == 700) {
    x = -100;
    y = 0;
  }
}
