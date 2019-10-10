class Snake {
  int xspacing = int(random(1, 5));   // How far apart should each horizontal location be spaced
  //int xspacing = 3;   // How far apart should each horizontal location be spaced
  color rectColor = color(255, 20);
  int t = 1;
  float ellipseSize = 5;
  float alphaValue = random(70, 200);
  int w = width * 5;
  int headIncrement = 8;
  float theta = 0.0;  // Start angle at 0
  float amplitude;  // Height of wave
  float period = random(6, 100);  // How many pixels before the wave repeats
  float[] yvalues = new float[w/xspacing]; // Using an array to store height values for the wave
  float dx = (TWO_PI / period) * xspacing;
  float yHeightIncrement;
  float originalAmplitude;
  float decreaseAmp = 0;
  float increaseAmp =random(100, 120);
  color c = color(random(60, 150), random(100, 220), random(160, 250));

  Snake(float yHeightAdd, float amp) {
    yHeightIncrement = yHeightAdd;
    amplitude = amp;
    originalAmplitude = amp;
  }  
  void calcWave() {
    // Increment theta (try different values for 'angular velocity' here
    theta += 0.02;
    amplitude += map(mouseY, 0, width, -0.2 + decreaseAmp, 0.2 +random(0.1, 0.4));
    amplitude = constrain(amplitude, originalAmplitude - decreaseAmp, originalAmplitude + increaseAmp + map(noise(t), 0, 1, 0, 20));
    //xspacing = int(map(mouseX, 0, width, 1, 7));
    //xspacing = constrain(xspacing, 1, 10);
    //period = map(mouseX, 0, width, -0.1, 0.1);
    dx = (TWO_PI / period) * float(xspacing);
    println(xspacing);
    //period = constrain(period, originalAmplitude - decreaseAmp + map(noise(t), 0, 1, -20, -1), originalAmplitude + increaseAmp + map(noise(t), 0, 1, 0, 20));
    // For every x value, calculate a y value with sine function
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      if (i % 2 == 0) {
        yvalues[i] = sin(x)*amplitude;
      } else {
        yvalues[i] = cos(x)*amplitude;
      }  
      x+=dx;
      //println(period);
    }
  }

  void renderWave() {
    noStroke();
    // A simple way to draw the wave with an ellipse at each location
    for (int x = 0; x < yvalues.length; x++) {
      if (x % 30 == 0) {
        fill(rectColor);
        rect(x, height / 2, 30, map(height/yHeightIncrement+yvalues[x], 0, height, 0, height/2 - 80 * 0.8));
        rect(x, height / 2, 30, map(height/yHeightIncrement+yvalues[x], 0, height, 0, -height/2 + 80 * 0.8));
        //rect(x, height / 2, 30, map(height/yHeightIncrement+yvalues[x], 0, height, 0, height/2 - 80 * 0.8));
        //rect(x, height / 2, 30, map(height/yHeightIncrement+yvalues[x], 0, height, 0, -height/2 + 80 * 0.8));
        //rect(x, height/2+yvalues[x] - 30, 30, height/2+yvalues[x]  30);
      }

      fill(c, alphaValue);
      ellipse(x*xspacing, height/yHeightIncrement+yvalues[x], ellipseSize, ellipseSize);
    }

    //println(yvalues[2]);
    //t+=20;
    //println(noise(t));
  }
}  
