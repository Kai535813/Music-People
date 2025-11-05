import processing.sound.*;
StringList inputScore;
StringList harmonizeRes;
InputNote[] notes = new InputNote[1];
int noteTog;
Button[] modeButtons=new Button[4];
Button[] tuneButtons=new Button[1];
Button[] harmButtons=new Button[12];
Button[] metro=new Button[3];
int modeTog, clef;
String buttonVal, tuneNote;
Boolean play;
int Y_AXIS = 1;
int X_AXIS = 2;
color c1, c2;

void setup() {
  size(600, 700);
  c1 = color(#5E86D8);
  c2 = color(#6C6C6C);
  noLoop();
  notes[0] = new InputNote(0, 24);
  noteTog = 1;
}

void draw() {
  background(75);
  setGradient(0, 0, width/5, height, c1, c2, Y_AXIS);
  modeButtons[0] = new Button
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
}

void tunerMode() {
}

void metroMode() {
}

void harmMode() {
  background(255);
  strokeWeight(1);
  fill(255);
  rect(40, 40, 500, 100);
  fill(0);
  line(40, 50, 540, 50);
  line(40, 70, 540, 70);
  line(40, 90, 540, 90);
  line(40, 110, 540, 110);
  line(40, 130, 540, 130);
  for (int i = 0; i<notes.length; i = i + 1) {
    notes[i].display(mouseX, mouseY);
  }
}

void harmonize() {
}

void play() {
}
