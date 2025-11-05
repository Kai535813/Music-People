//Sidenote: As of now, this code is extremely uncondensed and inefficent.

class Note {

  //Member variables
  color c1;
  int tempX1, tempY1, tempX2, tempY2, tempX3, tempY3, tempX4, tempY4;

  //Constructor
  Note(color c1) {
    this.c1 = c1;
  }

  //Member Methods

  void hover(int tempX, int tempY) {

    //Quarter Note Hovering
    if (noteTog == 1) {
      if (np1==true && np2 != true && np3 != true && np4 != true) {
        stroke(c1);
        fill(c1);
        for (int i = 35; i<145; i = i + 10) {
          if (tempX>= 40 && tempX<=540 && tempY> i && tempY < i+10 && tempY <95) {
            ellipse(70, i+5, 10, 10);
            strokeWeight(2);
            line(65, i+5, 65, i+35);
          } else if (tempX>= 40 && tempX<=540 && tempY> i && tempY < i+10 && tempY >95) {
            ellipse(70, i+5, 10, 10);
            strokeWeight(2);
            line(75, i+5, 75, i-25);
          }
        }
      } else if (np1 == true && np2 == true && np3 != true && np4 != true) {
        stroke(c1);
        fill(c1);
        for (int i = 35; i<145; i = i + 10) {
          if (tempX>= 40 && tempX<=540 && tempY> i && tempY < i+10 && tempY <95) {
            ellipse(110, i+5, 10, 10);
            strokeWeight(2);
            line(105, i+5, 105, i+35);
          } else if (tempX>= 40 && tempX<=540 && tempY> i && tempY < i+10 && tempY >95) {
            ellipse(110, i+5, 10, 10);
            strokeWeight(2);
            line(115, i+5, 115, i-25);
          }
        }
      }
    }
  }

  void inputNote () {
    fill(0);
    stroke(0);
    if (mousePressed == true && np1 == true) {
      ntInputted1 = true;
      tempX1 = mouseX;
      tempY1 = mouseY;
      np2 = true;
    } else if (mousePressed == true && np2 == true) {
      ntInputted2 = true;
      tempX2 = mouseX;
      tempY2 = mouseY;
      np3 = true;
    } else if (mousePressed == true && np3 == true) {
      ntInputted3 = true;
      tempX3 = mouseX;
      tempY3 = mouseY;
      np4 = true;
    } else if (mousePressed == true && np4 == true) {
      ntInputted4 = true;
      tempX3 = mouseX;
      tempY3 = mouseY;
    }
    
    //Quarter Note (note to self: condense/optimize this)
    if (noteTog ==1 && ntInputted1 == true) {
      strokeWeight(2);
      if (tempX1>= 40 && tempX1<=540 && tempY1> 35 && tempY1 < 45) {
        ellipse(70, 40, 10, 10);
        line(65, 40, 65, 70);
      } else if (tempX1>= 40 && tempX1<=540 && tempY1> 45 && tempY1 < 55) {
        ellipse(70, 50, 10, 10);
        line(65, 50, 65, 80);
      } else if (tempX1>= 40 && tempX1<=540 && tempY1> 55 && tempY1 < 65) {
        ellipse(70, 60, 10, 10);
        line(65, 60, 65, 90);
      } else if (tempX1>= 40 && tempX1<=540 && tempY1> 65 && tempY1 < 75) {
        ellipse(70, 70, 10, 10);
        line(65, 70, 65, 100);
      } else if (tempX1>= 40 && tempX1<=540 && tempY1> 75 && tempY1 < 85) {
        ellipse(70, 80, 10, 10);
        line(65, 80, 65, 110);
      } else if (tempX1>= 40 && tempX1<=540 && tempY1> 85 && tempY1 < 95) {
        ellipse(70, 90, 10, 10);
        line(65, 90, 65, 120);
      } else if (tempX1>= 40 && tempX1<=540 && tempY1> 95 && tempY1 < 105) {
        ellipse(70, 100, 10, 10);
        line(75, 100, 75, 70);
      } else if (tempX1>= 40 && tempX1<=540 && tempY1> 105 && tempY1 < 115) {
        ellipse(70, 110, 10, 10);
        line(75, 110, 75, 80);
      } else if (tempX1>= 40 && tempX1<=540 && tempY1> 115 && tempY1 < 125) {
        ellipse(70, 120, 10, 10);
        line(75, 120, 75, 90);
      } else if (tempX1>= 40 && tempX1<=540 && tempY1> 125 && tempY1 < 135) {
        ellipse(70, 130, 10, 10);
        line(75, 130, 75, 100);
      } else if (tempX1>= 40 && tempX1<=540 && tempY1> 135 && tempY1 < 145) {
        ellipse(70, 140, 10, 10);
        line(75, 140, 75, 110);
      }
    }
  }
}
