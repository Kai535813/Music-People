//This is compatible with Mo's Note Class: Ethan, you may have to take into account the additional variables I've added here

Note[] notes = new Note[1];
int noteTog;
//Note Position: Tracks where the note lands on the score
boolean np1, np2, np3, np4;
//Note Inputted: Tracks whether a note has been inputted in a certain note position
boolean ntInputted1, ntInputted2, ntInputted3, ntInputted4;


void setup () { 
  size(600,700);
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
}

void draw() {
  strokeWeight(1);
  fill(255);
  rect(40,30,500,120);
  fill(0);
  line(40,50,540,50);
  line(40,70,540,70);
  line(40,90,540,90);
  line(40,110,540,110);
  line(40,130,540,130);
  for (int i = 0; i<notes.length; i = i + 1) {
    notes[i].hover(mouseX,mouseY);
    notes[i].inputNote();
  }
}

void mouseReleased() {
}

