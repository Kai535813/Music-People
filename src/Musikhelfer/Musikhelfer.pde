//Ethan Tang | 3B | 11/4/25
//Create 4 Notes (only quarter notes for now)
Note[] notes = new Note[4];
//Set Note value (only quarter notes for now)
int noteTog;
//Detect whether a mouse has been pressed and released
boolean mouseClicked, firstSwitch;
StringList inputScore;
StringList harmonizeRes;
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
PFont myFont;


void setup() {
 img1 = loadImage("Eight Note.png");
  img2 = loadImage("Quarter Note.png");
  img3 = loadImage("Sixteenth Note.png");
  img4 = loadImage("rHalf Note.png");
  // img5 = loadImage("rWhole Note.png");
  img6 = loadImage("rFlat.png");
   img7 = loadImage("Final Sharp.png");
  img8 = loadImage("rBass Clef.png");
  img9 = loadImage("rTreble Clef.png");
  img10 = loadImage("rQuarter Rest.png");
 img11 = loadImage("Final Play.png");

  img1.resize(40, 80);
 img2.resize(40, 80);
  img3.resize(40, 80);
  img4.resize(40, 80);
  //  img5.resize(40, 80);
  img6.resize(40, 80);
   img7.resize(40, 80);
  img8.resize(80, 160);
  img9.resize(80, 160);
  img10.resize(40, 80);
  img11.resize(160, 160);

  //Temporary
  modeTog = 3;

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
  for (int i=0; i<modeButtons.length; i++) {
    modeButtons[i].display();
    modeButtons[i].hover(mouseX, mouseY);
  }
  if (modeTog==3) {
    harmMode();
    fill(255);
    strokeWeight(1);
    rectMode(CORNER);
    rect(140, 30, 440, 120);
    rectMode(CENTER);
    stroke(0);
    line(140, 50, 580, 50);
    line(140, 70, 580, 70);
    line(140, 90, 580, 90);
    line(140, 110, 580, 110);
    line(140, 130, 580, 130);
    for (int i = 0; i<notes.length; i = i + 1) {
      notes[i].hover();
      notes[i].inputNote();
    }
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
}

void tunerMode() {
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
}

void harmonize() {
}

void play() {
}
