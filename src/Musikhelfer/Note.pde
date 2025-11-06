//Mo Spiegel | 3B

class Note {

  //Member variables
  color c1, c2;
  int x;
  int nPos;
  boolean show;
  int clickX, clickY;

  //Constructor
  Note(color c1, color c2, int x, int nPos, boolean show) {
    this.c1 = c1;
    this.c2 = c2;
    this.x = x;
    this.nPos = nPos;
    this.show = show;
  }

  //Member Methods

  void hover() {

    //Quarter Note Hovering
    if (show == true) {
      stroke(c1);
      fill(c1);
      if (noteTog == 1) {
        for (int i = 35; i<145; i = i + 10) {
          if (mouseX>= 40 && mouseX<=540 && mouseY> i && mouseY< i+10 && mouseY<95) {
            ellipse(x, i+5, 10, 10);
            strokeWeight(2);
            line(x-5, i+5, x-5, i+35);
          } else if (mouseX>= 40 && mouseX<=540 && mouseY> i && mouseY < i+10 && mouseY >95) {
            ellipse(x, i+5, 10, 10);
            strokeWeight(2);
            line(x+5, i+5, x+5, i-25);
          }
        }
      }
    }
  }

  void inputNote() {
    if (mousePressed == true && show == true) {
      clickX = mouseX;
      clickY =  mouseY;
      show = false;
    }
      if (nPos == 1) {
        strokeWeight(2);
        fill(c2);
        stroke(c2);
        if (clickX>= 40 && clickX<=540 && clickY> 35 && clickY< 45) {
          ellipse(70, 40, 10, 10);
          line(65, 40, 65, 70);
        } else if (clickX>= 40 && clickX<=540 && clickY> 45 && clickY < 55) {
          ellipse(70, 50, 10, 10);
          line(65, 50, 65, 80);
        } else if (clickX>= 40 && clickX<=540 && clickY> 55 && clickY < 65) {
          ellipse(70, 60, 10, 10);
          line(65, 60, 65, 90);
        } else if (clickX>= 40 && clickX<=540 && clickY> 65 && clickY < 75) {
          ellipse(70, 70, 10, 10);
          line(65, 70, 65, 100);
        } else if (clickX>= 40 && clickX<=540 && clickY> 75 && clickY < 85) {
          ellipse(70, 80, 10, 10);
          line(65, 80, 65, 110);
        } else if (clickX>= 40 && clickX<=540 && clickY> 85 && clickY < 95) {
          ellipse(70, 90, 10, 10);
          line(65, 90, 65, 120);
        } else if (clickX>= 40 && clickX<=540 && clickY> 95 && clickY < 105) {
          ellipse(70, 100, 10, 10);
          line(75, 100, 75, 70);
        } else if (clickX>= 40 && clickX<=540 && clickY> 105 && clickY < 115) {
          ellipse(70, 110, 10, 10);
          line(75, 110, 75, 80);
        } else if (clickX>= 40 && clickX<=540 && clickY> 115 && clickY < 125) {
          ellipse(70, 120, 10, 10);
          line(75, 120, 75, 90);
        } else if (clickX>= 40 && clickX<=540 && clickY> 125 && clickY < 135) {
          ellipse(70, 130, 10, 10);
          line(75, 130, 75, 100);
        } else if (clickX>= 40 && clickX<=540 && clickY> 135 && clickY < 145) {
          ellipse(70, 140, 10, 10);
          line(75, 140, 75, 110);
        }
      }
    }
  
}
