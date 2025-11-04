class InputNote {

  //Member variables
  color c1, c2;

  //Constructor
  InputNote(color c1, color c2) {
    this.c1 = c1;
    this.c2 =c2;
  }

  //Member Methods
  void display(int tempX, int tempY) {
    if (noteTog == 1) {
      if (tempX >=40 && tempX<=540 && tempY>=40 && tempY<=60) {
        ellipse(70, 50, 10, 10);
        strokeWeight(2);
        line(65, 50, 65, 80);
      } else if (tempX >=40 && tempX<=540 && tempY>60 && tempY<=80) {
        ellipse(70, 70, 10, 10);
        strokeWeight(2);
        line(65, 70, 65, 100);
      } else if (tempX >=40 && tempX<=540 && tempY>80 && tempY<=100) {
        ellipse(70, 90, 10, 10);
        strokeWeight(2);
        line(65, 90, 65, 120);
      } else if (tempX >=40 && tempX<=540 && tempY>100 && tempY<=120) {
        ellipse(70, 110, 10, 10);
        strokeWeight(2);
        line(65, 110, 65, 140);
      } else if (tempX >=40 && tempX<=540 && tempY>120 && tempY<=140) {
        ellipse(70, 130, 10, 10);
        strokeWeight(2);
        line(65, 130, 65, 160);
      }
    }
  }
}
