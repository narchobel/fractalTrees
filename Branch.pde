class Branch {
 
  float length;
  float thickness;
  float[] origin = new float[2];
  float angle;
  float maxLength;
  float[] end = new float[2];
  boolean hasChildren;
  
  
  //Constructor
  Branch(float[] origin, float angle, float thickness, float maxLength){
   this.origin = origin;
   this.angle = angle;
   this.length = 2;
   this.thickness = thickness;
   //this.thickness = random(1,4);
   this.maxLength = maxLength;
   hasChildren = false;
  }
  
  ArrayList<Branch> createChildren(){
    
    hasChildren = true;
    int numberOfBranches = int(random(2,5.999));
    ArrayList<Branch> newBranches = new ArrayList<Branch>();
    float startX = end[0];
    float startY = end[1];
    float[] newOrigin = new float[2];
    newOrigin[0] = startX;
    newOrigin[1] = startY;
    float newMaxLength = maxLength * random(0.6, 0.8);
    float newThickness = 0.7 * thickness;
    
    for(int i = 1; i < numberOfBranches; i++){
      float newAngle = (random(-PI/4, PI/4)) + angle;
      Branch newBranch = new Branch(newOrigin, newAngle, newThickness, newMaxLength);
      newBranches.add(newBranch);
    }
    
   return newBranches;
  }
  
  //void die(){
  //  pushMatrix();  
  //  translate(origin[0], origin[1]);
  //  rotate(angle);
  //  stroke(0);
  //  //strokeWeight(thickness * ((frameCount % numberOfCycles) / 50 + 1));
  //  strokeWeight(thickness + 3);
  //  line(0, 0, 0, -length);
  //  popMatrix();
  //}
  
  void grow(){
    pushMatrix();  
    translate(origin[0], origin[1]);
    rotate(angle);
    //strokeWeight(thickness * ((frameCount % numberOfCycles) / 50 + 1));
    strokeWeight(thickness);
    if(length < maxLength && maxLength > 10){
      length++;
      end[0] = (length * sin(angle)) + origin[0];
      end[1] = (-length * cos(angle)) + origin[1];
    }
    popMatrix();
  }
  
  void drawBranch(){
    pushMatrix();  
    translate(origin[0], origin[1]);
    rotate(angle);
    stroke(75,43,30);
    strokeWeight(thickness);
    line(0, 0, 0, -length);
    popMatrix();
  }
  
}
