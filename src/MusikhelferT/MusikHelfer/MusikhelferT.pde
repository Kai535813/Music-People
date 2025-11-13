//Ethan Tang | 3B | 11/4/25
import processing.sound.*;
PImage[] noteImages = new PImage[11];
//Create 4 Notes (only quarter notes for now)
Note[] notes = new Note[4];
//Set Note value (only quarter notes for now)
int noteTog;
//Detect whether a mouse has been pressed and released
boolean mouseClicked, firstSwitch;
StringList inputScore;
StringList harmonizeRes;
Button[] modeButtons=new Button[4];
Button[] tuneButtons=new Button[12];
Button[] harmButtons=new Button[12];
Button[] metro=new Button[3];
int modeTog, clef;
String buttonVal, tunerNote;
Boolean play;
int Y_AXIS = 1;
int X_AXIS = 2;
color c1, c2;
PFont myFont;


void setup() {
  //noteImages[0] = loadImage("Eight Note.png");
  // noteImages[1] = loadImage("Quarter Note.png");
  // noteImages[2] = loadImage("Sixteenth Note.png");
  //noteImages[3] = loadImage("rHalf Note.png");
  //noteImages[4] = loadImage("Whole Note.jpg");
  // noteImages[5] = loadImage("rFlat.png");
  // noteImages[6] = loadImage("Final Sharp.png");
  // noteImages[7] = loadImage("rBass Clef.png");
  // noteImages[8] = loadImage("rTreble Clef.png");
  // noteImages[9] = loadImage("rQuarter Rest.png");
  // noteImages[10] = loadImage("Final Play.png");

  // noteImages[0].resize(40, 80);
  // noteImages[1].resize(40, 80);
  // noteImages[2].resize(40, 80);
  //noteImages[3].resize(40, 80);
  //noteImages[4].resize(40, 80);
  // noteImages[5].resize(40, 80);
  // noteImages[6].resize(40, 80);
  //noteImages[7].resize(80, 160);
  // noteImages[8].resize(80, 160);
  // noteImages[9].resize(40, 80);
  // noteImages[10].resize(160, 160);
  size(600, 700);
  c1 = color(#5E86D8);
  c2 = color(#6C6C6C);
  modeButtons[0]=new Button(60, 120, 100, 100, #5E86D8, #6C6C6C, "1", "Pitch Ear Training");
  modeButtons[1]=new Button(60, 270, 100, 100, #5E86D8, #6C6C6C, "2", "Tuner");
  modeButtons[2]=new Button(60, 420, 100, 100, #5E86D8, #6C6C6C, "3", "Harmonizer");
  modeButtons[3]=new Button(60, 570, 100, 100, #5E86D8, #6C6C6C, "4", "Metronome");
  notes[0] = new Note(125, 0, 220, true, false);
  notes[1] = new Note(125, 0, 220+90*1, false, false);
  notes[2] = new Note(125, 0, 220+90*2, false, false);
  notes[3] = new Note(125, 0, 220+90*3, false, false);
  noteTog = 1;
  mouseClicked = false;
}

void mouseReleased() {
  for (int i=0; i<modeButtons.length; i++) {
    if (modeButtons[i].hover(mouseX, mouseY)) {
      modeTog=int(modeButtons[i].val);
      firstSwitch=true;
    }
  }
  if (modeTog==3&&firstSwitch==true) {
    firstSwitch=false;
  } else if (modeTog==3&&firstSwitch==false) {
    //Run inputNote (essentially display) methods once a click is detected
    if (mouseClicked == false) {
      if (notes[0].updatable == true) {
        notes[0].mouseClick();
        notes[0].inputNote();
        mouseClicked = false;
      } else if (notes[0].updatable == false && notes[1].updatable == true) {
        notes[1].mouseClick();
        notes[1].inputNote();
        mouseClicked = false;
      } else if (notes[1].updatable == false && notes[2].updatable == true) {
        notes[2].mouseClick();
        notes[2].inputNote();
        mouseClicked = false;
      } else if (notes[2].updatable == false && notes[3].updatable == true) {
        notes[3].mouseClick();
        notes[3].inputNote();
        mouseClicked = false;
      }
    }
  }
}

void draw() {
  background(75);
  setGradient(0, 0, width/5, height, c1, c2, Y_AXIS);
   for (int i = 0; i<tunebuttons.length; i++) {
    tuneButtons[i].display();
    tuneButtons[i].hover(mouseX, mouseY);
   }
  for (int i=0; i<modeButtons.length; i++) {
    modeButtons[i].display();
    modeButtons[i].hover(mouseX, mouseY);
  }
  if (modeTog==3) {
    harmMode();
  }
  fill(0);
  strokeWeight(1);
  line(140, 50, 580, 50);
  line(140, 70, 580, 70);
  line(140, 90, 580, 90);
  line(140, 110, 580, 110);
  line(140, 130, 580, 130);
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
}

void tunerMode() {
  //Kai Yun Chao | 3B
  rectMode(CENTER);
  fill(#2B7FD6);
  rect(370,233);
  textAlign(CENTER,CENTER);
  textSize(65);
  text(tunerNote, x, y);
  
  tuneButtons=new Button[0](120, 120, 80, 80, 255, 0, "A");
  tuneButtons=new Button[1](120, 120, 80, 80, 255, 0, "A#/Bb");
  tuneButtons=new Button[2](120, 120, 80, 80, 255, 0, "B/Cb");
  tuneButtons=new Button[3](120, 120, 80, 80, 255, 0, "C/B#");
  tuneButtons=new Button[4](120, 120, 80, 80, 255, 0, "C#/Db");
  tuneButtons=new Button[5](120, 120, 80, 80, 255, 0, "D");
  tuneButtons=new Button[6](120, 120, 80, 80, 255, 0, "D#/Eb");
  tuneButtons=new Button[7](120, 120, 80, 80, 255, 0, "E/Fb");
  tuneButtons=new Button[8](120, 120, 80, 80, 255, 0, "F/E#");
  tuneButtons=new Button[9](120, 120, 80, 80, 255, 0, "F#/Gb");
  tuneButtons=new Button[10](120, 120, 80, 80, 255, 0, "G");
  tuneButtons=new Button[11](120, 120, 80, 80, 255, 0, "G#/Ab");
}

void metroMode() {
}

void harmMode() {
  rectMode(CORNER);
  strokeWeight(1);
  fill(255);
  rect(140, 30, 440, 120);
  line(140, 130, 580, 130);
  for (int i = 0; i<notes.length; i = i + 1) {
    notes[i].hover();
    notes[i].inputNote();
  }

  // image(noteImages[0], 100, 50);
  // image(noteImages[1], 200, 50);
  //image(noteImages[2], 300, 50);
  //  image(noteImages[3], 400, 50);
  // image(noteImages[4], 100, 40);
  // image(noteImages[5], 500, 50);
  // image(noteImages[6], 50, 40);
  // image(noteImages[7], 600, 50);
  // image(noteImages[8], 100, 150);
  // image(noteImages[9], 200, 150);
  // image(noteImages[10], 200, 80);
}

void harmonize() {
}

void play() {
}
