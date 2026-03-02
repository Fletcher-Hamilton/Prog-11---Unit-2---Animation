// Fletcher Hamilton
int x,y;

void setup() {
  size(600, 600);
  x = 0;
  strokeWeight(5);
}

void draw() {
  background(255);
  x += 5;
  y += 1;
  circle(x, 300, y);
  if (x == 700) {
    x = -100;
    y = 0;
  }
}
