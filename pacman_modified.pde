/* Pacman Modified |  Copyright (c) 2018 National Institute of Design 
 * Sarwesh Shah - http://sarweshshah.me
 *
 * The classic Pacman game with a twist. Main player sprite will be replaced
 * with his/her face. Cake class is eatable that player consumes.
 */

int step;

Player player1;
Food[] melons;
int foodCount;

void setup() {
  size(960, 720);
  background(2, 1, 56); //Setup a dark blue background

  player1 = new Player(15, 15);
  foodCount = 10;
  
  melons = new Food[foodCount];
  for (int i = 0; i < foodCount; i++) {
    melons[i] = new Food();
  }
}

void draw() {
  background(2, 1, 56);

  for (int i = 0; i < foodCount; i++) {
    melons[i].display();
  }

  player1.display();
  
  textSize(20);
  text("Player Points: " + player1.gamePoints, 800, 30);
}

void keyPressed() {
  step += 20;
  if (key == CODED) {
    if (keyCode == RIGHT && player1.x < width - 120) {
      player1.facing = RIGHT;
      player1.moveRight(step);
    } else if (keyCode == LEFT && player1.x > 0) {
      player1.facing = LEFT;
      player1.moveLeft(step);
    } else if (keyCode == UP && player1.y > 0) {
      player1.facing = UP;
      player1.moveUp(step);
    } else if (keyCode == DOWN && player1.y < height - 160) {
      player1.facing = DOWN;
      player1.moveDown(step);
    }
  }
}

void keyReleased() {
  step = 0;
}
