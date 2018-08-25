/* Player class |  Copyright (c) 2018 National Institute of Design
 * Sarwesh Shah - http://sarweshshah.me
 */

float factor = 0.095;

class Player {
  PImage close_mouth;
  PImage open_mouth;

  int gamePoints; //Count of points secured by the player

  // Position and orientation
  float x, y; // position coordinates
  int facing; // orientation [left, right, up, down]

  Player(float tempX, float tempY) {
    close_mouth = loadImage("closed.png");
    open_mouth = loadImage("open.png");

    gamePoints = 0;

    x = tempX;
    y = tempY;
    facing = RIGHT;
  }

  Player() {
    this(0, 0);
  }

  void showOpenMouth() {
    pushMatrix();
    translate(x + 50, y + 56);
    updateOrientation();
    image(open_mouth, -50, -56);
    popMatrix();
  }

  void showClosedMouth() {
    pushMatrix();
    translate(x + 50, y + 56);
    updateOrientation();
    image(close_mouth, -50, -56);
    popMatrix();
  }

  void display(float tempX, float tempY) {
    int elaspedTime = millis();
    background(2, 1, 56);
    if (keyPressed) {
      if (elaspedTime % 1000 <= 500) {
        showOpenMouth();
      } else {
        showClosedMouth();
      }
    } else {
      showClosedMouth();
    }
  }

  void display() {
    this.display(x, y);
  }

  void moveRight(int step) {
    x = lerp(x, x + step, factor);
  }

  void moveLeft(int step) {
    x = lerp(x, x - step, factor);
  }

  void moveUp(int step) {
    y = lerp(y, y - step, factor);
  }

  void moveDown(int step) {
    y = lerp(y, y + step, factor);
  }

  boolean isInBounds(int pointX, int pointY) {
    if ((pointX > x) && (pointX < x + 100) && 
      (pointY > y) && (pointY < y + 140)) {
      return true;
    }
    return false;
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
}
