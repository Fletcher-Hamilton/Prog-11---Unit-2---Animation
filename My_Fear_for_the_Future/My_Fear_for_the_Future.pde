// Fletcher Hamilton
int x, e, r, z;
void setup() {
  size(1000, 1000);
  x = 725;
  e = 0;
  r = 0;
  z = 500;
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
    } else {
      z -= 1;
      aftermath(500, 500, z);
    }
  }
  // Ground
  fill(#555555);
  ellipse(500, 1000, 3000, 400);

  // Random Figures
  randomFigure(175, 625, x);
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
    skeleton();// Fletcher Hamilton
int x, e, r, z, g;
void setup() {
  size(1000, 1000);
  x = 725;
  e = 0;
  r = 0;
  z = 500;
  g = 0;
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
    } else {
      z -= 5;
      z = aftermath(500, 800, z, g);
      g += 1;
    }
  }
  // Ground
  fill(#555555);
  ellipse(500, 1000, 3000, 400);

  // Random Figures
  randomFigure(175, 625, x);
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
void randomFigure(int x, int y, int z) {
  if (z >= 640) {
    image(loadImage("soldier.png"), x, y, 600, 200);
  } else {
    image(loadImage("skeleton12345.png"), x, y, 140, 200);
  }
}
void skeleton() {
  image(loadImage("skeleton2.png"), 0, 0, 75, 125);
}

int aftermath(int x, int y, int z, int counter) {

  if (z <= y - 1000) {
    z = y;
  }

  noStroke();
  background(#8A0303);
  fill(#3cff49);
  circle(x-25, z, 10);
  circle(x+25, z+25, 10);
  circle(x, z+50, 10);
  circle(x-50, z+75, 10);
  circle(x+50, z+100, 10);
  circle(x-25, z+125, 10);
  circle(x, z+150, 10);
  circle(x+25, z+175, 10);
  circle(x, z+200, 10);
  circle(x+25, z+225, 10);
  circle(x-25, z+250, 10);
  circle(x+25, z+275, 10);
  circle(x-25, z+300, 10);
  circle(x, z+325, 10);
  circle(x+75, z+350, 10);
  circle(x-75, z+375, 10);
  circle(x+25, z+400, 10);
  circle(x-25, z+425, 10);
  circle(x+25, z+450, 10);
  circle(x, z+475, 10);
  circle(x-50, z+500, 10);
  circle(x+50, z+525, 10);
  circle(x-25, z+550, 10);
  circle(x, z+575, 10);
  circle(x+25, z+600, 10);
  circle(x, z+625, 10);
  circle(x+25, z+650, 10);
  circle(x-25, z+675, 10);
  circle(x+25, z+700, 10);
  circle(x-25, z+725, 10);
  circle(x, z+750, 10);
  circle(x+75, z+775, 10);
  circle(x-75, z+800, 10);
  circle(x+25, z+825, 10);
  circle(x, z+850, 10);
  circle(x-50, z+875, 10);
  circle(x+50, z+900, 10);
  circle(x-25, z+925, 10);
  circle(x, z+950, 10);
  circle(x+25, z+975, 10);
  // Hider
  fill(#8A0303);

  rect(x - 1000, y, 2000, 1000);
  fill(#555555);
  ellipse(500, 1000, 3000, 400);

  fill(#3cff49);
  ellipse(x, y, 200, 75);

  return z;
}
