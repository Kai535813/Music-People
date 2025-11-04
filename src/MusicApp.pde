Note[] notes = new Note[1];
int noteTog;

void setup () { 
  size(600,700);
  background(255);
  notes[0] = new Note(0,24);
  noteTog = 1;
}

void draw() {
  background(255);
  strokeWeight(1);
  fill(255);
  rect(40,40,500,100);
  fill(0);
  line(40,50,540,50);
  line(40,70,540,70);
  line(40,90,540,90);
  line(40,110,540,110);
  line(40,130,540,130);
  for (int i = 0; i<notes.length; i = i + 1) {
    notes[i].display(mouseX, mouseY);
  }
}

void mouseReleased() {
}
