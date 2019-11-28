import processing.serial.*; // Import Serial library to talk to Arduino 
Serial myPort; // Send  value to Arduino // 


void serialSetup() {
  printArray(Serial.list()); // shows available serial ports on the system 

  // Change 0 to select the appropriate port as required. 
  String portName = Serial.list()[3]; 
  myPort = new Serial(this, portName, 9600);
}


void sendSerial() {
  Rectangle[] faces = opencv.detect();
  //for (int i = 0; i < faces.length; i++) {
  //  rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  //}
 
if(faces.length>0){   
    float posX=map(faces[0].x,20,500,0,180);
    float posY=map(faces[0].y,20,500,0,180);
    //myPort.write(int(posX)+";");
  
  
  
  myPort.write(int(posX)+","+int(posY)+";");
}
}
