public static class Vector3{
 public float x,y,z=0;
 public float[] position=new float[3];
 
 public static Vector3 zero = new Vector3(0,0,0);
 public static Vector3 unit = new Vector3(1,1,1);
 
 public static Vector3 left = new Vector3(-1,0,0);
 public static Vector3 right = new Vector3(1,0,0);
 
 public static Vector3 up = new Vector3(0,1,0);
 public static Vector3 down = new Vector3(0,-1,0);
 
 public static Vector3 forward = new Vector3(0,0,1);
 public static Vector3 back = new Vector3(0,0,-1);
 
 public Vector3(float _x, float _y, float _z)
 {
   position = new float[3];
   
   position[0] = x = _x;
   position[1] = y = _y;
   position[2] = z = _z;
 }
 
 public void set(float _x, float _y, float _z){
   x = _x;
   y = _y;
   z = _z;
 }
 
 public static Vector3 add(Vector3 v1, Vector3 v2){
   return new Vector3(v1.x+v2.x, v1.y+v2.y, v1.z+v2.z);
 }
 public static Vector3 add(Vector3 v1, Vector3 v2, Vector3 v3){
   return new Vector3(v1.x+v2.x +v3.x, v1.y+v2.y+v3.y, v3.z + v1.z+v2.z);
 }
 public void add(Vector3 v1){
   x+=v1.x;
   y+=v1.y;
   z+=v1.z;
 }
 public void substract(Vector3 v1){
   x+=v1.x;
   y+=v1.y;
   z+=v1.z;
 }
 public static Vector3 substract(Vector3 v1, Vector3 v2){
   return new Vector3(v1.x-v2.x, v1.y-v2.y, v1.z-v2.z);
 }
 public Vector3 scale(float _scale){
   x*=_scale;
   y*=_scale;
   z*=_scale;
   return new Vector3(x,y,z);
 }
 public float length(){
   return sqrt(pow(x,2)+pow(y,2)+pow(z,2));
 }
 
 
 public Vector3 normalize(){
   float _length = length();
   return new Vector3(x/_length, y/_length, z/_length);
 }
 public static Vector3 multiply(Vector3 v1, Vector3 v2)
 {
   return new Vector3( v1.x*v2.x, v1.y*v2.y, v1.z*v2.z);
 }
 public Vector3 multiply(Vector3 v1)
 {
   return new Vector3(x*v1.x, y*v1.y,z*v1.z);
 }
 //its mean project v1 vector to v2 vector
 //ususally use x,y,z axis as v2 input 
 public static float dot(Vector3 v1, Vector3 v2){
   return v1.x*v2.x + v1.y+v2.y + v1.z*v2.z;
 }
 //v1 = index_finger
 //v2 = middle_finger
 public static Vector3 cross(Vector3 v1,Vector3 v2){
   return new Vector3(
     v1.y*v2.z - v1.z*v2.y,
     v1.z*v2.x - v1.x*v2.z,
     v1.x*v2.y - v1.y*v2.x);
 }
 //return radian of two vector
 public static float angle(Vector3 v1,Vector3 v2){
   return acos(Vector3.dot(v1,v2)/(v1.length() * v2.length()));
 }
 
 public static Vector3 rotate_z(float angle, Vector3 v1){
   Vector2 new_X_Y = Vector2.rotate2d(angle,new Vector2(v1.x,v1.y));
   v1.set(new_X_Y.x,new_X_Y.y,v1.z);
   return v1;
 }
 
 public static Vector3 rotate_x(float angle, Vector3 v1){
   Vector2 new_X_Y = Vector2.rotate2d(angle,new Vector2(v1.y,v1.z));
   v1.set(v1.x,new_X_Y.x,new_X_Y.y);
   return v1;
 }
 
 public static Vector3 rotate_y(float angle, Vector3 v1){
   Vector2 new_X_Y = Vector2.rotate2d(angle,new Vector2(v1.x,v1.z));
   v1.set(new_X_Y.x,v1.y,new_X_Y.y);
   return v1;
 }
 public static Vector3 lerp(Vector3 v1, Vector3 v2, float weight)
 {
   weight = constrain(0,1,weight);
   
   return Vector3.add(v1.scale(1-weight),v2.scale(weight));
 }
 public static Vector3 linear_combination(Vector3 scalers, Vector3 v1, Vector3 v2, Vector3 v3)
 {
   
   Vector3 result = Vector3.add(v1.scale(scalers.x),v2.scale(scalers.y),v3.scale(scalers.z)) ;
   return result;
 }
 public static Vector3 linear_combination(float[] scalers, Vector3[] vector_collection)
 {
   Vector3 result = new Vector3(0,0,0);
   if(scalers.length != vector_collection.length)return result;
   
   
   for(int i=0 ;i<scalers.length; i++){
     result.add(vector_collection[i].scale((scalers[i])));
   }
   print(result.x,result.y,result.z);
   return result;
 }
}