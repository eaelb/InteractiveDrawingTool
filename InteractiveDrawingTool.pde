//Global variables
color fillVal = color(0);
float brushSize = 20;
color[] colors;
SaveImage img;
Brush br;
int shape = 0;

void setup() {
  //Setting up the window
  size(900, 700);
  //Instantiating the SaveImage class and the Brush class
  img = new SaveImage();
  br = new Brush();
  //Setting a higher FrameRate to make the drawing more smooth
  frameRate(480);
  //Draws all geometry with smooth (anti-aliased) edges
  smooth(4);

  //An array with different colors, so it's easy to use them later
  colors = new color[10];
  colors[0] = color(0, 0, 0);
  colors[1] = color(148, 0, 211);
  colors[2] = color(75, 0, 130);
  colors[3] = color(0, 0, 255);
  colors[4] = color(0, 255, 0);
  colors[5] = color(255, 255, 0);
  colors[6] = color(255, 127, 0);
  colors[7] = color(255, 0, 0);
  colors[8] = color(211, 211, 211);
  colors[9] = color(255, 255, 255);
}

void draw() {
  background(255);

  //Drawing up the color menu at the bottom of the screen, using a function I have defined
  drawRectangle(colors[1], (450/7), 50, 0, 650, "w");
  drawRectangle(colors[2], (450/7), 50, (450/7), 650, "e");
  drawRectangle(colors[3], (450/7), 50, ((450/7)*2), 650, "r");
  drawRectangle(colors[4], (450/7), 50, ((450/7)*3), 650, "t");
  drawRectangle(colors[5], (450/7), 50, ((450/7)*4), 650, "y");
  drawRectangle(colors[6], (450/7), 50, ((450/7)*5), 650, "u");
  drawRectangle(colors[7], (450/7), 50, ((450/7)*6), 650, "i");
  
  //Rectangle for defining brushSize-area
  drawRectangle(colors[8], 350, 50, ((450/7)*7), 650, "Brushsize");
  //Triangle illustrating brush-size
  drawTriangle(colors[0], ((450/7)*7), 675, (((450/7)*7)+350), 650, (((450/7)*7)+350), 700);
  
  //Rectangle with borders for saving
  drawRectangle(colors[0], 104, 50, 797, 650, " ");
  drawRectangle(colors[8], 90, 40, 804, 655, " ");
  text("SAVE", 833, 679);

  //Drawing the header and the shapes the user can choose between
  drawRectangle(colors[8], 900, 35, 0, 0, " ");
  drawRectangle(colors[0], 20, 20, 875, 10, " ");
  drawTriangle(colors[0], 830, 30, 870, 30, 850, 10);
  ellipse(813, 20, 20, 20);
  fill(255);
  text("j", 812, 26);
  text("k", 847, 26);
  text("l", 884, 26);
  text("My beautiful drawing", 30, 30);

  //The function onPaper() from the Brush class does that actual drawing and defines the cursor
  br.onPaper(fillVal, brushSize, shape);
}

//Function that takes in different parameters that make up a rectangle with a color and a text
void drawRectangle(color c, int w, int h, int posX, int posY, String letter) {
  noStroke();
  fill(c);
  rect(posX, posY, w, h);
  fill(0);
  text(letter, posX+3, posY+45);
}

void drawTriangle(color c, int x1, int y1, int x2, int y2, int x3, int y3) {
  noStroke();
  fill(c);
  triangle(x1, y1, x2, y2, x3, y3);
}

//Assigning color-values to the rectangles at the bottom, when the mouse is pressed in that area
void mousePressed() {
  if (mouseY > 650) {
    if (mouseX < (450/7)) {
      fillVal = colors[1];
    } else if (mouseX < ((450/7)*2)) {
      fillVal = colors[2];
    } else if (mouseX < ((450/7)*3)) {
      fillVal = colors[3];
    } else if (mouseX < ((450/7)*4)) {
      fillVal = colors[4];
    } else if (mouseX < ((450/7)*5)) {
      fillVal = colors[5];
    } else if (mouseX < ((450/7)*6)) {
      fillVal = colors[6];
    } else if (mouseX < ((450/7)*7)) {
      fillVal = colors[7];
    } //Defining the size of the brush by mapping the rectangle on the right side to brushsizes
    else if (mouseX < 800) {
      brushSize = map(mouseX, 451, 800, 3, 50);
    } //Mousepress in down, right corner leads to saving of frame in Data-folder. Using the toDataFolder() from the SaveImage class
    else if (mouseX < 900) {
      img.toDataFolder();
    }
  }
}

//Assigning color-values to different keys
void keyPressed() {
  if (key == 'w') {
    fillVal = colors[1];
  } else if (key == 'e') {
    fillVal = colors[2];
  } else if (key == 'r') {
    fillVal = colors[3];
  } else if (key == 't') {
    fillVal = colors[4];
  } else if (key == 'y') {
    fillVal = colors[5];
  } else if (key == 'u') {
    fillVal = colors[6];
  } else if (key == 'i') {
    fillVal = colors[7];
    //Press 'j-l' to alter between different 2D shapes
  } else if (key == 'j') {
    shape = 0;
  } else if (key == 'k') {
    shape = 1;
  } else if (key == 'l') {
    shape = 2;
    //Press 's' and save frame to Data-folder
  } else if (key =='s') {
    img.toDataFolder();
  } else {
    fillVal = colors[0];
  }
}
