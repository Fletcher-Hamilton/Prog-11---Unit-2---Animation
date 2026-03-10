// Fletcher Hamilton
int x, e, r;
void setup() {
  size(1000, 1000);
  x = 725;
  e = 0;
  r = 0;
}
void draw() {
  x -= 1;
  background(#8A0303);
  // Nuke
  if (x >= 700) {
    nuke(x, 700);
  } else {
    e += 3;
    explode(e);
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
  triangle(50, -10, 150, -10, 225, -35);
  triangle(50, 10, 150, 10, 225, 35);
  rect(0, -15, 100, 30);
  fill(#3cff49);
  ellipse(0, 0, 15, 30);
  image(loadImage("radiation2.png"), 50, -15, 30, 30);
  popMatrix();
}

void explode(int x) {
  fill(#3cff49);
  circle(200, 800, x);
  if (x >= 100) {
    skeleton(200, 700);
  }
  if (x >= 500) {
    skeleton(350, 675);
  }
}

void skeleton(int x, int y) {
  if (r == 0) {
    r = int(random(0, 4));
  }
  if (r == 1) {
    image(loadImage("skeleton.webp"), x, y, 75, 125);
  }
  if (r == 2) {
    image(loadImage("skeleton2.png"), x, y, 75, 125);
  }
  if (r == 3) {
    image(loadImage("skeleton.webp"), x, y, 75, 125);
  }
}
