/* Cake class |  Copyright (c) 2018 National Institute of Design 
 * Sarwesh Shah - http://sarweshshah.me
 */

class Food {
  PImage food;

  float startX, startY;
  float imgW, imgH;

  Food(float tempX, float tempY) {
    food = loadImage("food-" + (int)random(1, 9) + ".png");
    startX = tempX;
    startY = tempY;

    imgW = food.width;
    imgH = food.height;
  }

  Food() {
    food = loadImage("food-" + (int)random(1, 9) + ".png");
    startX = random(50, width - 70);
    startY = random(50, height - 76);
  }

  void display() {
    image(food, startX, startY);
    move();
  }

  void display(float tempX, float tempY) {
    image(food, tempX, tempY);
  }

  void move() {
  }
}
