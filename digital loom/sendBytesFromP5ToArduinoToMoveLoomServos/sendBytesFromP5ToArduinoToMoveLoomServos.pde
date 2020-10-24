import processing.serial.*;
import java.util.BitSet;

import controlP5.*;
ControlP5 cp5;
// number of switch to send to Arduino, in one byte (up to 8 per byte)
final int NUM_SWITCHES = 8;

// Java object that represents a number of bits
BitSet switches = new BitSet(NUM_SWITCHES);

//the Serial communcation to the Arduino
Serial serial;

// possible serial rates
final String[] serialRateStrings = {
  "300", "1200", "2400", "4800", "9600", "14400", 
  "19200", "28800", "38400", "57600", "115200"
};

final int baud=57600;
final int serialDeviceIndex = 0; // first one
int x=0;
int y=0;
int lato=50;
int col11=255; 
int col21=255;
int col31=255;
int col41=255; 
int col51=255;
int col61=255;
int col71=255;
int col81=255;
int col12=255; 
int col22=255;
int col32=255;
int col42=255; 
int col52=255;
int col62=255;
int col72=255;
int col82=255;
boolean switch0 = false;
boolean switch1 = false;
boolean switch2 = false;
boolean switch3 = false;
boolean switch4 = false;
boolean switch5 = false;
boolean switch6 = false;
boolean switch7 = false;

void setup() 
{
  size(800, 600);
  background(249, 246, 236);
  // open serial port based on our settings
  // setupSerial(serialDeviceIndex, baud);
//rectode(CENTER);

  cp5 = new ControlP5(this);

  cp5.addToggle("switch0")
    .setPosition(40+100, height/2+50)
    .setSize(50, 50)
     .setColorLabel(color(0)) //text colour
    .setColorForeground(color(179, 77, 102)) //hover
    .setColorBackground(color(255,0,0)) //it normal 
    .setColorActive(color(179, 77, 77 )) //when pressed 
    ;

  cp5.addToggle("switch1")
    .setPosition(110+100, height/2+50)
    .setSize(50, 50)
     .setColorLabel(color(0)) //text colour
    .setColorForeground(color(179, 77, 102)) //hover
    .setColorBackground(color(255,0,0)) //it normal 
    .setColorActive(color(179, 77, 77 )) //when pressed 
    ;

  cp5.addToggle("switch2")
    .setPosition(180+100, height/2+50)
    .setSize(50, 50)
    .setColorLabel(color(0)) //text colour
    .setColorForeground(color(179, 77, 102)) //hover
    .setColorBackground(color(255,0,0)) //it normal 
    .setColorActive(color(179, 77, 77 )) //when pressed 

    ;   

  cp5.addToggle("switch3")
    .setPosition(250+100, height/2+50)
    .setSize(50, 50)
       .setColorLabel(color(0)) //text colour
    .setColorForeground(color(179, 77, 102)) //hover
   .setColorBackground(color(255,0,0)) //it normal 
    .setColorActive(color(179, 77, 77 )) //when pressed 

    ; 


  cp5.addToggle("switch4")
    .setPosition(320+100, height/2+50)
    .setSize(50, 50)
       .setColorLabel(color(0)) //text colour
    .setColorForeground(color(179, 77, 102)) //hover
   .setColorBackground(color(255,0,0)) //it normal 
    .setColorActive(color(179, 77, 77 )) //when pressed 
    ;

  cp5.addToggle("switch5")
    .setPosition(390+100, height/2+50)
    .setSize(50, 50)
       .setColorLabel(color(0)) //text colour
    .setColorForeground(color(179, 77, 102)) //hover
    .setColorBackground(color(255,0,0)) //it normal 
    .setColorActive(color(179, 77, 77 )) //when pressed 
    ;

  cp5.addToggle("switch6")
    .setPosition(460+100, height/2+50)
    .setSize(50, 50)
       .setColorLabel(color(0)) //text colour
    .setColorForeground(color(179, 77, 102)) //hover
   .setColorBackground(color(255,0,0)) //it normal 
    .setColorActive(color(179, 77, 77 )) //when pressed 

    ;

  cp5.addToggle("switch7")
    .setPosition(530+100, height/2+50)
    .setSize(50, 50)
       .setColorLabel(color(0)) //text colour
    .setColorForeground(color(179, 77, 102)) //hover
    .setColorBackground(color(255,0,0)) //it normal 
    .setColorActive(color(179, 77, 77 )) //when pressed 

    ;





  String portName ="/dev/cu.usbmodem14101";
  serial= new Serial (this, portName, 9600);

  //switches.clear(); // set all to 0
  //switches.set(0, true); // set rightmost switch to on
  //switches.set(1, true); // just for fun, 3rd switch from left
  //switches.set(2, true); // just for fun, 2nd switch from left
  //switches.set(3, true); // just for fun, 3rd switch from left
  //switches.set(4, true); // just for fun, 2nd switch from left
  //switches.set(5, true); // just for fun, 2nd switch from left
  //switches.set(6, true); // just for fun, 2nd switch from left
  //switches.set(7, true); // just for fun, 2nd switch from left

  ////switches.set(6, false); // clear that switch again

  //// send:
  //byte[] switchBytes = switches.toByteArray(); //convert bits to a single byte representation

  //println(switchBytes.length); // see how many bytes - should be just 1! (8 bits)

  //// send via serial switchBytes[0] ... 1 byte
  //serial.write(switchBytes[0]);
}


/**
 * Start the serial port reading based on the GUI
 */
//void setupSerial(int deviceIndex, int baudRate ) {
//  String serialDevices[] = null;

//  if (baudRate < 1)
//  {
//    // choose highest rate if none was selected
//    baudRate = int(serialRateStrings[serialRateStrings.length-1]);
//  }

//  // get serial devices attached ot this computer
//  serialDevices = Serial.list();

//  int index = 0;

//  for (String device : serialDevices) {
//    println(index + ": " + device); // print device to console
//    index++;
//  }

//  println("opening " + serialDevices[deviceIndex]);
//  serial = new Serial(this, serialDevices[deviceIndex], baud);
//}

void serialEvent(Serial serial)
{
}

void draw() {
  fill(0);
  textSize(14);
  text("The ABOVE grid is an interactive grid to help you keep track of your weaving pattern.", 10,120);
 text("Press each square to get your desire look.", 10,140);
text("Press the keys 1-8 on the keyboard or press the red squares to move the correlating thread position and 'o' to clear selection", 10,430);
text("E.G. press 1,3,5,7 +'o' slide the thread through the gap then 2,4,6,8 + 'o' and keep alternating", 10,450);
text("Every so often pat down with  the comb", 10,470);

drawIntGrid();
  switches.clear(); // set all to 0
  switches.set(0, true); // set rightmost switch to on
  switches.set(1, true); // just for fun, 3rd switch from left
  switches.set(2, true); // just for fun, 2nd switch from left
  switches.set(3, true); // just for fun, 3rd switch from left
  switches.set(4, true); // just for fun, 2nd switch from left
  switches.set(5, true); // just for fun, 2nd switch from left
  switches.set(6, true); // just for fun, 2nd switch from left
  switches.set(7, true); // just for fun, 2nd switch from left
  switches.set(8, true); // just for fun, 2nd switch from left

//white box
fill(255);
rect(50,137+50,700,150);

//switches 
  //switch 0
  if (switch0==true) {
    fill(0);
    switches.set(0, true); // set rightmost switch to on

    println("switch0 on");
  } else {
    fill(255);
    switches.set(0, false); // set rightmost switch to on
    println("switch0 off");
  }
  // translate(280,100);
  rect(90+25, 180+50, 70, 70);



  //switch1
  if (switch1==true) {
    fill(0);
    switches.set(1, true); // set rightmost switch to on

    println("switch1 on");
  } else {
    fill(255);
    switches.set(1, false); // set rightmost switch to on
    println("switch1 off");
  }
  // translate(280,100);
  //ellipse(130, 70, 20, 20);
 rect(162+25, 180+50, 70, 70);

  //switch2
  if (switch2==true) {
    fill(0);
    switches.set(2, true); // set rightmost switch to on

    println("switch2 on");
  } else {
    fill( 255);
    switches.set(2, false); // set rightmost switch to on
    println("switch2 off");
  }
  // translate(280,100);
  //ellipse(200, 70, 20, 20);
 rect(234+25, 180+50, 70, 70);


  //switch3
  if (switch3==true) {
    fill(0);
    switches.set(3, true); // set rightmost switch to on

    println("switch3 on");
  } else {
    fill(255);
    switches.set(3, false); // set rightmost switch to on
    println("switch3 off");
  }
  // translate(280,100);
   rect(306+25, 180+50, 70, 70);


  //switch4
  if (switch4==true) {
    fill(0);
    switches.set(4, true); // set rightmost switch to on

    println("switch4 on");
  } else {
    fill( 255);
    switches.set(4, false); // set rightmost switch to on
    println("switch4 off");
  }
  // translate(280,100);
 rect(378+25, 180+50, 70, 70);

  //switch5
  if (switch5==true) {
    fill(0);
    switches.set(5, true); // set rightmost switch to on

    println("switch5 on");
  } else {
    fill(255);
    switches.set(5, false); // set rightmost switch to on
    println("switch5 off");
  }
  // translate(280,100);
rect(450+25, 180+50, 70, 70);


  //switch7
  if (switch6==true) {
    fill(0);
    switches.set(6, true); // set rightmost switch to on

    println("switch6 on");
  } else {
    fill( 255);
    switches.set(6, false); // set rightmost switch to on
    println("switch6 off");
  }
  // translate(280,100);
  rect(522+25, 180+50, 70, 70);
  

  //switch7
  if (switch7==true) {
    fill(0);
    switches.set(7, true); // set rightmost switch to on

    println("switch7 on");
  } else {
    fill( 255);
    switches.set(7, false); // set rightmost switch to on
    println("switch7 off");
  }
  // translate(280,100);
  rect(594+25, 180+50, 70, 70);


  // popMatrix();


  //switches.set(6, false); // clear that switch again

  // send:
  byte[] switchBytes = switches.toByteArray(); //convert bits to a single byte representation

  println(switchBytes.length); // see how many bytes - should be just 1! (8 bits)

  // send via serial switchBytes[0] ... 1 byte
  serial.write(switchBytes[0]);

  //  




  // read input until we hit stop character (newline) and remove all leading and trailing special characters
  // unfortunately, due to threading issues, this crashes the serial port when called
  // too quickly!
  //String input = trim( serial.readStringUntil(stopChar) );

  while (serial.available() > 0) {
    int serialIn = serial.read(); // read byte as an int because of Java strangeness

    print("received byte: ");
    println(toBinary(serialIn)); // should print out 00100001
  }
}

/**
 * Recursive function to turn an integer into string based on its bits (only works for unsigned, positive ints)
 * Arguments: num (int to turn to String) and bits are the number of bits (8 for ints 0-255, 16 for 0-65536)
 */

String toBinary(int num) {
  int bits = 8;
  if (num < pow(2, 8)) {
    bits = 8;
  } else if (num < pow(2, 16)) {
    bits = 16;
  } else if (num < pow(2, 32)) {
    bits = 32;
  }
  return _toBinary(num, bits);
}


String _toBinary(int num, int bits) {
  if (--bits > 0)
    // shift to the right, return current right-most bit as string
    return _toBinary(num >> 1, bits) + ((num & 0x1)== 0 ? "0" : "1");
  else 
  return (num & 0x1) == 0?"0":"1"; // check last bit only
}

void keyPressed()
{

  if (key=='1') //press 1
  {
    switch0=true;
  }



  if (key=='2') //press 1
  {
    switch1=true;
  }


  if (key=='3') //press 1
  {
    switch2=true;
  }



  if (key=='4') //press 1
  {
    switch3=true;
  }


  if (key=='5') //press 1
  {
    switch4=true;
  }
  
  
    if (key=='6') //press 1
  {
    switch5=true;
  }
  
    if (key=='7') //press 1
  {
    switch6=true;
  }
  
  
     if (key=='8') //press 1
  {
    switch7=true;
  }

  if (key=='o') //off
  {
    switch0=false;
    switch1=false;
    switch2=false;
    switch3=false;
    switch4=false;
    switch5=false;
    switch6=false;
    switch7=false;
  }
}

void drawIntGrid()
{
  
  //row1
  
  //q11  1,1 
fill (col11);  
rect(0,0, lato,lato);
 
 //q21 
fill (col21);  
rect(50,0, lato,lato);

 //q31 
fill (col31);  
rect(100,0, lato,lato); 

 //q41 
fill (col41);  
rect(150,0, lato,lato);

 //q51 
fill (col51);  
rect(200,0, lato,lato);

 //q61 
fill (col61);  
rect(250,0, lato,lato);

 //q71 
fill (col71);  
rect(300,0, lato,lato);

 //q81 
fill (col81);  
rect(350,0, lato,lato);

//row2
  
  //q12   2,1
fill (col12);  
rect(0,50, lato,lato);
 
 //q22 
fill (col22);  
rect(50,50, lato,lato);

 //q32
fill (col32);  
rect(100,50, lato,lato); 

 //q42 
fill (col42);  
rect(150,50, lato,lato);

 //q52 
fill (col52);  
rect(200,50, lato,lato);

 //q62 
fill (col62);  
rect(250,50, lato,lato);

 //q72 
fill (col72);  
rect(300,50, lato,lato);

 //q82 
fill (col82);  
rect(350,50, lato,lato);


}

void mousePressed() {
  
  //q11
   if ((mouseX >0) && (mouseX<50) && (mouseY>0) && (mouseY<50)) {
        if (col11==255) {
            col11=0; 
          } else if (col11==0) {
            col11=255;
           }   
     } 
     //21
     if ((mouseX >50) && (mouseX<100) && (mouseY>0) && (mouseY<50)) {
        if (col21==255) {
            col21=0; 
          } else if (col21==0) {
            col21=255;
           }   
      } 
      
      //31
     if ((mouseX >100) && (mouseX<150) && (mouseY>0) && (mouseY<50)) {
        if (col31==255) {
            col31=0; 
          } else if (col31==0) {
            col31=255;
           }   
      } 
   
    //41
     if ((mouseX >150) && (mouseX<200) && (mouseY>0) && (mouseY<50)) {
        if (col41==255) {
            col41=0; 
          } else if (col41==0) {
            col41=255;
           }   
      } 
      
      //51
     if ((mouseX >200) && (mouseX<250) && (mouseY>0) && (mouseY<50)) {
        if (col51==255) {
            col51=0; 
          } else if (col51==0) {
            col51=255;
           }   
      } 
      
       //61
     if ((mouseX >250) && (mouseX<300) && (mouseY>0) && (mouseY<50)) {
        if (col61==255) {
            col61=0; 
          } else if (col61==0) {
            col61=255;
           }   
      } 
      
      //71
     if ((mouseX >300) && (mouseX<350) && (mouseY>0) && (mouseY<50)) {
        if (col71==255) {
            col71=0; 
          } else if (col71==0) {
            col71=255;
           }   
      } 
      
      //81
     if ((mouseX >350) && (mouseX<400) && (mouseY>0) && (mouseY<50)) {
        if (col81==255) {
            col81=0; 
          } else if (col81==0) {
            col81=255;
           }   
      } 
      
      //row 2
      
    //q12
   if ((mouseX >0) && (mouseX<50) && (mouseY>50) && (mouseY<100)) {
        if (col12==255) {
            col12=0; 
          } else if (col12==0) {
            col12=255;
           }   
     } 
     //22
     if ((mouseX >50) && (mouseX<100) && (mouseY>50) && (mouseY<100)) {
        if (col22==255) {
            col22=0; 
          } else if (col22==0) {
            col22=255;
           }   
      } 
      
      //32
     if ((mouseX >100) && (mouseX<150) && (mouseY>50) && (mouseY<100)) {
        if (col32==255) {
            col32=0; 
          } else if (col32==0) {
            col32=255;
           }   
      } 
   
    //42
     if ((mouseX >150) && (mouseX<200) && (mouseY>50) && (mouseY<100)) {
        if (col42==255) {
            col42=0; 
          } else if (col42==0) {
            col42=255;
           }   
      } 
      
      //52
     if ((mouseX >200) && (mouseX<250) && (mouseY>50) && (mouseY<100)) {
        if (col52==255) {
            col52=0; 
          } else if (col52==0) {
            col52=255;
           }   
      } 
      
       //62
     if ((mouseX >250) && (mouseX<300) && (mouseY>50) && (mouseY<100)) {
        if (col62==255) {
            col62=0; 
          } else if (col62==0) {
            col62=255;
           }   
      } 
      
      //72
     if ((mouseX >300) && (mouseX<350) && (mouseY>50) && (mouseY<100)) {
        if (col72==255) {
            col72=0; 
          } else if (col72==0) {
            col72=255;
           }   
      } 
      
      //82
     if ((mouseX >350) && (mouseX<400) && (mouseY>50) && (mouseY<100)) {
        if (col82==255) {
            col82=0; 
          } else if (col82==0) {
            col82=255;
           }   
      }      
}
