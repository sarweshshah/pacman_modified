/* Pacman Modified |  Copyright (c) 2018 National Institute of Design 
 * Sarwesh Shah - http://sarweshshah.me
 *
 * The classic Pacman game with a twist. Main player sprite will be replaced
 * with his/her face. Cake class is eatable that player consumes.
 */

import java.util.List;

int step;

Player player1;
List<Food> melons;
Bite bite;
int foodCount = 10;

void setup() {
  size(960, 720);
  surface.setResizable(true);

  player1 = new Player(15, 15);

  melons = new ArrayList<Food>();
  for (int i = 0; i < foodCount; i++) {
    melons.add(new Food());
  }

  bite = new Bite(this);
}

void draw() {
  if (melons.size() != 0) {
    background(233, 232, 222);

    for (int i = 0; i < melons.size(); i++) {
      melons.get(i).display();
    }

    player1.display();

    textSize(20);
    fill(0);
    text("Player Points: " + player1.gamePoints, 790, 30);
  } else {
    textSize(80);
    textAlign(CENTER, CENTER);
    text("Well Played!", width/2, height/2);
  }

  // saveFrame("frames/####.tif");
}

void keyPressed() {
  step += 10;

  // If player frame engulfs food frame, destroy food instance
  for (int i = 0; i < melons.size(); i++) {
    if (player1.isEngulfing(melons.get(i))) {
      melons.remove(i);
      bite.play();
      player1.gamePoints++;
    }
  }

  if (key == CODED) {
    if (keyCode == RIGHT && player1.posX < width - 120) {
      player1.facing = RIGHT;
      player1.moveRight(step);
    }

    if (keyCode == LEFT && player1.posX > 0) {
      player1.facing = LEFT;
      player1.moveLeft(step);
    }  

    if (keyCode == UP && player1.posY > 0) {
      player1.facing = UP;
      player1.moveUp(step);
    }  

    if (keyCode == DOWN && player1.posY < height - 160) {
      player1.facing = DOWN;
      player1.moveDown(step);
    }
  }
}

void keyReleased() {
  step = 0;
}
