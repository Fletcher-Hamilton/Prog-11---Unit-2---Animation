// Fletcher Hamilton
int x;

void setup() {
  size(600, 600);
  x = 0;
  strokeWeight(5);
}

void draw() {
  background(255);
  x -= 1;
  circle(x, 300, 200);
  if (x == -100) {
    x = 700;
  }
}
