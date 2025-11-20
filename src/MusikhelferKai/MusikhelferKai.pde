

//Ethan Tang | 3B | 11/4/25
import processing.sound.*;
SoundFile pitch;
pitch = new int[1];
import java.util.Map;
HashMap<Integer, String> keyConvert= new HashMap<Integer, String>();
ArrayList<Note> notes = new ArrayList<Note>();
PImage[] noteImages = new PImage[17];
//Set Note value (only quarter notes for now)
int noteTog;
//Detect whether a mouse has been pressed and released
boolean mouseClicked, firstSwitch;
StringList inputScore;
StringList harmonizeRes;
Button[] modeButtons=new Button[4];
Button[] tuneButtons=new Button[12];
Button[] harmButtons=new Button[6];
Button[] metroButtons=new Button[3];
Button[] pitchButtons=new Button[13];
int modeTog, clef;
String buttonVal, tuneNote, scoreNote, metroVal;
Boolean play;
int Y_AXIS = 1;
int X_AXIS = 2;
color c1, c2;
PFont myFont;


void setup() {
  //noteImages[0] = loadImage("Quarter Note.png");
  //noteImages[1] = loadImage("Quarter Note (BOTTOM SIDE).png");
  //noteImages[2] = loadImage("Quarter Note (HOVER).png");
  //noteImages[3] = loadImage("Quarter Note (HOVER, BOTTOM SIDE).png");
  //noteImages[4] = loadImage("Eight Note.png");
  //noteImages[5] = loadImage("Eight Note (BOTTOM SIDE).png");
  //noteImages[6] = loadImage("Eight Note (HOVER).png");
  //noteImages[7] = loadImage("Eight Note (HOVER, BOTTOM SIDE).png");
  //noteImages[8] = loadImage("Sixteenth Note.png");
  //noteImages[9] = loadImage("rHalf Note.png");
  //noteImages[10] = loadImage("Whole Note.jpg");
  //noteImages[11] = loadImage("rFlat.png");
  //noteImages[12] = loadImage("Final Sharp.png");
  //noteImages[13] = loadImage("rBass Clef.png");
  //noteImages[14] = loadImage("rTreble Clef.png");
  //noteImages[15] = loadImage("rQuarter Rest.png");
  //noteImages[16] = loadImage("Final Play.png");

  //noteImages[0].resize(40, 80);
  //noteImages[1].resize(40, 80);
  //noteImages[2].resize(40, 80);
  //noteImages[3].resize(40, 80);
  //noteImages[4].resize(40, 80);
  //noteImages[5].resize(40, 80);
  //noteImages[6].resize(40, 80);
  //noteImages[7].resize(40, 80);
  //noteImages[8].resize(40, 80);
  //noteImages[9].resize(40, 80);
  //noteImages[10].resize(40, 80);
  //noteImages[11].resize(40, 80);
  //noteImages[12].resize(40, 80);
  //noteImages[13].resize(40, 80);
  //noteImages[14].resize(80, 160);
  //noteImages[16].resize(80, 160);
  //noteImages[15].resize(40, 80);
  size(600, 700);
  c1 = color(#5E86D8);
  c2 = color(#6C6C6C);
  //Simon Sakata | 3B
  modeButtons[0]=new Button(60, 120, 100, 100, 25, #7FA3E0, #5E86D8, "1", "Pitch Ear Training");
  modeButtons[1]=new Button(60, 270, 100, 100, 25, #7FA3E0, #5E86D8, "2", "Tuner");
  modeButtons[2]=new Button(60, 420, 100, 100, 25, #7FA3E0, #5E86D8, "3", "Harmonizer");
  modeButtons[3]=new Button(60, 570, 100, 100, 25, #7FA3E0, #5E86D8, "4", "Metronome");
  clef=1;
  mouseClicked = false;
  //+1 BPM Button
  metroButtons[0] = new Button(362, 350, 100, 100, 25, #7FA3E0, #5E86D8, "0", "+1");
  //-1 BPM Button
  metroButtons[1] = new Button(362, 600, 100, 100, 25, #7FA3E0, #5E86D8, "0", "-1");
  //Play Button
  metroButtons[2] = new Button(362, 475, 100, 75, 25, #767676, #767676, "0", "PLAY");

  //Buttons for changing note values: Will change labels later, these are temporary
  harmButtons[0] = new Button(170,30,60,40,25,#7FA3E0, #5E86D8, "1", "Quart");
  harmButtons[1] = new Button(245,30,60,40,25,#7FA3E0, #5E86D8, "2", "Eight");
  harmButtons[2] = new Button(320,30,60,40,25,#7FA3E0, #5E86D8, "3", "Sixt");
  harmButtons[3] = new Button(395,30,60,40,25,#7FA3E0, #5E86D8, "4", "Half");
  harmButtons[4] = new Button(470,30,60,40,25,#7FA3E0, #5E86D8, "5", "Whole");
  harmButtons[5] = new Button(545,30,60,40,25,#7FA3E0, #5E86D8, "6", "Dot");

  pitchButtons[0] = new Button(120, 270, 100, 20, 25, #7FA3E0, #5E86D8, "9", "Unison");
  pitchButtons[1] = new Button(120, 270, 100, 20, 25, #7FA3E0, #5E86D8, "9", "Minor 2nd");
  pitchButtons[2] = new Button(120, 270, 100, 20, 25, #7FA3E0, #5E86D8, "9", "Major 2nd");
  pitchButtons[3] = new Button(120, 270, 100, 20, 25, #7FA3E0, #5E86D8, "9", "Minor 3rd");
  pitchButtons[4] = new Button(120, 270, 100, 20, 25, #7FA3E0, #5E86D8, "9", "Major 3rd");
  pitchButtons[5] = new Button(120, 270, 100, 20, 25, #7FA3E0, #5E86D8, "9", "Perfect 4th");
  pitchButtons[6] = new Button(120, 270, 100, 20, 25, #7FA3E0, #5E86D8, "9", "Aug 4th/Tritone");
  pitchButtons[7] = new Button(120, 270, 100, 20, 25, #7FA3E0, #5E86D8, "9", "Perfect 5th");
  pitchButtons[8] = new Button(120, 270, 100, 20, 25, #7FA3E0, #5E86D8, "9", "Minor 6th");
  pitchButtons[9] = new Button(120, 270, 100, 20, 25, #7FA3E0, #5E86D8, "9", "Major 6th");
  pitchButtons[10] = new Button(120, 270, 100, 20, 25, #7FA3E0, #5E86D8, "9", "Minor 7th");
  pitchButtons[11] = new Button(120, 270, 100, 20, 25, #7FA3E0, #5E86D8, "9", "Major 7th");
  pitchButtons[12] = new Button(120, 270, 100, 20, 25, #7FA3E0, #5E86D8, "9", "Octave");
}

void mouseReleased() {
  for (int i=0; i<modeButtons.length; i++) {
    if (modeButtons[i].hover(mouseX, mouseY)) {
      modeTog=int(modeButtons[i].val);
      firstSwitch=true;
    }
  }
  //Mo Spiegel 3B
  for (int i = 0; i < harmButtons.length; i++) {
    if (harmButtons[i].hover(mouseX, mouseY) == true) {
      if (harmButtons[i] == harmButtons[0]) {
        if (notes.get(notes.size()-1).inputted == false) {
          notes.get(notes.size()-1).noteTog = 1;
        }
      } else if (harmButtons[i] == harmButtons[1]) {
        if (notes.get(notes.size()-1).inputted == false) {
          notes.get(notes.size()-1).noteTog = 2;
        }
      }
    }
  }
  if (modeTog==3&&firstSwitch==true) {
    firstSwitch=false;
  } else if (modeTog==3&&firstSwitch==false && mouseX>= 40 && mouseX<=540 && mouseY> 60 && mouseY<180) {
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
      if (notes.get(3).noteTog == 1 && notes.get(3).x <= 400) {
        notes.add(new Note (125, 0, notes.get(3).x + 45*2, 1, false));
      } else if (notes.get(3).noteTog == 2 && notes.get(3).x <= 490) {
        notes.add(new Note (125, 0, notes.get(3).x + 45*1, 2, false));
      } //else if (notes.get(0).noteTog == 3, so on)
    } else if (notes.size() == 5 && mouseClicked == false) {
      notes.get(4).mouseClick();
      notes.get(4).inputNote();
      mouseClicked = false;
      notes.get(4).inputted = true;
      if (notes.get(4).noteTog == 1 && notes.get(4).x <= 400) {
        notes.add(new Note (125, 0, notes.get(4).x + 45*2, 1, false));
      } else if (notes.get(4).noteTog == 2 && notes.get(4).x <= 490) {
        notes.add(new Note (125, 0, notes.get(4).x + 45*1, 2, false));
      } //else if (notes.get(0).noteTog == 3, so on)
    } else if (notes.size() == 6 && mouseClicked == false) {
      notes.get(5).mouseClick();
      notes.get(5).inputNote();
      mouseClicked = false;
      notes.get(5).inputted = true;
      if (notes.get(5).noteTog == 1 && notes.get(5).x <= 400) {
        notes.add(new Note (125, 0, notes.get(5).x + 45*2, 1, false));
      } else if (notes.get(5).noteTog == 2 && notes.get(5).x <= 490) {
        notes.add(new Note (125, 0, notes.get(5).x + 45*1, 2, false));
      } //else if (notes.get(0).noteTog == 3, so on)
    } else if (notes.size() == 7 && mouseClicked == false) {
      notes.get(6).mouseClick();
      notes.get(6).inputNote();
      mouseClicked = false;
      notes.get(6).inputted = true;
      if (notes.get(6).noteTog == 1 && notes.get(6).x <= 400) {
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

void mousePressed() {
//Kai Yun Chao | 3B
for(int i = 0; i<tuneButtons.length; i++){
  if(tuneButtons[i].over&&tuneButtons[i].val.equals("A"))
  pitch[3].play("C5.mp3");
 }else if (file.isPlaying()){
   file.pause();
 }else{
   file.play();
}

}

void draw() {
  background(75);
  setGradient(0, 0, width/5, height, c1, c2, Y_AXIS);

  for (int i=0; i<modeButtons.length; i++) {
    modeButtons[i].display();
    modeButtons[i].hover(mouseX, mouseY);
  }
 switch(modeTog){
case 1:
    pitchMode();
    break;
case 2:
    tunerMode();
    for (int i = 0; i<tuneButtons.length; i++) {
      tuneButtons[i].display();
      tuneButtons[i].hover(mouseX, mouseY);
    }
    break;
 case 3:
    harmMode();
    break;
 case 4:
    metroMode();
    break;
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
  
  fill(255);
  rect(360,120,440,160,25);
  
  rectMode(CENTER);
  fill(#2B7FD6);
  //rect(370, 233);
  textAlign(CENTER, CENTER);
  textSize(65);

  tuneButtons[0]=new Button(180, 300, 80, 80, 25, #ffab45,#ffab45, "", "A");
  tuneButtons[1]=new Button(300, 300, 80, 80, 25, #7FA3E0, #5E86D8, "", "A#/Bb");
  tuneButtons[2]=new Button(420, 300, 80, 80, 25, #7FA3E0, #5E86D8, "", "B/Cb");
  tuneButtons[3]=new Button(540, 300, 80, 80, 25, #7FA3E0, #5E86D8, "", "C/B#");
  tuneButtons[4]=new Button(180, 420, 80, 80, 25, #7FA3E0, #5E86D8, "", "C#/Db");
  tuneButtons[5]=new Button(300, 420, 80, 80, 25, #7FA3E0, #ffab45, "", "D");
  tuneButtons[6]=new Button(420, 420, 80, 80, 25, #7FA3E0, #5E86D8, "", "D#/Eb");
  tuneButtons[7]=new Button(540, 420, 80, 80, 25, #7FA3E0, #5E86D8, "", "E/Fb");
  tuneButtons[8]=new Button(180, 540, 80, 80, 25, #7FA3E0, #5E86D8, "", "F/E#");
  tuneButtons[9]=new Button(300, 540, 80, 80, 25, #7FA3E0, #5E86D8, "", "F#/Gb");
  tuneButtons[10]=new Button(420, 540, 80, 80, 25, #7FA3E0,#ffab45, "", "G");
  tuneButtons[11]=new Button(540, 540, 80, 80, 25, #7FA3E0, #5E86D8, "", "G#/Ab");
  
  pitch[0] = new SoundFile(this,"C5.mp3");
}

void pitchMode() {
  for (int i=0; i<pitchButtons.length; i++) {
  pitchButtons[i].display();
  pitchButtons[i].hover(mouseX,mouseY);
  }
}

void metroMode() {
  //+1 BPM Button
  metroButtons[0] = new Button(362, 350, 100, 100, 25, #7FA3E0, #5E86D8, "0", "+1");
  metroButtons[0].display();
  metroButtons[0].hover(mouseX, mouseY);
  //-1 BPM Button
  metroButtons[1] = new Button(362, 600, 100, 100, 25, #7FA3E0, #5E86D8, "0", "-1");
  metroButtons[1].display();
  metroButtons[1].hover(mouseX, mouseY);
  //Play Button
  metroButtons[2] = new Button(362, 475, 100, 75, 25, #767676, #767676, "0", "PLAY");
  metroButtons[2].display();
  metroButtons[2].hover(mouseX, mouseY);
  //Hover For Buttons
  for (int i = 0; i < metroButtons.length; i++) {
    metroButtons[i].hover(mouseX, mouseY);
    metroButtons[i].display();
  }
  
  //Metronome Display
  rectMode(CENTER);
  fill(200);
  rect(362,150,420,225,25);
  
  textAlign(CENTER,CENTER);
  textSize(42);
  text("TEST",362,150);
}

void harmMode() {
  //Mo Spiegel | 3B
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
    keyConvert.put(14, "D");
    keyConvert.put(13, "E");
    keyConvert.put(12, "F");
    keyConvert.put(11, "G");
    keyConvert.put(10, "A");
    keyConvert.put(9, "B");
    keyConvert.put(8, "C");
    keyConvert.put(7, "D");
    keyConvert.put(6, "E");
    keyConvert.put(5, "F");
    keyConvert.put(4, "G");
    for (int i=0; i<notes.size()-1; i++) {
      inputScore.append(keyConvert.get(notes.get(i).yVal()));
    }
    println(inputScore);
  }
}

void play() {
}
