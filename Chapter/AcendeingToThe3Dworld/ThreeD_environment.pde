public class ThreeD_Environment{
  
  color red_color = color(255,0,0);
  color green_color = color(0,255,0);
  color blue_color = color(0,0,255);
  
  ArrayList<PShape> shape;
  PVector translate_vector;
  public ThreeD_Environment(){
    shape = new ArrayList<PShape>();
    translate_vector=new PVector(0,0,0);
  }
  public void display(PVector _translate_vector){
    translate_vector=_translate_vector;
    draw_3d_space();
  }
  public void addShape(PShape new_shape)
  {
    shape.add(new_shape);
  }
  
  public void draw_3d_space()
  {
    
    //reset the coordinate system by translate and rotate
    pushMatrix();
    setting_3d_environment();
    drawFloor();
    
    translate(translate_vector.x,
              translate_vector.y,
              translate_vector.z);
    
    _3D_Space_simulator();
    drawAxis();
    
    popMatrix();
   
  }
  public void _3D_Space_simulator(){
    strokeWeight(1);
    stroke(100);
    sphere(50);
    //m_practice.dot_product_practice();
    pointLight(51, 102, 126, 200, 200, -200);
    m_practice.draw_octahedron();
    
    if(shape.size()==0)return;
    for(int i=0;i<shape.size();i++){
      shape(shape.get(i));
    }
  }
  public void drawAxis(){
    //draw positive axis
    drawArrow(new PVector(0,0,0),new PVector(600,0,0),red_color,1);
    drawArrow(new PVector(0,0,0),new PVector(0.1,600,-0.1),green_color,1);
    drawArrow(new PVector(0,0,0),new PVector(0,0,-600),blue_color,1);
    
    //draw negative axis
    drawDashArrow(new PVector(0,0,0),new PVector(0,0,-500),color(50),1);
    //drawDashArrow(new PVector(0,0,0),new PVector(0,-500,0),color(150,150,0));
    //drawDashArrow(new PVector(0,0,0),new PVector(-500,0,0),color(0,150,150));
    
    
  }
  public void drawFloor()
  {
    pushMatrix();
    beginShape();
    fill(225);
    vertex(500,0,0);
    vertex(500,0,-500);
    vertex(0,0,-500);
    vertex(0,0,0);
    endShape();
    
    beginShape();
    fill(225);
    vertex(0,500,0);
    vertex(0,500,-500);
    vertex(0,0,-500);
    vertex(0,0,0);
    endShape();
    beginShape();
    fill(225);
    vertex(500,500,0);
    vertex(500,0,0);
    vertex(0,0,0);
    vertex(0,500,0);
    endShape();
    
    noFill();
    stroke(150);
    for(int x=0;x<500;x+=50){
      line(x,0,0,x,0,-500);
      line(500,0,-x,0,0,-x);
      
      line(0,x,0,0,x,-500);
      line(0,500,-x,0,0,-x);
      
      line(x,500,0,x,0,0);
      line(500,x,0,0,x,0);
    }
    
    popMatrix();
  }
  public void drawVector(PVector v)
  {
   drawArrow(new PVector(0,0,0), v,color(255),1);
  }
  
  public void drawPointLocater(PVector point,color _origin_to_point_color)
  {
   pushMatrix();
   stroke(255);
   strokeWeight(5);
   
   //draw axis
   drawDashArrow(new PVector(point.x,point.y,0),point,color(0,0,255),1);
   drawDashArrow(new PVector(0,point.y,point.z),point,color(255,0,0),1);
   drawDashArrow(new PVector(point.x,0,point.z),point,color(0,255,0),1);
   
   
   //draw component of vector 
   drawArrow(new PVector(0,0.1,-0.5),new PVector(point.x,0.1,-0.5),color(0),3);
   drawArrow(new PVector(point.x,0,0),new PVector(point.x,0,point.z),color(0),3);
   drawArrow(new PVector(point.x,0,point.z),point,color(0),2);
   
   //draw edge of vector
   drawArrow(new PVector(point.x,0,point.z),point,color(50),2);
   drawDashArrow(new PVector(0,point.y,0),new PVector(point.x,point.y,0),color(0),3);
   drawDashArrow(new PVector(point.x,point.y,0),new PVector(point.x,0,0),color(0),3);
   drawDashArrow(new PVector(0,point.y,0),new PVector(0,point.y,point.z),color(0),3);
   drawDashArrow(new PVector(0.5,0,-0.5),new PVector(0.5,point.y,-0.5),color(0),3);
   drawDashArrow(new PVector(0.5,0,-0.5),new PVector(0.5,0,point.z),color(0),3);
   drawDashArrow(new PVector(0,0,point.z),new PVector(0,point.y,point.z),color(0),3);
   drawDashArrow(new PVector(0,0,point.z),new PVector(point.x,0,point.z),color(0),3);
   
   drawArrow(new PVector(0,0,0),point,color(_origin_to_point_color),3);
   stroke(255);
   point(point.x,point.y,point.z);
   popMatrix();
   
  }
  
  public void drawArrow(PVector v1, PVector v2,color line_color,float lineWeight)
  {
    //appearence
    stroke(line_color);
    strokeWeight(lineWeight);
    line(v1.x,v1.y,v1.z,v2.x,v2.y,v2.z);
  }
  
  public void drawDashArrow(PVector v1, PVector v2,color line_color,float lineWeight)
  {
    //appearence
    stroke(line_color);
    strokeWeight(lineWeight);
    
    float line_length=20;
    PVector normal_vector = Vector.normalize(Vector.substract(v2,v1));
    
    for(int i=0; i*line_length<Vector.length(Vector.substract(v2,v1)); i+= 1)
    {
      if(i%2==0){
       PVector _v1 = Vector.add(v1,Vector.scale_vector(i*line_length,normal_vector));
       PVector _v2 = Vector.add(v1,Vector.scale_vector((i+1)*line_length,normal_vector));
       line( _v1.x,_v1.y,_v1.z,_v2.x,_v2.y,_v2.z);
      }
    }
  }
}