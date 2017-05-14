import java.util.ArrayList;
import java.util.Collections;
import java.text.DecimalFormat;

int maxBubbles = 800;
float maxBubbleWidth = 100;
int numBubblers;
ArrayList<Bubble> bubbles;
ArrayList<Bubbler> bubblers;
ArrayList<Float> fpsList;

DecimalFormat df;


void setup() {
  size(1600, 900);
  frameRate(30);
  
  df = new DecimalFormat("##.##");
  df.setRoundingMode(java.math.RoundingMode.DOWN);
  
  bubbles = new ArrayList<Bubble>();
  bubblers = new ArrayList<Bubbler>();
  fpsList = new ArrayList<Float>();
  
  numBubblers = 5;
  
  //for (int i = 0; i < maxBubbles; i++) {
  //  bubbles.add(new Bubble(random(width), random(maxBubbleWidth - 20) + 20));
  //}
  
  for (int i = 0; i < numBubblers; i++) {
    bubblers.add(new Bubbler(random(width), height - random(height / 10)));
  }
}

void draw() {
  fpsList.add(frameRate);
  String minFPS = df.format(Collections.min(fpsList)).toString();;
  String maxFPS = df.format(Collections.max(fpsList)).toString();;
  
  //calculate avg fps
  float totalFrames = 0;
  for (Float f : fpsList) {
    totalFrames += f;
  }
  String avgFPS = df.format(totalFrames / fpsList.size());
  
  surface.setTitle("Bubbles \t\t" + df.format(frameRate) + " \tmin: " + minFPS + " \tmax: " + maxFPS + " \tavg: " + avgFPS + " Bubbles Visible: " + bubbles.size());
  background(30);
  
  for (Bubbler b : bubblers) {
    b.draw();
    Bubble newBubble = b.trySpawn();
    
    if (newBubble != null && bubbles.size() < maxBubbles) {
      bubbles.add(newBubble);
    }
  }
  
  ArrayList<Bubble> toBeRemoved = new ArrayList<Bubble>();
  for (Bubble b : bubbles) {
    b.draw();
    b.move();
    
    if (b.posy + b.r <= 0) {
      toBeRemoved.add(b);
    }
    
  }
  
  for (Bubble b : toBeRemoved) {
    bubbles.remove(b);
    //bubbles.add(new Bubble(random(width), random(maxBubbleWidth - 20) + 20));
  }
  
}