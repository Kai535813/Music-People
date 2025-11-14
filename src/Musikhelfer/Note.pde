//Mo Spiegel | 3B

class Note {

  //Member variables
  color c1, c2;
  int x;
  boolean inputted;
  int noteTog;

  //Tracks where the mouse is clicked (where the note is to be inputted)
  int clickX, clickY;

  //Constructor
  Note(color c1, color c2, int x, int noteTog, boolean inputted) {

    //Hover color
    this.c1 = c1;

    //Inputted note color
    this.c2 = c2;

    //x-position on score
    this.x = x;

    this.noteTog = noteTog;
    this.inputted = inputted;
  }

  //Member Methods

  //Draws hovering note that snaps to score following user's cursor
  void hover() {
    stroke(c1);
    fill(c1);
    if (inputted == false) {
      for (int i = 35; i<145; i = i + 10) {
        if (mouseX>= 140 && mouseX<=580 && mouseY> i && mouseY< i+10 && mouseY<95) {
          if (noteTog == 1) {
            imageMode(CENTER);
            image(noteImages[1], x, i+8);
          } else if (noteTog == 2) {
            imageMode(CENTER);
            image(noteImages[0], x, i+8);
          }
        } else if (mouseX>= 40 && mouseX<=540 && mouseY> i && mouseY < i+10 && mouseY >95) {
          if (noteTog == 1) {
            ellipse(x, i+5, 10, 10);
            strokeWeight(2);
            line(x+5, i+5, x+5, i-25);
          } else if (noteTog == 2) {
            text("8th", x, i-15);
            ellipse(x, i+5, 10, 10);
            strokeWeight(2);
            line(x+5, i+5, x+5, i-25);
          }
        }
      }
    }
  }

  //Draws a note when it is inputted (mouse clicked)
  void inputNote() {
    if (mouseClicked == true && inputted == false && mouseX>= 40 && mouseX<=540 && mouseY> 30 && mouseY<150) {
      clickX = mouseX;
      clickY =  mouseY;
    }

    //Draw note
    strokeWeight(2);
    fill(c2);
    stroke(c2);
    if (clickX>= 140 && clickX<=580 && clickY> 35 && clickY< 45) {
      ellipse(x, 40, 10, 10);
      strokeWeight(2);
      line(x-5, 40, x-5, 70);
    } else if (clickX>= 140 && clickX<=580 && clickY>= 45 && clickY <= 55) {
      ellipse(x, 50, 10, 10);
      line(x-5, 50, x-5, 80);
    } else if (clickX>= 140 && clickX<=580 && clickY> 55 && clickY <= 65) {
      ellipse(x, 60, 10, 10);
      line(x-5, 60, x-5, 90);
    } else if (clickX>= 140 && clickX<=580 && clickY> 65 && clickY <= 75) {
      ellipse(x, 70, 10, 10);
      line(x-5, 70, x-5, 100);
    } else if (clickX>= 140 && clickX<=580 && clickY> 75 && clickY <= 85) {
      ellipse(x, 80, 10, 10);
      line(x-5, 80, x-5, 110);
    } else if (clickX>= 140 && clickX<=580 && clickY> 85 && clickY <= 95) {
      ellipse(x, 90, 10, 10);
      line(x-5, 90, x-5, 120);
    } else if (clickX>= 140 && clickX<=580 && clickY> 95 && clickY <= 105) {
      ellipse(x, 100, 10, 10);
      line(x+5, 100, x+5, 70);
    } else if (clickX>= 140 && clickX<=580 && clickY> 105 && clickY <= 115) {
      ellipse(x, 110, 10, 10);
      line(x+5, 110, x+5, 80);
    } else if (clickX>= 140 && clickX<=580 && clickY> 115 && clickY <= 125) {
      ellipse(x, 120, 10, 10);
      line(x+5, 120, x+5, 90);
    } else if (clickX>= 140 && clickX<=580 && clickY> 125 && clickY <= 135) {
      ellipse(x, 130, 10, 10);
      line(x+5, 130, x+5, 100);
    } else if (clickX>= 140 && clickX<=580 && clickY> 135 && clickY <= 145) {
      ellipse(x, 140, 10, 10);
      line(x+5, 140, x+5, 110);
    }
  }

  //Update mouseClicked when a click has been completed
  void mouseClick() {
    if (mouseClicked == false) {
      mouseClicked = true;
    }
  }
}

