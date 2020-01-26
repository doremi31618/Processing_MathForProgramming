public class dinosour{
  public PShape _dinosour;
  public PVector[] dinosour_vec = {
    new PVector(6,4), new PVector(3,1), new PVector(1,2),
    new PVector(-1,5),new PVector(-2,5),new PVector(-3,4),
    new PVector(-4,4),new PVector(-5,3),new PVector(-5,2),
    new PVector(-2,2),new PVector(-5,1),new PVector(-4,0),
    new PVector(-2,1),new PVector(-1,0),new PVector(0,-3),
    new PVector(-1,-4),new PVector(1,-4),new PVector(2,-3),
    new PVector (1,-2),new PVector(3,-1),new PVector(5,1)
  };
  
  public float angle;
  public float scale = 15;
  
  public PVector displacement = new PVector(0,0);
  public color shapeColor;
  
  public float dinosour_width = 11;
  public float dinosour_height = 9;
  dinosour()
  {
    CreateDinosourShape(dinosour_vec,shapeColor);
  }
  public void display(PVector position,float _angle,float _scale,color _shapeColor)
  {
    pushMatrix();
    
    
    PVector[] _dinosour_vec = dinosour_vec.clone();
    scale = _scale;
    angle = _angle;
    displacement = position;
    shapeColor = _shapeColor;
    
    _dinosour_vec = translate_shape(_dinosour_vec,displacement);
    CreateDinosourShape(_dinosour_vec,shapeColor);
    
    _dinosour.scale(scale);
    _dinosour.rotate(angle);
    shape(_dinosour);
    
    popMatrix();
  }
  void CreateDinosourShape(PVector[] _dinosour_vec, color _color)
  {
    _dinosour = createShape();
    _dinosour.beginShape();
    _dinosour.noFill();
    _dinosour.stroke(_color);
    _dinosour.strokeWeight(0.1);
    _dinosour.rotate(0);
    
    for(int i=0; i<_dinosour_vec.length; i++)
    {
      _dinosour.vertex(_dinosour_vec[i].x,_dinosour_vec[i].y);
      //strokeWeight(2);
      //ellipse(dinosour_vec[i].x,dinosour_vec[i].y,50,50);
    }
    _dinosour.endShape(CLOSE);
  }
  public void moveShape(PVector _displacement)
  {
    displacement = add(displacement, _displacement);
  }
  
  PVector[] translate_shape(PVector[] vec, PVector moveVector)
  {
    for(int i = 0;i<vec.length;i++)
    {
      vec[i] = add(vec[i],moveVector);
    }
    return vec;
  }
  
  PVector add(PVector v1,PVector v2){
   return new PVector(v1.x+v2.x, v1.y+v2.y); 
  }
}