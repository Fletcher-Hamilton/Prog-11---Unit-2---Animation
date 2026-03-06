// Fletcher Hamilton
int x;
void setup() {
  size(1000, 1000);
  x = 1000;
}
void draw() {
  background(#8A0303);
  // Nuke
  nuke(x, 500);
  // Ground
  fill(#555555);
  ellipse(500, 1000, 3000, 400);
}

void nuke(int x, int y) {
  triangle(x + 50, y - 10, x + 150, y - 10, x + 225, y - 35);
  triangle(x + 50, y + 10, x + 150, y + 10, x + 225, y + 35);
  rect(x, y - 15, 100, 30);
  fill(#3cff49);
  ellipse(x, y, 15, 30);
}
