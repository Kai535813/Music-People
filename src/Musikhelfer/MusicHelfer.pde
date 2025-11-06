import processing.sound.*;
StringList inputScore;
StringList harmonizeRes;
Note[] notes = new Note[1];
int noteTog;
Button[] modeButtons=new Button[4];
Button[] tuneButtons=new Button[1];
Button[] harmButtons=new Button[12];
Button[] metro=new Button[3];
int modeTog, clef;
String buttonVal, tuneNote;
Boolean play;
boolean np1, np2, np3, np4;
boolean ntInputted1, ntInputted2, ntInputted3, ntInputted4;
int Y_AXIS = 1;
int X_AXIS = 2;
color c1, c2;
PFont myFont;
int x=x


void setup() {
  size(600, 700);
  c1 = color(#5E86D8);
  c2 = color(#6C6C6C);
  noLoop();
  notes[0] = new Note(125);
  noteTog = 1;
  np1 = true;
  np2 = false;
  np3 = false;
  np4 = false;
  ntInputted1 = false;
  ntInputted2 = false;
  ntInputted3 = false;
  ntInputted4 = false;
  
  myFont = loadFont("AppleSDGothic.vlw");
  textFont(myFont);
  modeButtons[0]=new Button(60, 120, 100, 100, #5E86D8, #6C6C6C, "Pitch", "Pitch Ear Training");
  modeButtons[1]=new Button(60, 270, 100, 100, #5E86D8, #6C6C6C, "Tune", "Tuner");
  modeButtons[2]=new Button(60, 420, 100, 100, #5E86D8, #6C6C6C, "Harm", "Harmonizer");
  modeButtons[3]=new Button(60, 570, 100, 100, #5E86D8, #6C6C6C, "Metro", "Metronome");
}

void mouseReleased() {
}

void draw() {
  background(75);
  setGradient(0, 0, width/5, height, c1, c2, Y_AXIS);
  for (int i=0; i<modeButtons.length; i++) {
    modeButtons[i].display();
    modeButtons[i].hover(mouseX, mouseY);
  }
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis) {

  noFill();

  if (axis == Y_AXIS) { //Top to bottom gradient
    for (int i = y; i < y + h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x + w, i);
    }
  } else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i < x + w; i++) {
      float inter = map(i, x, x + w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y + h);
    }
  }
}

  void display() {
    rectMode(CENTER);
    noStroke();

    // Slightly brighten on hover
    if (over) {
      color hoverC1 = lerpColor(c1, color(255), 0.2);
      color hoverC2 = lerpColor(c2, color(255), 0.2);
      setGradient(x - w/2, y - h/2, w, h, hoverC1, hoverC2, Y_AXIS);
    } else {
      setGradient(x - w/2, y - h/2, w, h, c1, c2, Y_AXIS);
    }

    // Border
    stroke(0);
    strokeWeight(2);
    noFill();
    rect(x, y, w, h, 25);

    // Label
    fill(0);
    noStroke();
    textAlign(CENTER, CENTER);
    textSize(20);
    text(val, x, y);
  }

void tunerMode() {
}

void metroMode() {
}

void harmMode() {
  strokeWeight(1);
  fill(255);
  rect(40, 30, 500, 120);
  fill(0);
  line(40, 50, 540, 50);
  line(40, 70, 540, 70);
  line(40, 90, 540, 90);
  line(40, 110, 540, 110);
  line(40, 130, 540, 130);
  for (int i = 0; i<notes.length; i = i + 1) {
    notes[i].hover(mouseX, mouseY);
    notes[i].inputNote();
  }
}

void harmonize() {
}

void play() {
}
