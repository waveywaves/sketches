
float angle = -PI/6;
int framesElapsed = 0;

void setup(){
  size(500,500,P3D);
  background(255);
  colorMode(HSB);
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
  
  new PyramidSketch(width/2, height/2+increment/2, PI/400, 100, increment/5);
  new PyramidSketch(width, height+increment/100, 0, 10, increment/10);
  new PyramidSketch(width, height+increment/100, 0, -10, increment/10);
  
  new PyramidSketch(-width, -height, 0, 1000, increment/5);
  new PyramidSketch(-width/1.5, height, 0, 500, increment/5);
  new PyramidSketch(width, -height, 0, 1000, increment/5);
  new PyramidSketch(width*0.25, height*0.25+increment/5, 0, 35, increment/6);
  new PyramidSketch(width*0.85, height*0.55+increment/4, 0, 25, increment/7);
  new PyramidSketch(width*0.75, height*0.15+increment/3, 0, 30, increment/8);
  new PyramidSketch(width*0.10, height*0.85+increment/2, 0, 35, increment/9);
  new PyramidSketch(width*0.60, height*0.95+increment/2, 0, 30, increment/6);
  new PyramidSketch(width*0.30, height*1.15+increment/2, 0, 25, increment/9);
  new PyramidSketch(width*0.001, height*0.05+increment/2, 0, 25, increment/9);
  new PyramidSketch(width*0.65, height*1.25+increment/2, 0, 25, increment/9);
  
  framesElapsed++;
  if (framesElapsed > 5400){
    exit();
  }
  //saveFrame("output/illumi####.png");
  //print("\n",framesElapsed);
}
class PyramidSketch {
  PyramidSketch(float translateWidth, float translateHeight, float angleIncrement, float relativeMaxSize, float c){
    
    color strokeColor = color(c*100,100*c/10,200+c);
    float sW = 1.7;
    push();
    translate(translateWidth, translateHeight, -50);
    stroke(strokeColor);
    strokeWeight(sW);
    rotateX(PI/2.5);
    rotateZ(angle);
    fill(increment*2);
    pyramid(0,0,0,relativeMaxSize);
    pop();
    
    push();
    translate(translateWidth, translateHeight, -50);
    stroke(strokeColor);
    strokeWeight(sW);
    rotateX(PI/2.5);
    rotateZ(PI/4+angle);
    fill(increment*2);
    pyramid(0,0,0,relativeMaxSize);
    pop();
    
    push();
    translate(translateWidth, translateHeight, -50);
    stroke(strokeColor);
    strokeWeight(sW);
    rotateX(angle);
    rotateZ(-angle);
    fill(increment*2);
    pyramid(0,0,0,-(0.09*relativeMaxSize));
    pop();
    
    push();
    translate(translateWidth, translateHeight, -50);
    stroke(strokeColor);
    strokeWeight(sW);
    rotateX(-angle);
    rotateZ(PI/4-angle);
    fill(increment*2);
    pyramid(0,0,0,-(0.09*relativeMaxSize));
    pop();
    
    push();
    translate(translateWidth, translateHeight, -50);
    stroke(strokeColor);
    strokeWeight(sW);
    rotateX(PI/2.5);
    rotateZ(-angle);
    fill(increment*2);
    pyramid(0,0,0,-(0.53*relativeMaxSize));
    pop();
    
    push();
    translate(translateWidth, translateHeight, -50);
    stroke(strokeColor);
    strokeWeight(sW);
    rotateX(PI/2.5);
    rotateZ(PI/4-angle);
    fill(increment*2);
    pyramid(0,0,0,-(0.534*relativeMaxSize));
    pop();
   
    angle += angleIncrement;
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
}
