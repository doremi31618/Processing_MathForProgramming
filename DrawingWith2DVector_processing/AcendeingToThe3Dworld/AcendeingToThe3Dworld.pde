color red_color = color(255,0,0);
color green_color = color(0,255,0);
color blue_color = color(0,0,255);

void setup(){
  size(640,480,P3D);
}
void draw(){
  background(0);
  OnGUI();
  draw_3d_space();
}

void OnGUI()
{
 String camera_position_text = "Frame Rate" + frameRate;
 text(camera_position_text,10,30); 
 
}


void setting_3d_environment()
{
  
  noFill();
  stroke(255);
  rotateX(5*PI/6);
  rotateY(PI/4);
  //rotateZ(PI/6);
  translate(width/5, -width/1.5, width/2);
 
}
void draw_3d_space()
{
  
  //reset the coordinate system by translate and rotate
  pushMatrix();
  setting_3d_environment();
 
  //draw positive axis
  drawArrow(new PVector(0,0,0),new PVector(500,0,0),color(255,0,0));
  drawArrow(new PVector(0,0,0),new PVector(0,500,0),color(0,255,0));
  drawArrow(new PVector(0,0,0),new PVector(0,0,500),color(0,0,255));
  
  //draw negative axis
  drawArrow(new PVector(0,0,0),new PVector(0,0,-500),color(150,0,150));
  drawArrow(new PVector(0,0,0),new PVector(0,-500,0),color(150,150,0));
  drawArrow(new PVector(0,0,0),new PVector(-500,0,0),color(0,150,150));

  //other things
  drawFloor();
  pushMatrix();
  sphere(50);
  drawPointLocater(new PVector(250,100,-250));
  popMatrix();
  
  popMatrix();
 
}
void drawFloor()
{
  pushMatrix();
  beginShape();
  fill(225);
  vertex(500,0,500);
  vertex(500,0,-500);
  vertex(-500,0,-500);
  vertex(-500,0,500);
  endShape();
  
  noFill();
  stroke(150);
  translate(0,-99,0);
  box(200);
  translate(0,-99,0);
  box(400);
  translate(0,-99,0);
  box(600);
  translate(0,-99,0);
  box(800);
  translate(0,-99,0);
  box(1000);
  popMatrix();
}

void drawPointLocater(PVector point)
{
 pushMatrix();
 stroke(255);
 strokeWeight(5);
 
 
 drawArrow(new PVector(point.x,point.y,0),point,color(255,255,0));
 drawArrow(new PVector(0,point.y,point.z),point,color(0,255,255));
 drawArrow(new PVector(point.x,0,point.z),point,color(255,0,255));
 
 stroke(255);
 point(point.x,point.y,point.z);
 popMatrix();
 
}

void drawArrow(PVector v1, PVector v2,color line_color)
{
  pushMatrix();
  //appearence
  stroke(line_color);
  strokeWeight(1);
  line(v1.x,v1.y,v1.z,v2.x,v2.y,v2.z);
  popMatrix();
  
}