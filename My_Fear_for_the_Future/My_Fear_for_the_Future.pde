// Fletcher Hamilton
int x;
void setup() {
  size(1000, 1000);
  x = 1000;
}
void draw() {
  x -= 5;
  background(#8A0303);
  // Nuke
  if (x >= 0) {
    nuke(x, 500);
  }
  // Ground
  fill(#555555);
  ellipse(500, 1000, 3000, 400);
}

void nuke(int x, int y) {
  pushMatrix();
  translate(500, 1000);
  rotate(radians(x));
  translate(x - 500, y - 1000);
  rotate(radians(-x));
  triangle(50, -10, 150, -10, 225, -35);
  triangle(50, 10, 150, 10, 225, 35);
  rect(0, -15, 100, 30);
  fill(#3cff49);
  ellipse(x, y, 15, 30);
  image(loadImage("radiation2.png"), x + 50, y - 15, 30, 30);
  popMatrix();
}
