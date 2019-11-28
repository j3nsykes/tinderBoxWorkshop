import processing.serial.*; // Import Serial library to talk to Arduino 

float diameter; 
float angle = 0;
float data;
float newData;

Serial myPort; // Send  value to Arduino // 

void setup() {
  printArray(Serial.list()); // shows available serial ports on the system 

  // Change 0 to select the appropriate port as required. 
  String portName = Serial.list()[3]; 
  myPort = new Serial(this, portName, 9600);


  size(640, 360);
  diameter = height - 10;
  noStroke();
  fill(255, 204, 0);
}

void draw() {

  background(0);

  //  float d1 = 10 + (sin(angle) * diameter/2) + diameter/2;
  float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
  // float d3 = 10 + (sin(angle + PI) * diameter/2) + diameter/2;

  //  ellipse(0, height/2, d1, d1);
  ellipse(width/2, height/2, d2, d2);
  //ellipse(width, height/2, d3, d3);

  angle += 0.02;
  data=int(d2);
  //println(d2);
  newData=map(data, 10, 360, 0, 255);
  serialSend();
}
void serialSend() {
//send the information out!
  myPort.write(int(newData)+";");
}
