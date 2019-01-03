void setup(){
  size(1400,1000);
  background(96, 128, 56);
  
  for (int i = 0; i < numberOfTrees; i++) {
    trees.add(new Tree());
  }
  
}
ArrayList<Tree> trees = new ArrayList<Tree>();
int numberOfTrees = int(random(1, 100));
float smallestMaxLength = 1000;
float numberOfCycles = 1000;
float fireBallSize = 1;

void draw(){
  
  
  if(frameCount % numberOfCycles == 0){
    saveFrame("trees/tree-######.png");
    for (int i = 0; i < numberOfTrees; i++) {
      //trees.get(i).clear();
    }
  }
  
  //frameRate(100);
  //background(0);
  //fill(0);
  //noStroke();
  //rect(width - 60, height - 45, 50, -20);
  //stroke(255);
  //fill(255);
  //text(frameCount, width - 50, height - 50);
  
  //text(branches1.size(), width - 50, height - 150);
  println(numberOfTrees);
  if(numberOfTrees > 300){
    fill(255, 0, 0);
    ellipse(width/2, height, fireBallSize, fireBallSize);
    fill(241, 172, 4);
    ellipse(width/2, height, fireBallSize/2, fireBallSize/2);
    fireBallSize *= 1.02;
  }
  
  if(fireBallSize > 2000){
    for(Tree tree : trees){
      tree.clear();
    }
    numberOfTrees = 0;
    fireBallSize = 1;
    background(96, 128, 56);
  }
  
  if(random(0, 1) > 0.95){
    trees.add(new Tree());
    numberOfTrees++;
  }
  
  if(numberOfTrees > 0){
    if(random(0, 1) > 0.99){
      int randomTreeIndex = int(random(0, trees.size()));
      Tree selectedTree = trees.get(randomTreeIndex);
      //println(numberOfTrees + ", " + trees.size());
      selectedTree.clear();
      trees.remove(randomTreeIndex);
      numberOfTrees--;
      background(96, 128, 56);
      for(Tree currentTree : trees){
        currentTree.drawTree();
      }
    }
    
    
  }
  
  for(Tree currentTree : trees){
     
    if(!currentTree.hasTrunk){
      currentTree.createTrunk(random(30,300));
    }
    
    if(!currentTree.isFullyGrown){
      currentTree.drawTree();
    }
    
    for(int i = 0; i < currentTree.size(); i++){
    //for(Branch currentBranch : currentTree.branches){
      Branch currentBranch = currentTree.get(i);
      
      if(currentBranch.length >= currentBranch.maxLength && !currentBranch.hasChildren && currentBranch.maxLength > 4){
        ArrayList<Branch> newBranches = currentBranch.createChildren();
        for(int k = 0; k < newBranches.size(); k++){
          currentTree.add(newBranches.get(k));
        }
      }
      
      if(currentBranch.maxLength <= 10 && !currentTree.isFullyGrown){
        currentTree.isFullyGrown = true;
        //println("setting fully grown to true");
      }
      
      if(!currentTree.isFullyGrown){
        currentBranch.grow();
        //currentTree.drawTree();
      }
      
    }
    
  }
   
}
