import java.awt.*;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import ddf.minim.*;

Minim minim = new Minim(this);
static AudioPlayer player;
static AudioPlayer player2;
boolean pain;
int surfacePosX = 1250;
int surfacePosY = 500;
Point mouse = new Point(0, 0);
Point pmouse = new Point(0, 0);
static boolean f; 
PImage frame1;   
PImage frame2;
PImage musicOn;   
PImage musicOff;
PImage fxOn;   
PImage fxOff;
boolean musicb = true;
static boolean fxb = true;
boolean r = true;


public void settings() {
  fullScreen(P3D);
}

public void setup() {
  frameRate(60);
  surface.setSize(521, 250);
  surface.setResizable(true);
  surface.setLocation(surfacePosX, surfacePosY);  
  surface.setAlwaysOnTop(true);
 
  MyListener a = new MyListener();
  
  try {
 
    GlobalScreen.registerNativeHook();
 
  }
  
  catch(Exception e) {
 
    System.out.println(e);
    
 }
 
  GlobalScreen.addNativeKeyListener(a);

  player = minim.loadFile("click.mp3");
  player2 = minim.loadFile("song.mp3");

  frame1 = loadImage("frame1.png");
  frame2 = loadImage("frame2.png");

  musicOn = loadImage("soundOn.jpg");
  musicOff = loadImage("soundoff.jpg");
  fxOn = loadImage("fxon.jpg");
  fxOff = loadImage("fxoff.jpg");
  
  fxOff.resize(40,40);
  fxOn.resize(40,40);
  musicOff.resize(40,40);
  musicOn.resize(40,40);

  player.setGain(-25);
  player2.setGain(-20);
  player2.loop();
  

 
}

public void draw() { 
  if(musicb) {
    player2.unmute();
  }
  else {
    player2.mute();
  }
  

  frame.toFront();
  updateSurface();
  background(0);
  translate(width/2, height/2);
  
  if(f) image(frame1,-260,-125);
  else image(frame2,-260,-125);
  
  if(focused) {
    if(musicb) {
      image(musicOn,210,-115);
    }
    else {
      image(musicOff,210,-115);
    }
    if(fxb) {
      image(fxOn,210,-70);
    }
    else {
      image(fxOff,210,-70);
    }
    
    if(r && mousePressed && mouseX >= 472 && mouseX <= 509 && mouseY >=15 && mouseY <= 45){
      musicb = !musicb;
      r = false;
    }
    
    if(r && mousePressed && mouseX >= 472 && mouseX <= 509 && mouseY >=66 && mouseY <= 88){
      fxb = !fxb;
      r = false;
    }
    
    
    
    
    
    println(mouseX, mouseY); // 472 15, 509 45
// 472 88, 507 66  
  }
}

private void updateSurface() {
  pmouse = mouse; 
  mouse = MouseInfo.getPointerInfo().getLocation();
  if (mousePressed) {
    surfacePosX -= (pmouse.x - mouse.x);
    surfacePosY -= (pmouse.y - mouse.y);
    surface.setLocation(surfacePosX, surfacePosY);
  }
   
}

void mouseReleased(){
  r = true;
  
}
//     image(fxOn,210,-70);
