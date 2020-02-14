import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import java.util.Arrays;
PeasyCam cam;
CameraState state;
DrawGraphic graphic;


GameObject octahedron;
model octahedron_model;
Vector3[] transform;
Vector3[] octahedron_vertices = {
   new Vector3(0,0,100),new Vector3(0,-100,0),new Vector3(100,0,0),
   new Vector3(0,0,100),new Vector3(100,0,0),new Vector3(0,100,0),
   new Vector3(0,0,100),new Vector3(0,100,0),new Vector3(-100,0,0),
   new Vector3(0,0,100),new Vector3(-100,0,0),new Vector3(0,-100,0),
   
   new Vector3(0,0,-100),new Vector3(0,100,0),new Vector3(100,0,0),
   new Vector3(0,0,-100),new Vector3(-100,0,0),new Vector3(0,100,0),
   new Vector3(0,0,-100),new Vector3(0,-100,0),new Vector3(-100,0,0),
   new Vector3(0,0,-100),new Vector3(0,-100,0),new Vector3(100,0,0)
};

void setup(){
  cam = new PeasyCam(this, 400);
  state = cam.getState();
  graphic = new DrawGraphic();
  
  transform = new Vector3[3];
  transform[0] = Vector3.zero;
  transform[1] = Vector3.zero;
  transform[2] = Vector3.unit;
  
  octahedron = new GameObject(transform,octahedron_vertices);
}
void settings(){
  
  size(640,480,P3D);
}
void draw(){
  background(0);
  graphic.draw3DShape(octahedron.mesh.vertices);
}

public void keyPressed(){
 float displacepent_per_unity = 0.1;
 Vector3 displacement = new Vector3(0,0,0);
 if(keyCode == RIGHT|| key=='d' || key =='D'){
   displacement.x += displacepent_per_unity;
 }else if(keyCode == LEFT|| key=='a' || key =='A'){
    displacement.x -= displacepent_per_unity;
 }
 if(keyCode == UP|| key=='w' || key =='W'){
   displacement.y += displacepent_per_unity;
 }else if(keyCode == DOWN || key=='s' || key =='S'){
   displacement.y -= displacepent_per_unity;
 }
 if(key == 'z' ||key =='Z'){
   displacement.z += displacepent_per_unity;
 }else if(key == 'x' ||key =='X'){
   displacement.z -= displacepent_per_unity;
 }
 
 octahedron.scale(displacement);
}