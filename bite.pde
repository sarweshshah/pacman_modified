/* Bite class |  Copyright (c) 2018 National Institute of Design 
 * Sarwesh Shah - http://sarweshshah.me
 *
 */

import processing.sound.*;

class Bite {
  SoundFile bite;

  Bite(PApplet a) {
    bite = new SoundFile(a, "bite.mp3");
  }

  void play() {
    bite.play();
  }
}
