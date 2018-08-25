/* Cake class |  Copyright (c) 2018 National Institute of Design 
 * Sarwesh Shah - http://sarweshshah.me
 */

class Food {
  PImage food;
  float startX;
  float startY;

  Food(float tempX, float tempY) {
    food = loadImage("watermelon.png");
    startX = tempX;
    startY = tempY;
  }
  
  Food() {
    food = loadImage("watermelon.png");
    startX = random(50, width - 50);
    startY = random(50, height - 56);
  }

  void display() {
    image(food, startX, startY);
  }

  void display(float tempX, float tempY) {
    image(food, tempX, tempY);
  }

  void move() {
  }
}
