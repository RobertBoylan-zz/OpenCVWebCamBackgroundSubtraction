import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

int red;
int green;
int blue;
int randomColourChange;

void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);

  video.start();

  opencv.startBackgroundSubtraction(5, 3, 0.5);
  
  red = (int)random(0, 255);
  green = (int)random(0, 255);
  blue = (int)random(0, 255);
  randomColourChange = (int)random(0, 6);
}

void draw() {
  tint(red, green, blue);
  opencv.loadImage(video);

  image(video, 0, 0 );

  opencv.updateBackground();

  image(opencv.getOutput(), 0, 0, width, height);
  //blend(video, 0, 0, width, height, 0, 0, width, height, DARKEST);
  
  changeColour();
}

void captureEvent(Capture c) {
  c.read();
}

void changeColour() {
  if (randomColourChange == 0) {
    if (red < 255) {
      red++;
    } else {
      randomColourChange = (int)random(0, 6);
    }
  } else if (randomColourChange == 1) {
    if (red > 0) {
      red--;
    } else {
      randomColourChange = (int)random(0, 6);
    }
  } else if (randomColourChange == 2) {
    if (green < 255) {
      green++;
    } else {
      randomColourChange = (int)random(0, 6);
    }
  } else if (randomColourChange == 3) {
    if (green > 0) {
      green--;
    } else {
      randomColourChange = (int)random(0, 6);
    }
  } else if (randomColourChange == 4) {
    if (blue < 255) {
      blue++;
    } else {
      randomColourChange = (int)random(0, 6);
    }
  } else if (randomColourChange == 5) {
    if (blue > 0) {
      blue--;
    } else {
      randomColourChange = (int)random(0, 6);
    }
  }
}
