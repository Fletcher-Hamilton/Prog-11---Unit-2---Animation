// Fletcher Hamilton
int y;

void setup() {
  size(600, 600);
  y = 0;
  strokeWeight(5);
}

void draw() {
  background(255);
  y += 1;
  circle(300, y, 200);
  if (y == 700) {
    y = -100;
  }
}
