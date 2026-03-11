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
  if (x >= 640) {
    nuke(x, 700);
  } else {
    if (e < 3000) {
      e += 35;
      explode(e);
    }
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
  pushMatrix();
  translate(200, 685);
  rotate(x);
  if (x >= 250) {
    skeleton();
  }

  popMatrix();
  pushMatrix();
  translate(350, 675);
  rotate(x);
  if (x >= 500) {
    skeleton();
  }
  popMatrix();
  pushMatrix();
  if (x >= 2000) {
    for (int i = 0; i < 7; i++) {
      translate(i * 75, 665 - i * 10);
      rotate(x);
      skeleton();
    }
  }
  popMatrix();
}

void skeleton() {
  image(loadImage("skeleton2.png"), 0, 0, 75, 125);
}
