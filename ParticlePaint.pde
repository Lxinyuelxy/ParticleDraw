import java.util.LinkedList;

PImage img;
LinkedList<Particle> particles;
LinkedList<PVector> positions;
int w = 0, h = 0;

void settings() {
  img = loadImage("6.jpg");
  size(img.width, img.height);
}

void setup() {
  particles = new LinkedList<Particle>();
  positions = new LinkedList<PVector>();
  for(int i = 0; i < height; i++) {
    for(int j= 0; j < width; j++) {
      positions.add(new PVector(i,j));
    }
  }
}

void draw() {
  if(particles.size() < width*height) {
    particles.add(new Particle(new PVector(random(0,1) * width, random(0,1) * height))); 
  }
  //if(positions.size() > 0) { 
  //  int index = floor(random(positions.size()));
  //  particles.add(new Particle(positions.get(index)));
  //  positions.remove(index);     
  //}
  for(int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.update();
    if(p.isEndMove())
      particles.remove(i);
    else {
       beginShape();  
       stroke(p.c);
       strokeWeight(3);
       noFill();
       vertex(p.previousPosition.x, p.previousPosition.y);
       vertex(p.position.x, p.position.y);
       endShape();
    }
  }
}