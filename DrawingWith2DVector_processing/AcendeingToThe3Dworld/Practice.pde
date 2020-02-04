public class Practice{
  color red_color = color(255,0,0);
  color green_color = color(0,255,0);
  color blue_color = color(0,0,255);
  PVector translate_vector ;
  
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
    PVector normalize_vector = Vector.normalize(new PVector(-1,-1,2));
    drawVector(normalize_vector);
  }
  
}