class Planet {
  float radius = random(5, 22);
  //float distance = random(sunRadius + 20, 200); 
  float distance;
  float position;
  float angle = random(0, 120);
  color c = color(50, random(100, 160), random(170, 230));
  float speed;

  Planet(float d) {
    distance = d;
    speed = map(distance, sunRadius + 20, 280, 0.02, 0.002);
  }  

  void display() {
    pushMatrix();
    float x = distance * sin(angle);
    float y = distance * cos(angle);
    translate(width / 2 + x, height / 2 + y);
    fill(c);
    sphere(radius);
    popMatrix();
    angle += speed;
  }

  void update() {
  }
}  
