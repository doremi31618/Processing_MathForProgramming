public class CartesianCoordinateSystem3D extends GameObject
{
  public color red_color = color(255,0,0);
  public color green_color = color(0,255,0);
  public color blue_color = color(0,0,255);
  
  public CartesianCoordinateSystem3D()
  {
    super(new Vector3[3],new Vector3[0]);
    
  }
  public void display(){
    draw_3d_space();
  }
  public void draw_3d_space()
  {
    
    //reset the coordinate system by translate and rotate
    pushMatrix();
    drawFloor();
    drawAxis();
    popMatrix();
   
  }
  public void drawAxis(){
    //draw positive axis
    drawLine(new Vector3(0,0,0),new Vector3(600,0,0),red_color,1);
    drawLine(new Vector3(0,0,0),new Vector3(0.1,600,-0.1),green_color,1);
    drawLine(new Vector3(0,0,0),new Vector3(0,0,-600),blue_color,1);
    
    //draw negative axis
    drawDashLine(new Vector3(0,0,0),new Vector3(0,0,-500),color(50),1);
    //drawDashArrow(new PVector(0,0,0),new PVector(0,-500,0),color(150,150,0));
    //drawDashArrow(new PVector(0,0,0),new PVector(-500,0,0),color(0,150,150));
    
    
  }
  public void drawFloor()
  {
    pushMatrix();
    beginShape();
    noFill();
    vertex(500,0,0);
    vertex(500,0,-500);
    vertex(0,0,-500);
    vertex(0,0,0);
    endShape();
    
    beginShape();
    noFill();
    vertex(0,500,0);
    vertex(0,500,-500);
    vertex(0,0,-500);
    vertex(0,0,0);
    endShape();
    
    beginShape();
    noFill();
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
  public void drawLine(Vector3 v1, Vector3 v2,color line_color,float lineWeight)
  {
    //appearence
    stroke(line_color);
    strokeWeight(lineWeight);
    line(v1.x,v1.y,v1.z,v2.x,v2.y,v2.z);
  }
  public void drawDashLine(Vector3 v1, Vector3 v2,color line_color,float lineWeight)
  {
    //appearence
    stroke(line_color);
    strokeWeight(lineWeight);
    
    float line_length=20;
    Vector3 normal_vector = Vector3.substract(v2,v1).normalize();
    
    for(int i=0; i*line_length<Vector3.substract(v2,v1).length(); i+= 1)
    {
      if(i%2==0){
       Vector3 _v1 = Vector3.add(v1,normal_vector.scale(i*line_length));
       Vector3 _v2 = Vector3.add(v1,normal_vector.scale((i+1)*line_length));;
      
       line( _v1.x,_v1.y,_v1.z,_v2.x,_v2.y,_v2.z);
      }
    }
  }
}