public static class Vector{
  
  public static PVector substract(PVector v1,PVector v2)
  {
    return new PVector(v1.x-v2.x, v1.y-v2.y,v1.z-v2.z);
  }
  
  public static PVector add(PVector v1,PVector v2){
    return new PVector(v1.x+v2.x, v1.y+v2.y, v1.z+v2.z); 
  }
  public static PVector normalize(PVector v1){
    float _length = length(v1);
    return new PVector(v1.x/_length,v1.y/_length,v1.y/_length);
  }
  
  public static PVector add_all_vector(PVector[] vector_collection)
  {
    PVector result = new PVector(0,0,0);
    for (int i=0; i<vector_collection.length;i++)
    {
      result.x += vector_collection[i].x;
      result.y += vector_collection[i].y;
      result.z += vector_collection[i].z;
    }
    return result;
  }
  public static PVector scale_vector(float scale, PVector vector)
  {
   return new PVector(vector.x*scale, vector.y*scale, vector.z*scale); 
  }
  public static float perimeter(PVector[] vectors)
  {
    float _length=0;
    for(int i=0; i<vectors.length-1; i++){
      _length += distance(vectors[i],vectors[i+1]);
    }
    return _length;
  }
  public static float distance(PVector v1, PVector v2 )
  {
   return  length(substract(v1,v2));
  }
  
  public static float length(PVector v1){
    return sqrt(pow(v1.x,2) + pow(v1.y,2) + pow(v1.z,2));
  }
  public static float angleToRadian(float angle)
  {
   return angle * (PI/180); 
  }
  //use PI ratian
  public static PVector rotate_vector(float angle,PVector v1)
  {
    //print(" original : " + v1);
    v1 = cartesian_to_polar_coordinate(v1);
    v1.y += angle;
    //print(" ; polar : " + v1 + " ; cartesian : ");
    v1 = polar_to_cartesian_coordinate(v1);
    //println(v1);
    return v1;
  }
  public static PVector[] rotate_vectors(float angle,PVector[] input)
  {
    for(int i=0; i<input.length;i++)
    {
       input[i] = rotate_vector(angle,input[i]); 
    }
    return input;
  }
  public static float calculate_angle_between_two_vectors(PVector v1, PVector v2)
  {
    v1 = cartesian_to_polar_coordinate(v1);
    v2 = cartesian_to_polar_coordinate(v2);
    return abs(v1.y-v2.y);
  }
  public static PVector cartesian_to_polar_coordinate(PVector v1)
  {
    float length_of_vecotr = length(v1);
    float angle_of_vector = atan2(v1.y,v1.x);//pi radians
    
    
    //println("angle : " +"_atan_"+angle_of_vector+"_asin_"+asin(v1.y/length_of_vecotr)+"_acos_"+acos(v1.x/length_of_vecotr));
    return new PVector(length_of_vecotr,angle_of_vector);
  }
  public static PVector polar_to_cartesian_coordinate(PVector v1)
  {
    float x=v1.x*cos(v1.y);
    float y=v1.x*sin(v1.y);
    
    return new PVector(x,y); 
  }
  public static PVector[] scale_vectors(float scale, PVector[] input)
  {
   for(PVector v : input)
   {
     v.x *= scale;
     v.y *= scale;
   }
   return input;
  }
  public static PVector[] translate_vectors(PVector translation, PVector[] input)
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