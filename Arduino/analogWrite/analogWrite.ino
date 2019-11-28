/*
Simple analogWrite Example
imitating blink action but in analog outputs
*/

void setup() {
  // put your setup code here, to run once:
  // initialize the digital pin as an output.
  pinMode(9, OUTPUT);   
}

void loop() {
  // put your main code here, to run repeatedly:
  analogWrite(led, 0);   // turn the LED on (HIGH is the voltage level)
  delay(1000);               // wait for a second
  analogWrite(led, 255);    // turn the LED off by making the voltage LOW
  delay(1000);               // wait for a second
}
