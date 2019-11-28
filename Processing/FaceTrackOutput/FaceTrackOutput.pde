import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture cam;
OpenCV opencv;

void setup() {
  size(640, 480);
  setUpCamera();
  setUpOpenCV();
  serialSetup();
}

void setUpCamera() {
  //String[] cameras = Capture.list();
  //printArray(cameras);
  // Capture(this, width, height, "Name", fps)
  //cam = new Capture(this, 640, 480, "FaceTime HD Camera", 30);
  //cam = new Capture(this, 640, 480, "Logitech Camera");
  cam = new Capture(this, 640, 480);
  cam.start();
}

void setUpOpenCV() {
  opencv = new OpenCV(this, 640, 480);
  opencv.loadCascade("haarcascade_frontalface_default.xml");
}

void draw() {
  if (cam.available()) {
    cam.read();
    opencv.loadImage(cam);
  }
  pushMatrix();
  // flip (mirror) entire scene
  scale(-1, 1);
  translate(-width, 0);
  // show camera image
  image(cam, 0, 0);
  //step through array of faces and draw each
  stroke(0, 255, 0);
  strokeWeight(4);
  noFill();

  Rectangle[] faces = opencv.detect();
  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    println("face ["+i+"] :"+faces[i].x, faces[i].y);
  }
  popMatrix();
  sendSerial();
}

// Callback method - does the same as cam.available();
//void captureEvent(Capture c) {
//  c.read();
//}
