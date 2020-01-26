class homework{
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
  void draw_100_dinosourd(float _scale,dinosour[] dinosours)
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
  
  void draw_dinosour(dinosour dino_1)
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
  
}