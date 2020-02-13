public static class Vector3{
 public float x=0;
 public float y=0;
 public float z=0;
 public Vector3(float _x, float _y, float _z){
   x=_x;
   y=_y;
   z=_z;
 }
 public static Vector3 add(Vector3 v1, Vector3 v2){
   return new Vector3(v1.x+v2.x, v1.y+v2.y, v1.z+v2.z);
 }
 public float length(){
   return sqrt(pow(x,2)+pow(y,2)+pow(z,2));
 }
 public Vector3 normalize(){
   float _length = length();
   return new Vector3(x/_length, y/_length, z/_length);
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
 
}