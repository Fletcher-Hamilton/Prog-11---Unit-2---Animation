// Fletcher Hamilton

int x;

void setup() {
  size(1000, 1000);
  noStroke();
  textFont(createFont("Green_Energy.ttf", 25));

  x = -50;
}

void draw() {

  background(255);

  x -= 1;
  
  // Can
  can(600, 400, 320);
  
  // Face
  fill(#FFDBAC);
  circle(300, 500, 300);

  // Eye
  fill(#1569C7);
  circle(300, 425, 50);

  // Mouth
  fill(255, 0, 0);
  rotate(radians(320));
  arc(55, 600, 225, 50, radians(90), radians(270));
  // Hair
  fill(#90542F);
  ellipse(-100, 450, 225, 75);
}

void can(int xx, int y, int a) {
  pushMatrix();
  translate(xx, y);
  rotate(radians(a));
  fill(0);
  rect(-50, -100, 100, 250, 25);

  // Logo
  fill(0, 255, 0);
  rect(-30, -50, 10, 100);
  rect(-5, -50, 10, 100);
  rect(20, -50, 10, 100);
  text("Monster", -50, 100);

  fill(#FCB033);
  circle(x, -100, 50);
  popMatrix();
  if (x == -200) {
    x = -50;
  }
}
