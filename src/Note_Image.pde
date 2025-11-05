//Kai Yun Chao
//Condense images at home

Note[] noteButton = new Note[10]
  PImage img;
  String note;

void setup() {
  size(600, 700);
  imgQ = loadImage("Lizard.jpeg");
  imgE = loadImage("");
  imgS = loadImage("");
  imgH = loadImage();
  imgW = loadImage();
  imgQr = loadImage();
  imgTr = loadImage();
  imgBa = loadImage();
  imgSh = loadImage();
  imgFl = loadImage();
}

void draw() {
  image(imgQ, 20, 10);
  image(imgE, 40, 10);
  image(imgS, 60, 10);
  image(imgH, 80, 10);
  image(imgW, 100, 10);
  image(imgQr, 20, 40);
  image(imgTr, 20, 40);
  image(imgBa, 20, 40);
  image(imgSh, 20, 40);
  image(imgFl, 20, 40);
  img.resize(20,40);
}

void mousePressed() {
  for (int i = 0; i<buttons.length; i++) {
  
  
  }
}

//Ignore all below:
//noteButtons[1] = new Button(x, y, w, h, "imgQ");
// noteButtons[2] = new Button(x, y, w, h, "imgE");
//noteButtons[3] = new Button(x, y, w, h, "imgS");
//noteButtons[4] = new Button(x, y, w, h, "imgH");

// notebuttons[5] = new Button(x, y, w, h, "imgW");
// notenumButtons[6] = new Button(x, y, w, h, "imgQr");
// notenumButtons[7] = new Button(x, y, w, h, "imgTr");

// notebuttons[8] = new Button(x, y, w, h, "imgBa");
// notebuttons[9] = new Button(x, y, w, h, "imgSh");
// notebuttons[10] = new Button(x, y, w, h, "imgFl");
