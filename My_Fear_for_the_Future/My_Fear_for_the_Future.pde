// Fletcher Hamilton
int x, e, r, g;
ArrayList<RadiationSource> sources = new ArrayList<RadiationSource>();
void setup() {
  size(1000, 1000);
  x = 725;
  e = 0;
  r = 0;
  g = -25;
}
void draw() {
  x -= 1; // adjust this to adjust the speed of the nuke
  background(#8A0303);

  // Nuke
  if (x >= 640) {
    nuke(x, 700);
  } else {
    if (e < 3000) {
      e += 35;
      explode(e);
    } else {
      sources.add(new RadiationSource(200, 500));
      sources.add(new RadiationSource(400, 450));
      sources.add(new RadiationSource(600, 500));
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


  for (RadiationSource source : sources) {
    source.update();
    source.display();
  }
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

// click to add new sources
void mousePressed() {
  sources.add(new RadiationSource(mouseX, mouseY));
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
    frameCount++;

    // Emit new particle
    if (frameCount >= emitRate) {
      frameCount = 0;
      float offsetX = random(-15, 15); // slight x offset to make the particles come up from different places from the same toxic waste pool
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
    ellipse(x, y, 20, 12);

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
