class Button {
  // Member variables
  int x, y, w, h;
  color c1, c2;
  String disVal, val;
  boolean over;

  // Constructor
  Button(int x, int y, int w, int h, color c1, color c2, String val, String disVal) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.disVal = disVal;
    this.val = val;
    this.c1 = c1;
    this.c2 = c2;
    over = false;
  }

  // Member Methods
  void display() {
    rectMode(CENTER);
    noStroke();

    // Choose gradient direction
    int gradientAxis = Y_AXIS;

    // Change brightness when hovered
    if (over) {
      // Make gradient slightly brighter on hover
      color hoverC1 = lerpColor(c1, color(255), 0.2);
      color hoverC2 = lerpColor(c2, color(255), 0.2);
      setGradient(x - w/2, y - h/2, w, h, hoverC1, hoverC2, gradientAxis);
    } else {
      setGradient(x - w/2, y - h/2, w, h, c1, c2, gradientAxis);
    }

    // Optional: draw button border
    stroke(0);
    strokeWeight(2);
    noFill();
    rect(x, y, w, h, 25);

    // Draw button text
    fill(0);
    noStroke();
    textAlign(CENTER, CENTER);
    textSize(20);
    text(disVal, x, y,w,h);
  }

  void hover(int tempX, int tempY) {
    // Check if the mouse is within the bounds
    if (tempX > x - w/2 && tempX < x + w/2 && tempY > y - h/2 && tempY < y + h/2) {
      over = true;
    } else {
      over = false;
    }
  }
}
