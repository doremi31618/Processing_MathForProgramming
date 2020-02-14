public class DrawGraphic
{
  //need to be counter clock wise
  public void draw3DShape(Vector3[] vertices){
    for(int i=0; i<vertices.length;i+=3){
      Vector3[] trangle = {vertices[i],vertices[i+1],vertices[i+2]};
      drawTriangle(trangle);
    }
  }
  public void drawTriangle(Vector3[] vertices){
    if(vertices ==null)return;
    
    beginShape();
    vertex(vertices[0].x,vertices[0].y,vertices[0].z);
    vertex(vertices[1].x,vertices[1].y,vertices[1].z);
    vertex(vertices[2].x,vertices[2].y,vertices[2].z);
    endShape(CLOSE);
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
  public void drawPointLocater(Vector3 point,color _origin_to_point_color)
  {
   pushMatrix();
   stroke(255);
   strokeWeight(5);
   
   //draw axis
   drawDashLine(new Vector3(point.x,point.y,0),point,color(0,0,255),1);
   drawDashLine(new Vector3(0,point.y,point.z),point,color(255,0,0),1);
   drawDashLine(new Vector3(point.x,0,point.z),point,color(0,255,0),1);
   
   
   //draw component of vector 
   drawLine(new Vector3(0,0.1,-0.5),new Vector3(point.x,0.1,-0.5),color(0),3);
   drawLine(new Vector3(point.x,0,0),new Vector3(point.x,0,point.z),color(0),3);
   drawLine(new Vector3(point.x,0,point.z),point,color(0),2);
   
   //draw edge of vector
   drawLine(new Vector3(point.x,0,point.z),point,color(50),2);
   drawDashLine(new Vector3(0,point.y,0),new Vector3(point.x,point.y,0),color(0),3);
   drawDashLine(new Vector3(point.x,point.y,0),new Vector3(point.x,0,0),color(0),3);
   drawDashLine(new Vector3(0,point.y,0),new Vector3(0,point.y,point.z),color(0),3);
   drawDashLine(new Vector3(0.5,0,-0.5),new Vector3(0.5,point.y,-0.5),color(0),3);
   drawDashLine(new Vector3(0.5,0,-0.5),new Vector3(0.5,0,point.z),color(0),3);
   drawDashLine(new Vector3(0,0,point.z),new Vector3(0,point.y,point.z),color(0),3);
   drawDashLine(new Vector3(0,0,point.z),new Vector3(point.x,0,point.z),color(0),3);
   
   drawLine(new Vector3(0,0,0),point,color(_origin_to_point_color),3);
   stroke(255);
   point(point.x,point.y,point.z);
   popMatrix();
   
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
}
public class Face{
  public Vector3 normal;
  public Vector3[] vertices;
  public Face(Vector3[] _vertices){
    normal = new Vector3(0,0,0);
    _normal();//calculate normal
    vertices = _vertices;
  }
  //##v1
  //v2--v0
  public void _normal(){
    normal = Vector3.cross(
      Vector3.substract(vertices[2],vertices[1]),
      Vector3.substract(vertices[0],vertices[1])).normalize();
  }
}
//wright down to here 
public class model{
 public Face[] Faces;
 public Vector3[] vertices;
 
 public model(Vector3[] _vertices)
 {
   vertices=_vertices;
 }
 
 public void scale(float _scale){
   for(Vector3 v : vertices){
     v.scale(_scale);
   }
 }
}
public class GameObject
{
  //transform
  public Vector3 position = new Vector3(0,0,0);
  public Vector3 rotation = new Vector3(0,0,0);
  public Vector3 scale = new Vector3(1,1,1);
  Vector3 _scale = new Vector3(0,0,0);
  //model
  public model mesh;
  Vector3[] _vertices;
  public GameObject(Vector3[] transform, Vector3[] vertices)
  {
    _vertices = vertices;
    
    position = transform[0];
    rotation = transform[1];
    scale = transform[2];
    
    mesh = new model(Arrays.copyOf(vertices, vertices.length));
  }
  
  public void scale(Vector3 _scale){
    scale.add(_scale);
    println(scale.x,scale.y,scale.z);
    for(int i=0; i< mesh.vertices.length; i++){
      mesh.vertices[i] = Vector3.multiply(_vertices[i],scale);
    }
  }
}