class Bubbler {
  
  float posx, posy;
  float r;
  int c;
  float spawnDelay;
  float spawnRate;
  
  public Bubbler(float x, float y) {
    posx = x;
    posy = y;
    r = 10;
    
    c = 255;
    
    spawnRate = frameRate / 10.0;
    spawnDelay = spawnRate;
  }
  
  void draw() {
    fill(c);
    noStroke();
    ellipse(posx, posy, r, r);
  }
  
  Bubble trySpawn() {
    spawnDelay--;
    if (spawnDelay <= 0) {
      spawnDelay = spawnRate;
      return spawn();
    } else {
      return null;
    }
  }
  
  Bubble spawn() {
    Bubble b = new Bubble(posx, posy, random(50));
    return b;
  }
}