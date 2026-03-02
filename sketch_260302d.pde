// Fletcher Hamilton
int x,y;

void setup() {
  size(600, 600);
  x = 0;
  y = 0;
  strokeWeight(5);
}

void draw() {
  background(255);
  x += 1;
  y += 1;
  circle(x, y, 200);
  if (y == 700) {
    x = -100;
    y = -100;
  }
}
