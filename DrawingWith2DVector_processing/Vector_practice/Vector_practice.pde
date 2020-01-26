
import controlP5.*;

ControlP5 cp5;

dinosour dino_1 ;
dinosour dino_2 ;
dinosour[] dinosours;

//float scale = 15;
void setup()
{
  size(640,640,P3D);
  adjust_coordinate_center_direction();
  dino_1 = new dinosour();
  dino_2 = new dinosour();
  dinosours = new dinosour[100];
  for(int i=0; i<dinosours.length;i++)
  {
   dinosours[i] = new dinosour(); 
  }
  count_peremeter();
  //cp5 = new ControlP5(this);
  //cp5.addLabel("Scale Rate : ")
  //    .setPosition(100,50)
  //    .setValue(scale);
  
}
float angle;
void draw()
{
  background(0);
  //ui layer
  draw_UI();
  
  //center now is (width/2 , height/2),
  //positive y direction is up
  //positive x direction is right
  adjust_coordinate_center_direction();
  draw_Axis_2D();
  
  //draw shape
  //draw_dinosour();
  //drawParabola();
  //draw_homework_vector_substraction();
  //draw_homework_2_2_4();
  //draw_100_dinosourd(scale);
  //draw_range_practice();
}
void keyPressed()
{
 if(keyCode == UP)
 {
   scale += 0.1;
 }
 else if(keyCode==DOWN)
 {
   scale -= 0.1;
 }
 
}

void count_peremeter()
{
  PVector[] dinosour_vec = {
    new PVector(6,4), new PVector(3,1), new PVector(1,2),
    new PVector(-1,5),new PVector(-2,5),new PVector(-3,4),
    new PVector(-4,4),new PVector(-5,3),new PVector(-5,2),
    new PVector(-2,2),new PVector(-5,1),new PVector(-4,0),
    new PVector(-2,1),new PVector(-1,0),new PVector(0,-3),
    new PVector(-1,-4),new PVector(1,-4),new PVector(2,-3),
    new PVector (1,-2),new PVector(3,-1),new PVector(5,1)
  };
  print(Vector.perimeter(dinosour_vec));
  
}

void draw_range_practice()
{
 PVector u = new PVector(-1,1);
 PVector v = new PVector(1,1);
 
 float width_number = 50;
 for(int i=0 ; i<width_number; i++)
 {
  float index_lerp_r = lerp(-10,10,i/width_number);
  PVector new_u = new PVector(index_lerp_r*u.x,index_lerp_r*u.y);
  
  for(int j = 0; j< width_number; j++)
  {
    float index_lerp_s = lerp(-30,30,j/width_number);
    PVector new_v = new PVector(index_lerp_s*v.x,index_lerp_s*v.y);
    PVector positive_point = Vector.add(new_v, new_u);
    point(positive_point.x,positive_point.y);
  }
  
  
 }
}
float scale = 2;
void draw_100_dinosourd(float _scale)
{
  if(dinosours == null )dinosours = new dinosour[100];
  for(int i=0;i<dinosours.length;i++)
  {
    if(dinosours[i]==null)
    {
      println("dinosours is null");
      return;
    }
    float scale =_scale;
    float rotation = 0;
    
    float positionX = (dinosours[i].dinosour_width) * scale * (i%10)-90;
    float positionY = (dinosours[i].dinosour_height) * scale * (i/10)-90;
    dinosours[i].display(new PVector(positionX,positionY),rotation,scale,#5EB0D8);
  }
}

void draw_dinosour()
{
  pushMatrix();
  fill(255,0,0);
  dino_1.display(new PVector(0,0),0,15,color(0,255,0));
  popMatrix();
}
void draw_homework_2_2_4()
{
  PVector u = new PVector(-200, 0);
  PVector v = new PVector(150,150);
  PVector w = new PVector(400, 100);
  
  pushMatrix();
  stroke(255);
  draw_vector(Vector.add( u,v));
  popMatrix();
  
  pushMatrix();
  stroke(255,0,0);
  draw_vector(Vector.add( v,w));
  popMatrix();
  
  pushMatrix();
  stroke(0,255,0);
  draw_vector(Vector.add( u,w));
  popMatrix();
  
  pushMatrix();
   stroke(0,0,255);
  draw_vector(Vector.add( u,Vector.add(v,w)));
  popMatrix();
  
  pushMatrix();
  PVector[] dinosour_vec = {
    new PVector(6,4), new PVector(3,1), new PVector(1,2),
    new PVector(-1,5),new PVector(-2,5),new PVector(-3,4),
    new PVector(-4,4),new PVector(-5,3),new PVector(-5,2),
    new PVector(-2,2),new PVector(-5,1),new PVector(-4,0),
    new PVector(-2,1),new PVector(-1,0),new PVector(0,-3),
    new PVector(-1,-4),new PVector(1,-4),new PVector(2,-3),
    new PVector (1,-2),new PVector(3,-1),new PVector(5,1)
  };
  
  draw_vector(Vector.add_all_vector(Vector.translate_vectors(new PVector(-50,-50),dinosour_vec)));
  popMatrix();
}

void draw_homework_vector_substraction(){
  pushMatrix();
  stroke(255,0,0);
  draw_segment(
    new PVector(200,200),
    new PVector(-100,300));
  popMatrix();
  
  pushMatrix();
  stroke(0,255,0);
  //translate(width/2,height/2);
  draw_vector(new PVector(200,200));
  popMatrix();
  
  pushMatrix();
  stroke(0,0,255);
  //translate(width/2,height/2);
  draw_vector(new PVector(-100,300));
  popMatrix();
}
void drawParabola(float scale)
{
  //draw parable
  pushMatrix();
  //translate(width/2,height);
  for(float i = -width/2;i<width/2;i+=0.1)
  {
    strokeWeight(2);
    stroke(255);
    point(scale*i,square(i));
  }
  popMatrix();
}
//tool function
////////////////////////////////////////////////////////////////////////
float square(float x)
{
  float r;
  r = pow(x,2);
  return r;
}

void adjust_coordinate_center_direction()
{
  translate(width/2,height/2);
  rotateX(180 * (PI/180));
}

void draw_UI()
{
  //text("Scale : " + scale,155,57);
  
  //original point
  pushMatrix();
  strokeWeight(5);
  point(0,0);
  textAlign(CENTER, CENTER);
  text("(0,0)",width/2-20,height/2+20);
  popMatrix();
  
  //mouse point
  pushMatrix();
  stroke(255);
  strokeWeight(1);
  point(0,0);
  textAlign(CENTER, CENTER);
  float mouseX_value = mouseX-width/2;
  float mouseY_value = height/2 - mouseY;
  String text = "( "+mouseX_value+", "+mouseY_value+" )";
  text(text,mouseX+50,mouseY+20);
  popMatrix();
}


void draw_Axis_2D()
{
  
  
  //y axis
  pushMatrix();
  stroke(0,255,0);
  line(0,0,0,height/2);
  line(0,0,0,-height/2);
  popMatrix();
  
  //x axis
  pushMatrix();
  stroke(255,0,0);
  line(0,0,width/2,0);
  line(0,0,-width/2,0);
  popMatrix();
  
  
}

//also use for vevtor substraction
public void draw_segment(PVector v1, PVector v2){
  line(v1.x,v1.y,v2.x,v2.y);
}



public void draw_vector(PVector v1)
{
  line(0,0,v1.x,v1.y);
}

PShape Display2D(PVector[] _vec)
{
  PShape new_shape = createShape();
  pushMatrix();
  new_shape.translate(width/2,height/2);
  new_shape.beginShape();
  new_shape.fill(0,0,0,0);
  new_shape.stroke(255);
  new_shape.strokeWeight(5);
  
  for(int i=0; i<_vec.length; i++)
  {
    new_shape.vertex(_vec[i].x,_vec[i].y);
    point(_vec[i].x,_vec[i].y);
  }
  
  new_shape.endShape();
  popMatrix();
  
  return new_shape;
}