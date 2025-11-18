//Mo Spiegel | 3B

class Note {

  //Member variables
  color c1, c2;
  int x;
  boolean inputted;
  int noteTog;

  //Tracks where the mouse is clicked (where the note is to be inputted)
  int clickX, clickY,harmY;

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
      for (int i = 65; i<175; i = i + 10) {
        if (mouseX>= 140 && mouseX<=580 && mouseY> i && mouseY< i+10 && mouseY<125) {
          if (noteTog == 1) {
            imageMode(CENTER);
            image(noteImages[3], x, i+24);
          } else if (noteTog == 2) {
            imageMode(CENTER);
            image(noteImages[7], x, i+23);
          }
        } else if (mouseX>= 140 && mouseX<=580 && mouseY> i && mouseY < i+10 && mouseY >125) {
          if (noteTog == 1) {
            imageMode(CENTER);
            image(noteImages[2], x, i-12);
          } else if (noteTog == 2) {
            imageMode(CENTER);
            image(noteImages[6], x, i-12);
          }
        }
      }
    }
  }

  //Draws a note when it is inputted (mouse clicked)
  void inputNote() {
    if (mouseClicked == true && inputted == false && mouseX>= 40 && mouseX<=540 && mouseY> 60 && mouseY<180) {
      clickX = mouseX;
      clickY =  mouseY;
    }

    //Draw note
    strokeWeight(2);
    fill(c2);
    stroke(c2);
    if (clickX>= 140 && clickX<=580 && clickY> 65 && clickY< 75) {
      if (noteTog == 1) {
        image(noteImages[1], x, 89);
      } else if (noteTog == 2) {
        image(noteImages[5], x, 88);
      }
      harmY=40;
    } else if (clickX>= 140 && clickX<=580 && clickY>= 75 && clickY <= 85) {
      if (noteTog == 1) {
        image(noteImages[1], x, 99);
      } else if (noteTog == 2) {
        image(noteImages[5], x, 98);
      }
      harmY=50;
    } else if (clickX>= 140 && clickX<=580 && clickY> 85 && clickY <= 95) {
      if (noteTog == 1) {
        image(noteImages[1], x, 109);
      } else if (noteTog == 2) {
        image(noteImages[5], x, 108);
      }
      harmY=60;
    } else if (clickX>= 140 && clickX<=580 && clickY> 95 && clickY <= 105) {
      if (noteTog == 1) {
        image(noteImages[1], x, 119);
      } else if (noteTog == 2) {
        image(noteImages[5], x, 118);
      }
      harmY=70;
    } else if (clickX>= 140 && clickX<=580 && clickY> 105 && clickY <= 115) {
      if (noteTog == 1) {
        image(noteImages[1], x, 129);
      } else if (noteTog == 2) {
        image(noteImages[5], x, 128);
      }
      harmY=80;
    } else if (clickX>= 140 && clickX<=580 && clickY> 115 && clickY <= 125) {
      if (noteTog == 1) {
        image(noteImages[1], x, 139);
      } else if (noteTog == 2) {
        image(noteImages[5], x, 138);
      }
      harmY=90;
    } else if (clickX>= 140 && clickX<=580 && clickY> 125 && clickY <= 135) {
      if (noteTog == 1) {
        image(noteImages[0], x, 113);
      } else if (noteTog == 2) {
        image(noteImages[4], x, 113);
      }
      harmY=100;
    } else if (clickX>= 140 && clickX<=580 && clickY> 135 && clickY <= 145) {
      if (noteTog == 1) {
        image(noteImages[0], x, 123);
      } else if (noteTog == 2) {
        image(noteImages[4], x, 123);
      }
      harmY=110;
    } else if (clickX>= 140 && clickX<=580 && clickY> 145 && clickY <= 155) {
      if (noteTog == 1) {
        image(noteImages[0], x, 133);
      } else if (noteTog == 2) {
        image(noteImages[4], x, 133);
      }
      harmY=120;
    } else if (clickX>= 140 && clickX<=580 && clickY> 155 && clickY <= 165) {
      if (noteTog == 1) {
        image(noteImages[0], x, 143);
      } else if (noteTog == 2) {
        image(noteImages[4], x, 143);
      }
      harmY=130;
    } else if (clickX>= 140 && clickX<=580 && clickY> 165 && clickY <= 175) {
      if (noteTog == 1) {
        image(noteImages[0], x, 153);
      } else if (noteTog == 2) {
        image(noteImages[4], x, 153);
      }
      harmY=140;
    }
  }

  //Update mouseClicked when a click has been completed
  void mouseClick() {
    if (mouseClicked == false) {
      mouseClicked = true;
    }
  }
  int yVal() {
    return round(harmY/10);
  }
}
