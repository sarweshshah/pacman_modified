/* Pacman Modified |  Copyright (c) 2018 National Institute of Design 
 * Sarwesh Shah - http://sarweshshah.me
 *
 * The classic Pacman game with a twist. Main player sprite will be replaced
 * with his/her face. Cake class is eatable that player consumes.
 */

int step;

Player player1;
Food[] melons;

void setup() {
  size(960, 720);
  background(2, 1, 56); //Setup a dark blue background
  frameRate(500);

  player1 = new Player(15, 15);
  melons = new Food[4];
}

void draw() {
  player1.display();

  for (int i = 0; i < 4; i++) {
  }

  textSize(20);
  text("Player Points: " + player1.gamePoints, 800, 30);
}

void keyPressed() {
  step += 20; // Activate while lerping
  // step = 10; // Activate while not lerping
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
  step = 0; // Activate while lerping
}
