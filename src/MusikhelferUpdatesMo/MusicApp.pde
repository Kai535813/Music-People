//Ethan Tang | 3B | 11/4/25

//-----------------------------------------------------------------------------
//NOTE: I've added consolidation markers for Ethan (what I've updated). They look like this :)
//-----------------------------------------------------------------------------

import java.util.Map;

HashMap<Integer, String> keyConvert= new HashMap<Integer, String>();

ArrayList<Note> notes = new ArrayList<Note>();
PImage[] noteImages = new PImage[17];

//Detect whether a mouse has been pressed and released
boolean mouseClicked, firstSwitch;
StringList inputScore;
StringList harmonizeRes;

Button[] modeButtons=new Button[4];
Button[] tuneButtons=new Button[12];
Button[] harmButtons=new Button[6];
Button[] metro=new Button[3];

int modeTog, clef;
String buttonVal, tuneNote, scoreNote;
Boolean play;
int Y_AXIS = 1;
int X_AXIS = 2;
color c1, c2;
PFont myFont;


void setup() {
  
  //-----------------------------------------------------------------------------
  //UPDATED IMAGES (NEW IMAGES ALREADY IN DATA FOLDER, JUST REDOWNLOAD)
  //-----------------------------------------------------------------------------
  
  noteImages[0] = loadImage("Quarter Note.png");
  noteImages[1] = loadImage("Quarter Note (BOTTOM SIDE).png");
  noteImages[2] = loadImage("Quarter Note (HOVER).png");
  noteImages[3] = loadImage("Quarter Note (HOVER, BOTTOM SIDE).png");
  noteImages[4] = loadImage("Eight Note.png");
  noteImages[5] = loadImage("Eight Note (BOTTOM SIDE).png");
  noteImages[6] = loadImage("Eight Note (HOVER).png");
  noteImages[7] = loadImage("Eight Note (HOVER, BOTTOM SIDE).png");
  noteImages[8] = loadImage("Sixteenth Note.png");
  noteImages[9] = loadImage("rHalf Note.png");
  noteImages[10] = loadImage("Whole Note.jpg");
  noteImages[11] = loadImage("rFlat.png");
  noteImages[12] = loadImage("Final Sharp.png");
  noteImages[13] = loadImage("rBass Clef.png");
  noteImages[14] = loadImage("rTreble Clef.png");
  noteImages[15] = loadImage("rQuarter Rest.png");
  noteImages[16] = loadImage("Final Play.png");

  noteImages[0].resize(40, 80);
  noteImages[1].resize(40, 80);
  noteImages[2].resize(40, 80);
  noteImages[3].resize(40, 80);
  noteImages[4].resize(40, 80);
  noteImages[5].resize(40, 80);
  noteImages[6].resize(40, 80);
  noteImages[7].resize(40, 80);
  noteImages[8].resize(40, 80);
  noteImages[9].resize(40, 80);
  noteImages[10].resize(40, 80);
  noteImages[11].resize(40, 80);
  noteImages[12].resize(40, 80);
  noteImages[13].resize(40, 80);
  noteImages[14].resize(80, 160);
  noteImages[16].resize(80, 160);
  noteImages[15].resize(40, 80);
  
  size(600, 700);
  c1 = color(#5E86D8);
  c2 = color(#6C6C6C);
  //Simon Sakata | 3B
  modeButtons[0]=new Button(60, 120, 100, 100, 25, #7FA3E0, #5E86D8, "1", "Pitch Ear Training");
  modeButtons[1]=new Button(60, 270, 100, 100, 25, #7FA3E0, #5E86D8, "2", "Tuner");
  modeButtons[2]=new Button(60, 420, 100, 100, 25, #7FA3E0, #5E86D8, "3", "Harmonizer");
  modeButtons[3]=new Button(60, 570, 100, 100, 25, #7FA3E0, #5E86D8, "4", "Metronome");
  
  //-----------------------------------------------------------------------------
  //ADDED HARM BUTTONS
  //-----------------------------------------------------------------------------
  
  harmButtons[0] = new Button(170,30,60,40,25,#7FA3E0, #5E86D8, "1", "");
  harmButtons[1] = new Button(245,30,60,40,25,#7FA3E0, #5E86D8, "2", "");
  harmButtons[2] = new Button(320,30,60,40,25,#7FA3E0, #5E86D8, "3", "");
  harmButtons[3] = new Button(395,30,60,40,25,#7FA3E0, #5E86D8, "4", "");
  harmButtons[4] = new Button(470,30,60,40,25,#7FA3E0, #5E86D8, "5", "");
  harmButtons[5] = new Button(545,30,60,40,25,#7FA3E0, #5E86D8, "6", "");
  
  
  clef=1;
  mouseClicked = false;
}

void mouseReleased() {
  //Mo Spiegel | 3B
  for (int i=0; i<modeButtons.length; i++) {
    if (modeButtons[i].hover(mouseX, mouseY)) {
      modeTog=int(modeButtons[i].val);
      firstSwitch=true;
    }
  }
  if (modeTog==3&&firstSwitch==true) {
    firstSwitch=false;
  } else if (modeTog==3&&firstSwitch==false) {
    if (notes.size() == 1 && mouseClicked == false) {
      notes.get(0).mouseClick();
      notes.get(0).inputNote();
      mouseClicked = false;
      notes.get(0).inputted = true;
      if (notes.get(0).noteTog == 1) {
        notes.add(new Note (125, 0, 220+45*2, 1, false));
      } else if (notes.get(0).noteTog == 2) {
        notes.add(new Note (125, 0, 220+45*1, 2, false));
      } //else if (notes.get(0).noteTog == 3, so on)
    } else if (notes.size() == 2 && mouseClicked == false) {
      notes.get(1).mouseClick();
      notes.get(1).inputNote();
      mouseClicked = false;
      notes.get(1).inputted = true;
      if (notes.get(1).noteTog == 1) {
        notes.add(new Note (125, 0, notes.get(1).x + 45*2, 1, false));
      } else if (notes.get(1).noteTog == 2) {
        notes.add(new Note (125, 0, notes.get(1).x + 45*1, 2, false));
      } //else if (notes.get(0).noteTog == 3, so on)
    } else if (notes.size() == 3 && mouseClicked == false) {
      notes.get(2).mouseClick();
      notes.get(2).inputNote();
      mouseClicked = false;
      notes.get(2).inputted = true;
      if (notes.get(2).noteTog == 1) {
        notes.add(new Note (125, 0, notes.get(2).x + 45*2, 1, false));
      } else if (notes.get(2).noteTog == 2) {
        notes.add(new Note (125, 0, notes.get(2).x + 45*1, 2, false));
      } //else if (notes.get(0).noteTog == 3, so on)
    } else if (notes.size() == 4 && mouseClicked == false) {
      notes.get(3).mouseClick();
      notes.get(3).inputNote();
      mouseClicked = false;
      notes.get(3).inputted = true;
      if (notes.get(3).noteTog == 1 && notes.get(3).x <= 445) {
        notes.add(new Note (125, 0, notes.get(3).x + 45*2, 1, false));
      } else if (notes.get(3).noteTog == 2 && notes.get(3).x <= 490) {
        notes.add(new Note (125, 0, notes.get(3).x + 45*1, 2, false));
      } //else if (notes.get(0).noteTog == 3, so on)
    } else if (notes.size() == 5 && mouseClicked == false) {
      notes.get(4).mouseClick();
      notes.get(4).inputNote();
      mouseClicked = false;
      notes.get(4).inputted = true;
      if (notes.get(4).noteTog == 1 && notes.get(4).x <= 445) {
        notes.add(new Note (125, 0, notes.get(4).x + 45*2, 1, false));
      } else if (notes.get(4).noteTog == 2 && notes.get(4).x <= 490) {
        notes.add(new Note (125, 0, notes.get(4).x + 45*1, 2, false));
      } //else if (notes.get(0).noteTog == 3, so on)
    } else if (notes.size() == 6 && mouseClicked == false) {
      notes.get(5).mouseClick();
      notes.get(5).inputNote();
      mouseClicked = false;
      notes.get(5).inputted = true;
      if (notes.get(5).noteTog == 1 && notes.get(5).x <= 445) {
        notes.add(new Note (125, 0, notes.get(5).x + 45*2, 1, false));
      } else if (notes.get(5).noteTog == 2 && notes.get(5).x <= 490) {
        notes.add(new Note (125, 0, notes.get(5).x + 45*1, 2, false));
      } //else if (notes.get(0).noteTog == 3, so on)
    } else if (notes.size() == 7 && mouseClicked == false) {
      notes.get(6).mouseClick();
      notes.get(6).inputNote();
      mouseClicked = false;
      notes.get(6).inputted = true;
      if (notes.get(6).noteTog == 1 && notes.get(6).x <= 445) {
        notes.add(new Note (125, 0, notes.get(6).x + 45*2, 1, false));
      } else if (notes.get(6).noteTog == 2 && notes.get(6).x <= 490) {
        notes.add(new Note (125, 0, notes.get(6).x + 45*1, 2, false));
      } //else if (notes.get(0).noteTog == 3, so on)
    } else if (notes.size() == 8 && mouseClicked == false) {
      notes.get(7).mouseClick();
      notes.get(7).inputNote();
      mouseClicked = false;
      notes.get(7).inputted = true;
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
  }
  if (modeTog==2) {
    tunerMode();
    for (int i = 0; i<tuneButtons.length; i++) {
      tuneButtons[i].display();
      tuneButtons[i].hover(mouseX, mouseY);
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
  //Kai Yun Chao | 3B
  //The following code has incomplete and incorrect syntax, so I have commented it out for the time being to ensure that the application can run - Ethan Tang 11/13/25 9:16 PM
  rectMode(CENTER);
  fill(#2B7FD6);
  //rect(370, 233);
  textAlign(CENTER, CENTER);
  textSize(65);
  //text(tunerNote, x, y);
  //tuneButtons[0]=new Button(120, 120, 80, 80, 255, "0", "A");
  //tuneButtons[1]=new Button(120, 120, 80, 80, 255, "0", "A#/Bb");
  //tuneButtons[2]=new Button(120, 120, 80, 80, 255, "0", "B/Cb");
  //tuneButtons[3]=new Button(120, 120, 80, 80, 255, "0", "C/B#");
  //tuneButtons[4]=new Button(120, 120, 80, 80, 255, "0", "C#/Db");
  //tuneButtons[5]=new Button(120, 120, 80, 80, 255, "0", "D");
  //tuneButtons[6]=new Button(120, 120, 80, 80, 255, "0", "D#/Eb");
  //tuneButtons[7]=new Button(120, 120, 80, 80, 255, "0", "E/Fb");
  //tuneButtons[8]=new Button(120, 120, 80, 80, 255, "0", "F/E#");
  //tuneButtons[9]=new Button(120, 120, 80, 80, 255, "0", "F#/Gb");
  //tuneButtons[10]=new Button(120, 120, 80, 80, 255, "0", "G");
  //tuneButtons[11]=new Button(120, 120, 80, 80, 255, "0", "G#/Ab");
}

void metroMode() {
}

void harmMode() {
  //-----------------------------------------------------------------------------
  //UPDATED POSITION OF SCORE & NOTES (ETHAN, THIS WILL LIKELY REQUIRE YOU TO CHANGE YOUR HASHMAP)
  //-----------------------------------------------------------------------------
  
  rectMode(CORNER);
  strokeWeight(1);
  fill(255);
  rect(140, 60, 440, 120, 25);
  stroke(0);
  strokeWeight(1);
  line(140, 80, 580, 80);
  line(140, 100, 580, 100);
  line(140, 120, 580, 120);
  line(140, 140, 580, 140);
  line(140, 160, 580, 160);
  if (notes.size() == 0) {
    notes.add(new Note(125, 0, 220, 2, false));
  }
  for (int i = 0; i < notes.size(); i++) {
    notes.get(i).hover();
    notes.get(i).inputNote();
  }
  
  //-----------------------------------------------------------------------------
  //ADDED CALLS FOR HARM BUTTONS DISPLAY AND HOVER METHODS
  //-----------------------------------------------------------------------------
  
  for (int i = 0; i < harmButtons.length; i++) {
    harmButtons[i].display();
    harmButtons[i].hover(mouseX, mouseY);
  }
  if (notes.size()==8) {
    harmonize();
  }




  //image(noteImages[0], 100, 50);
  //image(noteImages[1], 200, 50);
  //image(noteImages[2], 300, 50);
  //image(noteImages[3], 400, 50);
  //image(noteImages[4], 100, 40);
  //image(noteImages[5], 500, 50);
  //image(noteImages[6], 50, 40);
  //image(noteImages[7], 600, 50);
  //image(noteImages[8], 100, 150);
  //image(noteImages[9], 200, 150);
  //image(noteImages[10], 200, 80);
}

void harmonize() {
  //Ethan Tang | 3B | 11/13/25
  inputScore=new StringList();
  keyConvert.clear();
  if (clef==1) {
    keyConvert.put(13, "D");
    keyConvert.put(12, "E");
    keyConvert.put(11, "F");
    keyConvert.put(10, "G");
    keyConvert.put(9, "A");
    keyConvert.put(8, "B");
    keyConvert.put(7, "C");
    keyConvert.put(6, "D");
    keyConvert.put(5, "E");
    keyConvert.put(4, "F");
    keyConvert.put(3, "G");
    for (int i=0; i<notes.size()-1; i++) {
      inputScore.append(keyConvert.get(notes.get(i).yVal()));
    }
    println(inputScore);
  }
}

void play() {
}
