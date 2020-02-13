public class Practice{
  color red_color = color(255,0,0);
  color green_color = color(0,255,0);
  color blue_color = color(0,0,255);
  PVector translate_vector ;
  public void draw_octahedron(){
   pushMatrix();
   fill(255);
   beginShape(TRIANGLE);
   vertex(0,0,100);vertex(0,-100,0);vertex(100,0,0);
   vertex(0,0,100);vertex(100,0,0);vertex(0,100,0);
   vertex(0,0,100);vertex(0,100,0);vertex(-100,0,0);
   vertex(0,0,100);vertex(-100,0,0);vertex(0,-100,0);
   
   vertex(0,0,-100);vertex(0,100,0);vertex(100,0,0);
   vertex(0,0,-100);vertex(-100,0,0);vertex(0,100,0);
   vertex(0,0,-100);vertex(0,-100,0);vertex(-100,0,0);
   vertex(0,0,-100);vertex(0,-100,0);vertex(100,0,0);
   endShape(CLOSE);
   popMatrix();
   
  }
  public void calculateAngleBetweenTwoVector(){
    PVector v1 = new PVector(3,4,0);
    PVector v2 = new PVector(4,3,0);
    
    float angle = Vector.angle_between_two_vectors(v1,v2);
    println("[Practice]AngleBetweenTwoVector : " + angle);
  }
  public void test_cross_product(){
    PVector v1 = new PVector(0,0,3);
    PVector v2 = new PVector(1,2,0);
    PVector cross_product = Vector.cross_product(v1,v2);
    
    println("[Practice]cross product : "+cross_product);
    
  }
  
  public void drawSpirial(){
    PVector sum_vector = new PVector(0,0,0);
    for(int i=0; i<24 ;i++){
     
     PVector draw_Vector = 
       new PVector(
         sin(PI*i/6) *100,
         cos(PI*i/6) *100,
         100.0/3);
     PVector draw_Next_Vector = 
       new PVector(
         sin(PI*i+1/6) *100,
         cos(PI*i+1/6) *100,
         1/3);
     sum_vector = Vector.add(sum_vector,draw_Vector);
     
     drawArrow(
       sum_vector,
       Vector.add(sum_vector,draw_Next_Vector),
       #036BFA,
       0.5);
    }
  }
  /*
  Find a vector in the same direction as (-1,-1,2)
  but which has length 1.  
  
  Hint: find the appropriate scalar to multiply the
  original vector to change its length appropriately.
  */
  public void Find_Direction(){
    PVector normalize_vector = Vector.scale_vector(100,Vector.normalize(new PVector(-1,-1,2)));
    drawPointLocater(normalize_vector,color(#8C4BF7));
  }
  
  /*
  (1,2,-1) ∙ (3, 0, 3) 
  the product of x coordinates is 3, 
  the product of y coordinates is 0,  
  the product of z coordinates is -3.  
  The sum is 3 + 0 + (-3) = 0
  
  these two vectors should be perpendicular.  
  Drawing them proves this,
  */
  public void dot_product_practice(){
    //drawPointLocater();
    PVector v1 = new PVector(100,200,-100);
    PVector v2 = new PVector(300,0,300);
    println("[practice]dot_product : " + Vector.dot_product(v1,v2));
    drawPointLocater(v1,#42E2F2);
    drawPointLocater(v2,#F28942);
  }
  
}