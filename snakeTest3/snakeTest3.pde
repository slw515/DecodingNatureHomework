float addButtonX;
float addButtonY = 50;

float subButtonX = (width / 2) - 50;
float subButtonY = 50;

float buttonSize = 50;

boolean addCircle = false;
boolean removeCircle = false;

Snake snakes[];
int snakeCount = 4;
void setup() {
  addButtonX = (width / 2) + 50;
  subButtonX = (width / 2) - 50;

  size(800, 500);
  ellipseMode(CENTER);

  snakes = new Snake[snakeCount];

  int index = 0;

  for (int i = 0; i < snakeCount; i++) {
    snakes[index++] = new Snake(2, random(3, 40));
  }
}

void draw() {
  background(0, 230);
  update(mouseX, mouseY);
  //for (int i = 0; i < snakes.length; i++) {

  //}  

  for (int i = 0; i < width; i += 30) {
    stroke(235);
    fill(70, 70, 90);
    rect(i, 0, 30, height);
  }  
  for (Snake snake : snakes) {
    snake.calcWave();
    snake.renderWave();
  }

  fill(255);
  textAlign(CENTER);
  text("increase amplitude by putting mouse towards bottom of the screen", width/2, height - 100);


  //calcWave();
  //renderWave();
  fill(255);
  text("increase/decrease number of particles", width/2, 100);

  ellipse(addButtonX, addButtonY, buttonSize, buttonSize);
  ellipse(subButtonX, subButtonY, buttonSize, buttonSize);

  fill(0);

  text("-", addButtonX, addButtonY);
  text("+", subButtonX, subButtonY);

  //slither+=0.5;
  //amplitude += map(noise(t), 0, 1, -1, 1);
  //println(amplitude);
}

void drawBeam() {
}  

boolean overCircle(float x, float y, float diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

void update(int x, int y) {
  if ( overCircle(addButtonX, addButtonY, buttonSize) ) {
    addCircle = true;
    removeCircle = false;
  } else if ( overCircle(subButtonX, subButtonY, buttonSize) ) {
    addCircle = false;
    removeCircle = true;
  } else {
    addCircle = removeCircle = false;
  }
}

void mousePressed() {
  if (addCircle) {
    println("hello adding");
    for (Snake snake : snakes) {
      if (snake.xspacing >= 30) {
        snake.xspacing = 30;
      } else {
        snake.xspacing += 2;
      }
    }
  }
  if (removeCircle) {
    println("hello subtracting");
    for (Snake snake : snakes) {
      if (snake.xspacing <= 1) {
        snake.xspacing = 1;
      } else {
        snake.xspacing -= 2;
      }
    }
  }
}

//void
