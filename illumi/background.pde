// Color info : lower half
// 020548 -> 020120
// 237, 97, 28 -> 242, 97, 13
//
// upperFirstThird
// 242, 97, 13 -> 181, 100, 80
// 
// upperSecondThird
// 181, 100, 80 -> 286, 84, 45
//
// upperThirdThird
// 286, 84, 45 -> 348, 99, 47

float increment = -120;
boolean incrementDescend = false;

void setBackground(int translatedWidth, int translatedHeight){
 for (int i=0; i < translatedHeight; i++){
    PVector hsb = mapToHSB(i, translatedHeight, 0, new PVector(237, 97, 28), new PVector(242, 97, 13));
    stroke(hsb.x, hsb.y, hsb.z);
    line(-translatedWidth, i, translatedWidth, i);
  }
  for (int i=-translatedHeight*3; i < 0 ; i++){
    PVector hsb =  mapToHSB(i, 0, -translatedHeight*3, new PVector(242, 97, 13), new PVector(181, 100, 80));
    stroke(hsb.x, hsb.y, hsb.z);
    line(-translatedWidth, i, translatedWidth, i);
  }
  for (int i=(-translatedHeight*6); i < -translatedHeight*3 ; i++){
    PVector hsb =  mapToHSB(i, -translatedHeight*3, (-translatedHeight*3)*2, new PVector(181, 100, 80), new PVector(286, 84, 45));
    stroke(hsb.x, hsb.y, hsb.z);
    line(-translatedWidth, i, translatedWidth, i);
  }
  for (int i=(-translatedHeight*9); i < (-translatedHeight*6); i++){
    PVector hsb =  mapToHSB(i, (-translatedHeight*3)*2, (-translatedHeight*3)*3, new PVector(286, 84, 45), new PVector(348, 99, 47));
    stroke(hsb.x, hsb.y, hsb.z);
    line(-translatedWidth, i, translatedWidth, i);
  }
  updateIncrement();
}

void updateIncrement(){
  if (increment >= 30){
    incrementDescend = true;
  }
  if (increment <= 10){
    incrementDescend = false;
  }
  if (incrementDescend){
    increment -= 0.1;
  } else {
    increment += 0.1;
  }
}

PVector mapToHSB(int c, int end, int start, PVector hsb1, PVector hsb2){
  float mappedH = map(c, end, start, hsb1.x+increment, hsb2.x+increment);
  float mappedS = map(c, end, start, hsb1.y, hsb2.y+increment);
  float mappedB = map(c, end, start, hsb1.z, hsb2.z);
  return new PVector(mappedH, mappedS, mappedB);
}
