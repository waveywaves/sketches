
float angle = -PI/6;

void setup(){
  size(500,500,P3D);
  background(255);
  colorMode(HSB);
  lights();
}

void draw(){
  push();
  translate(width/2, height, -500);
  setBackground(600, 300);
  pop();
  
  push();
  translate(width/2, height/2, -500);
  setBackground(width*2, height/4);
  pop();
  
  push();
  translate(width/2, height/2, -50);
  stroke(255);
  strokeWeight(1);
  directionalLight(51, 102, 126, -1, 0, 0);
  rotateX(PI/2.5);
  rotateZ(angle);
  fill(increment*2);
  pyramid(0,0,0,100);
  pop();
  
  push();
  translate(width/2, height/2, -50);
  stroke(255);
  strokeWeight(1);
  rotateX(PI/2.5);
  rotateZ(PI/4+angle);
  fill(increment*2);
  pyramid(0,0,0,100);
  pop();
  
  push();
  translate(width/2, height/2, -50);
  stroke(255);
  strokeWeight(1);
  rotateX(angle);
  rotateZ(-angle);
  fill(increment*2);
  pyramid(0,0,0,-9);
  pop();
  
  push();
  translate(width/2, height/2, -50);
  stroke(255);
  strokeWeight(1);
  rotateX(-angle);
  rotateZ(PI/4-angle);
  fill(increment*2);
  pyramid(0,0,0,-9);
  pop();
  
  push();
  translate(width/2, height/2, -50);
  stroke(255);
  strokeWeight(1);
  rotateX(PI/2.5);
  rotateZ(-angle);
  fill(increment*2);
  pyramid(0,0,0,-53);
  pop();
  
  push();
  translate(width/2, height/2, -50);
  stroke(255);
  strokeWeight(1);
  rotateX(PI/2.5);
  rotateZ(PI/4-angle);
  fill(increment*2);
  pyramid(0,0,0,-53.4);
  pop();
 
  angle += PI/400;
}

void pyramid(float x, float y, float z, float l) {
  beginShape();
  vertex(x-l, y-l, z-l);
  vertex(x+l, y-l, z-l);
  vertex(0, 0, z+l);
  
  vertex(x+l, y-l, z-l);
  vertex(x+l, y+l, z-l);
  vertex(0, 0, z+l);

  vertex(x+l, y+l, z-l);
  vertex(x-l, y+l, z-l);
  vertex(0, 0, z+l);

  vertex(x-l, y+l, z-l);
  vertex(x-l, y-l, z-l);
  vertex(0, 0, z+l);
  endShape();
}
