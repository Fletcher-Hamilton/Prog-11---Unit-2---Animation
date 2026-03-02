// Fletcher Hamilton
int x;

void setup() {
  size(600, 600);
  x = 0;
  strokeWeight(5);
}

void draw() {
  background(255);
  x += 1;
  circle(300, 300, x);
  if (x == 900) {
    x = 0;
  }
}
