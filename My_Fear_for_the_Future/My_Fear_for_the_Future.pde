// Fletcher Hamilton
int x, e;
PImage soldierImg, skeletonImg, skeleton2Img, radiationImg;
ArrayList<RadiationSource> sources = new ArrayList<RadiationSource>();

boolean sourcesAdded = false;
void setup() {
  frameRate(60); // adjust this to adjust the speed of everything (larger the number, the faster) (15 reccomended)

  size(1000, 1000);
  x = 725;
  e = 0;

  // Load sprites used in animation
  soldierImg = loadImage("soldier.png");
  skeletonImg = loadImage("skeleton12345.png");
  skeleton2Img = loadImage("skeleton2.png");
  radiationImg = loadImage("radiation2.png");
}
void draw() {
  x -= 1; // adjust this to adjust the speed of the nuke
  background(#8A0303);



  // Nuke
  if (x >= 640) {
    nuke(x, 700);
  } else if (e < 3000) {
    e += 35;
    explode(e);
  } else if (!sourcesAdded) {
    for (int i = 50; i < width; i += width/5-25) {
      sources.add(new RadiationSource(i, 800));
    }
    sourcesAdded = true;
  }

  for (RadiationSource source : sources) {
    source.update();
    source.display();
  }

  // Ground
  fill(#555555);
  ellipse(width/2, height, width*6, 400);

  // Random Figures
  randomFigure(175, 625, x);

  if (e > 0 && e < 3000) drawSkeletons(e);
}

void nuke(int x, int y) {
  pushMatrix();
  translate(500, 1000);
  rotate(radians(x));
  translate(x - 500, y - 1000);

  fill(#696969);
  triangle(50, -10, 150, -10, 225, -35);
  triangle(50, 10, 150, 10, 225, 35);
  rect(0, -15, 100, 30);
  fill(#3cff49);
  ellipse(0, 0, 15, 30);
  image(radiationImg, 50, -15, 30, 30);
  popMatrix();
}

void explode(int e) {
  fill(#3cff49);
  circle(200, 800, e);
}

void randomFigure(int x, int y, int z) {
  if (z >= 640) {
    image(soldierImg, x, y, 600, 200);
  } else {
    image(skeletonImg, x, y, 140, 200);
  }
}
void drawSkeletons(int e) {
  pushMatrix();
  translate(200, 685);
  rotate(e);
  if (e >= 250) skeleton();
  popMatrix();

  pushMatrix();
  translate(350, 675);
  rotate(e);
  if (e >= 500) skeleton();
  popMatrix();

  pushMatrix();
  if (e >= 2000) {
    for (int i = 0; i < 7; i++) {
      pushMatrix();
      translate(i * 150, 665 - i * 10);
      rotate(e);
      skeleton();
      popMatrix();
    }
  }
  popMatrix();
}

void skeleton() {
  image(skeleton2Img, 0, 0, 75, 125);
}

// click to add new sources
void mousePressed() {
  if (mouseY >= 800) sources.add(new RadiationSource(mouseX, mouseY));
}
class RadiationSource {
  float x, y;
  ArrayList<Particle> particles;
  int emitRate = 5; // frames between when particles get emitted
  int frameCount = 0;

  RadiationSource(float x, float y) {
    this.x = x;
    this.y = y;
    particles = new ArrayList<Particle>();
  }

  void update() {
    frameCount++; // since this area isn't in draw, it needs to run the frames manually

    // Emit new particle
    if (frameCount >= emitRate) {
      frameCount = 0;
      float offsetX = random(-25, 25); // slight x offset to make the particles come up from different places from the same toxic waste pool
      particles.add(new Particle(x + offsetX, y));
    }

    // Update all particles
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();

      // Remove if off screen
      if (p.y < -10) {
        particles.remove(i);
      }
    }
  }

  // The toxic waste pool
  void display() {
    fill(#3cff49);
    noStroke();
    ellipse(x, y, 50, 12);

    // Draw all particles
    for (Particle p : particles) {
      p.display();
    }
  }
}
class Particle {
  float x, y;

  Particle(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    y -= 2; // change this to adjust the speed of rising
    x += random(-0.3, 0.3); // to move it sideways as it rises. closer the #s are, the less movement laterally
  }

  void display() {
    noStroke();
    ellipse(x, y, 10, 10);
  }
}
