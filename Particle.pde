class Particle {
  PVector previousPosition;
  PVector position;
  PVector velocity;
  float speed;
  color c;
  
  public Particle(PVector position) {
    this.speed = 4 * random(0,1) + 1;
    //this.previousPosition = position;
    this.position = position;
    this.velocity = new PVector(0, 0);
  }
  
  void update() {
    this.c = getColor(position);
    float theta = ((red(c) + green(c) + blue(c)) / 765) * 2 * PI;
    velocity = new PVector(cos(theta) * speed, sin(theta) * speed);
    previousPosition = position.copy();
    position.add(velocity);
  }
  
  color getColor(PVector position) {
    int sx = int(position.x);
    int sy = int(position.y);
    int loc = sx + sy * width;
    color c = color(0,0,0);
    try {
      c = img.pixels[loc];
    }catch(ArrayIndexOutOfBoundsException e) {
      println("e.getMessage()");
      println("img.pixels.length = " + img.pixels.length);
      println("loc = " + loc);
    }
    return c;
  }
  
  boolean isEndMove() {
    return this.position.x >= width || this.position.x <= 0 ||
           this.position.y >= height || this.position.y <= 0;
  }
}