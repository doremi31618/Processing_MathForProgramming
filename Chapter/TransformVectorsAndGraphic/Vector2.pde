public static class Vector2{
  public float x,y=0;
  public float[] position=new float[2];
  public Vector2(float _x, float _y)
 {
   position = new float[2];
   
   position[0] = x = _x;
   position[1] = y = _y;
 }
  public static Vector2 substract(Vector2 v1,Vector2 v2)
  {
    return new Vector2(v1.x-v2.x, v1.y-v2.y);
  }
  
  public static Vector2 add(Vector2 v1,Vector2 v2){
    return new Vector2(v1.x+v2.x, v1.y+v2.y); 
  }
  
  public static Vector2 add_all_vector(Vector2[] vector_collection)
  {
    Vector2 result = new Vector2(0,0);
    for (int i=0; i<vector_collection.length;i++)
    {
      result.x += vector_collection[i].x;
      result.y += vector_collection[i].y;
    }
    return result;
  }
  public static Vector2 scale_vector(float scale, Vector2 vector)
  {
   return new Vector2(vector.x*scale, vector.y*scale); 
  }
  public static float perimeter(Vector2[] vectors)
  {
    float _length=0;
    for(int i=0; i<vectors.length-1; i++){
      _length += distance(vectors[i],vectors[i+1]);
    }
    return _length;
  }
  public static float distance(Vector2 v1, Vector2 v2 )
  {
   return  length(substract(v1,v2));
  }
  
  public static float length(Vector2 v1){
    return sqrt(pow(v1.x,2) + pow(v1.y,2));
  }
  public static float angleToRadian(float angle)
  {
   return angle * (PI/180); 
  }
  //use PI ratian
  public static Vector2 rotate2d(float angle,Vector2 v1)
  {
    //print(" original : " + v1);
    v1 = cartesian_to_polar_coordinate(v1);
    v1.y += angle;
    v1 = polar_to_cartesian_coordinate(v1);
    return v1;
  }
  public static Vector2[] rotate_vectors(float angle,Vector2[] input)
  {
    for(int i=0; i<input.length;i++)
    {
       input[i] = rotate2d(angle,input[i]); 
    }
    return input;
  }
  public static float calculate_angle_between_two_vectors(Vector2 v1, Vector2 v2)
  {
    v1 = cartesian_to_polar_coordinate(v1);
    v2 = cartesian_to_polar_coordinate(v2);
    return abs(v1.y-v2.y);
  }
  public static Vector2 cartesian_to_polar_coordinate(Vector2 v1)
  {
    float length_of_vecotr = length(v1);
    float angle_of_vector = atan2(v1.y,v1.x);//pi radians
    
    
    //println("angle : " +"_atan_"+angle_of_vector+"_asin_"+asin(v1.y/length_of_vecotr)+"_acos_"+acos(v1.x/length_of_vecotr));
    return new Vector2(length_of_vecotr,angle_of_vector);
  }
  public static Vector2 polar_to_cartesian_coordinate(Vector2 v1)
  {
    float x=v1.x*cos(v1.y);
    float y=v1.x*sin(v1.y);
    
    return new Vector2(x,y); 
  }
  public static Vector2[] scale_vectors(float scale, Vector2[] input)
  {
   for(Vector2 v : input)
   {
     v.x *= scale;
     v.y *= scale;
   }
   return input;
  }
  public static Vector2[] translate_vectors(Vector2 translation, Vector2[] input)
  {
    for(int i=0;i<input.length;i++)
    {
      input[i] = add(input[i], translation);
    }
    return input;
  }
  
  public static float square(float x)
  {
    float r;
    r = pow(x,2);
    return r;
  }
}