/* Cake class |  Copyright (c) 2018 National Institute of Design 
 * Sarwesh Shah - http://sarweshshah.me
 */

class Food {
  PImage food;
  float x;
  float y;

  Food(float tempX, float tempY) {
    food = loadImage("watermelon.png");
    x = tempX;
    y = tempY;
  }

  void displayFood() {
    image(food, x, y);
  }

  void displayFood(float tempX, float tempY) {
    image(food, tempX, tempY);
  }

  void moveFood() {
  }

  boolean isInBounds(int pointX, int pointY) {
    if ((pointX > x) && (pointX < x + food.width) && 
      (pointY > y) && (pointY < y + food.height)) {
      return true;
    }
    return false;
  }
}
