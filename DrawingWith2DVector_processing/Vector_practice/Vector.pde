public static class Vector{
  
  public static PVector substract(PVector v1,PVector v2)
  {
    return new PVector(v1.x-v2.x, v1.y-v2.y);
  }
  
  public static PVector add(PVector v1,PVector v2){
    return new PVector(v1.x+v2.x, v1.y+v2.y); 
  }
  
  public static PVector add_all_vector(PVector[] vector_collection)
  {
    PVector result = new PVector(0,0);
    for (int i=0; i<vector_collection.length;i++)
    {
      result.x += vector_collection[i].x;
      result.y += vector_collection[i].y;
    }
    return result;
  }
  public static PVector scale_vector(float scale, PVector vector)
  {
   return new PVector(vector.x*scale, vector.y*scale); 
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
    return sqrt(pow(v1.x,2) + pow(v1.y,2));
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