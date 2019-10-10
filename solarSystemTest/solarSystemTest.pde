Planet[] planets = new Planet[7];

import peasy.*;

PeasyCam cam;

int sunRadius = 70;
void setup() {
  size(700, 700, P3D);
  for (int i = 0; i < planets.length; i++) {
    planets[i] = new Planet((sunRadius * 1.4) + (i * 30));
  }
}

void draw() {
  lights();
  background(0);
  noStroke();

  pushMatrix();
  fill(239, 145, 50);

  translate(width / 2, height / 2);
  sphere(sunRadius);
  popMatrix();

  for (int i = 0; i < planets.length; i++) {
    planets[i].display();
  }
}   
