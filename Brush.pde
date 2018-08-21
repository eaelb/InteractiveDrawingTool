class Brush {

  //Variables, and instiating a PGraphics
  PGraphics pg = createGraphics(900, 615);

  //Function for drawing that takes in three parameters; color and size and shape
  void onPaper(color c, float size, int shape) {
    
    //If the mouse is pressed, it starts drawing PGraphics
    if (mousePressed) {
      pg.beginDraw();
      pg.noStroke();
      pg.fill(c);
      
      //Based on int shape '0-2', it draws an ellipse, triangle or rectangle
      if (shape == 0) {
        pg.ellipse(mouseX, mouseY-35, size, size);
      } else if (shape == 1) {
        pg.triangle(mouseX-size, mouseY+(size/2)-35, mouseX+size, mouseY+(size/2)-35, mouseX, mouseY-(size/2)-35);
      } else if (shape == 2) {
        pg.rect(mouseX-(size/2), mouseY-(size/2)-35, size, size);
      }
      pg.endDraw();
    }
    
    //Placing the PGraphics image underneath the header
    image(pg, 0, 35);

    //Draw the actual brush marker as the cursor
    noStroke();
    fill(c);
    //Based on int shape '0-2', the brush marker is an ellipe, triangle or rectangle
    if (shape == 0) {
      ellipse(mouseX, mouseY, size, size);
    } else if (shape == 1) {
      triangle(mouseX-size, mouseY+(size/2), mouseX+size, mouseY+(size/2), mouseX, mouseY-(size/2));
    } else if (shape == 2) {
      rect(mouseX-(size/2), mouseY-(size/2), size, size);
    }
    noCursor();
  }
}
