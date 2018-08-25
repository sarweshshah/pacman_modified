/* Player class |  Copyright (c) 2018 National Institute of Design
 * Sarwesh Shah - http://sarweshshah.me
 */

float factor = 0.095;

class Player {
  PImage close_mouth;
  PImage open_mouth;

  int gamePoints; //Count of points secured by the player

  // Position and orientation
  float posX, posY; // position coordinates
  float imgW, imgH; // size
  int facing; // orientation [left, right, up, down]

  Player(float tempX, float tempY) {
    close_mouth = loadImage("closed.png");
    open_mouth = loadImage("open.png");

    gamePoints = 0;

    posX = tempX;
    posY = tempY;
    facing = RIGHT;

    imgW = close_mouth.width;
    imgH = close_mouth.height;
  }

  Player() {
    this(0, 0);
  }

  void showOpenMouth(float tempX, float tempY) {
    pushMatrix();
    translate(tempX + 50, tempY + 56);
    updateOrientation();
    image(open_mouth, -50, -56);
    popMatrix();
  }

  void showClosedMouth(float tempX, float tempY) {
    pushMatrix();
    translate(tempX + 50, tempY + 56);
    updateOrientation();
    image(close_mouth, -50, -56);
    popMatrix();
  }

  void display(float tempX, float tempY) {
    int elaspedTime = millis();
    if (keyPressed) {
      if (elaspedTime % 1000 <= 500) {
        showOpenMouth(tempX, tempY);
      } else {
        showClosedMouth(tempX, tempY);
      }
    } else {
      showClosedMouth(tempX, tempY);
    }
  }

  void display() {
    this.display(posX, posY);
  }

  void moveRight(int step) {
    posX = lerp(posX, posX + step, factor);
  }

  void moveLeft(int step) {
    posX = lerp(posX, posX - step, factor);
  }

  void moveUp(int step) {
    posY = lerp(posY, posY - step, factor);
  }

  void moveDown(int step) {
    posY = lerp(posY, posY + step, factor);
  }

  void updateOrientation() {
    if (facing == LEFT) {
      scale(-1.0, 1.0);
    }
    if (facing == RIGHT) {
      scale(1.0, 1.0);
    }
    if (facing == UP) {
      rotate(-90.0);
    }
    if (facing == DOWN) {
      rotate(90.0);
    }
  }

  boolean isEngulfing(Food f) {
    if ((f.startX > posX) && (f.startY > posY) && 
      ((f.startX + f.imgW) < (posX + imgW)) && ((f.startY + f.imgH) < (posY + imgH))) return true;
    return false;
  }
}
