ArrayList<ArrayList<Mover>> MoverSets;
boolean forward = true;
int r = 15;
int frameNo = 0;
void setup(){
  background(bckColor());
  size(500,500);
  MoverSets = new ArrayList<ArrayList<Mover>>();
  for (int i = 0; i < 15; i++ ){
     MoverSets.add(setupMovers());
  }
}

void draw(){
  frameNo++;
  background(bckColor());
  for (int msi=0; msi < MoverSets.size(); msi++){
    ArrayList<Mover> moverset = MoverSets.get(msi);
    for (int ms=0; ms < moverset.size(); ms++){
      Mover m = moverset.get(ms);
      m.update();
      m.display();
    }
  }
  //if (frameNo > 7200){
  //  exit();
  //} else {
  //  saveFrame("output/revolve_####.png");
  //}
}

int bckColor(){
  r = oscillateColor(r,14,30);
  return color(r, 154, 167);
}

int oscillateColor(int current, int min, int max){
  int c = current;
  if (current <= min){
    forward = true;
  } else if(current >= max){
    forward = false;
  } else if (current > min && current < max){
    if (forward){
      c++;
    } else {
      c--;
    }
  }
  return c;
}

ArrayList<Mover> setupMovers(){
  ArrayList<Mover> movers = new ArrayList<Mover>();
  float maxTotalRadius = width;
  float maxRadius = 50;
  float coveredTotalRadius = 0;
  boolean alternater = true;
  while (coveredTotalRadius < maxTotalRadius) {
    float diameter = 0;
    color c = color(246, 205, 97);
    if (maxTotalRadius - coveredTotalRadius < maxRadius){
      diameter = maxTotalRadius - coveredTotalRadius;
    } else {
      diameter = random(maxRadius*2);
    }
    if (alternater) {
      c = color(61, 164, 171);
    }
    coveredTotalRadius += diameter;
    alternater = !alternater;
    Mover mover = new Mover(coveredTotalRadius, coveredTotalRadius, diameter/2, random(PI/120,PI/60), c, false);
    movers.add(mover);
  }
  return movers;
}

class Mover {
  PVector center;
  PVector location;
  float angle;
  float radius;
  float objectRadius;
  float increment;
  color col;
  ArrayList<Mover> history;
  float iteration;
  int trail;

  Mover(float x, float y, float r, float i, color c, boolean isHistory) {
    history = new ArrayList<Mover>();
    iteration = 0;
    objectRadius = r;
    increment = i;
    col = c;
    trail = 5;
    if (!isHistory){
      translate(width/2, height/2);
    }
    center = new PVector(width/2, height/2);
    location = new PVector(x,y);
    float deltaX = center.x - location.x;
    float deltaY = center.y - location.y;
    angle = atan2(deltaX, deltaY);
    radius = dist(center.x, center.y, location.x, location.y);
  }
  
  void update() {
    if (history.size() == trail) {
      history.remove(0);
    }
    // Update History for older
    if (history.size() > 0){
      for (int i = 0; i < history.size(); i++){
        Mover h = history.get(i);
        color hC = h.getCol();
        float changeInColor = random(1,2);
        h.setCol(hC << int(changeInColor));
        h.display();
      }
    } 
    
    // Update Current Location
    location.x = center.x + cos(angle)*radius;
    location.y = center.y + sin(angle)*radius;
    
    // Complete and update 
    angle += increment;
    iteration += 1;
  }
  
  void display() {
    stroke(col);
    fill(col);
    circle(location.x, location.y, objectRadius);
    history.add(new Mover(location.x, location.y, objectRadius, increment, col, true));
  }
  
  color getCol() {
    return col;
  }
  
  void setCol(color c) {
    col = c;
  }
}
