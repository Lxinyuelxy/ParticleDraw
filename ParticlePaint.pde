import java.util.LinkedList;

PImage img;
LinkedList<Particle> particles;

void settings() {
  img = loadImage("6.jpg");
  size(img.width, img.height);
}

void setup() {
  particles = new LinkedList<Particle>();
}

void draw() {
  if(particles.size() < width * height) {
    particles.add(new Particle(new PVector(random(0,1) * width, random(0,1) * height)));
  }
  for(int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.update();
    if(p.isEndMove())
      particles.remove(i);
    else {
       beginShape();  
       stroke(p.c);
       strokeWeight(1);
       noFill();
       vertex(p.previousPosition.x, p.previousPosition.y);
       vertex(p.position.x, p.position.y);
       endShape();
    }
  }
}