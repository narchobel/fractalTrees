class Tree {

  ArrayList<Branch> branches;
  boolean isFullyGrown;
  boolean hasTrunk;
  
  Tree(){
    branches = new ArrayList<Branch>();
    isFullyGrown = false;
    hasTrunk = false;
  }
  
  void createTrunk(float maxLength){
    float startX = random(0, width);
    float startY = height;
    float[] newOrigin = new float[2];
    newOrigin[0] = startX;
    newOrigin[1] = startY;
    float newAngle = random(-0.1, 0.1);
    Branch trunk = new Branch(newOrigin, newAngle, random(1,5), maxLength);
    add(trunk);
    hasTrunk = true;
  }
  
  void drawTree(){
    for(Branch branch : branches){
      branch.drawBranch();
    }
  }
  
  int size(){
    return branches.size();
  }
  
  void clear(){
    branches.clear();
  }
  
  void add(Branch branch){
    branches.add(branch);
  }
  
  Branch get(int i){
    return branches.get(i);
  }

}
