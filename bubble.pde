class Bubble {
  
  float r;
  float posx, posy;
  float vertVelocity;
  float horizVelocity;
  
  color c;
  
  
  public Bubble(float x, float rad) {
    this(x, height + rad, rad);
  }
  
  public Bubble(float x, float y, float rad) {
    posx = x;
    posy = y;
    r = rad;
    vertVelocity = (random(5) + 2) * -1;
    horizVelocity = (random(8) - 4);
    
    c = color(random(200) + 55, random(200) + 55, random(200) + 55);
  }
  
  void draw() {
    fill(c, 50);
    stroke(c);
    ellipse(posx, posy, r, r);
  }
  
  void move() {
    posy += vertVelocity;
    posx += horizVelocity;
    
    if (posx < 0 || posx > width) {
      horizVelocity *= -1;
    }
  }
  
}