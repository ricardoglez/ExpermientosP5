Calaveras[] cala= new Calaveras[7];
  
void setup() {
    size(800, 600);
for(int i= 0; i < cala.length; i++){
  cala[i] = new Calaveras(i,.5);
  
}
  }
  
void draw(){

    shapeMode(CENTER);
    //pushMatrix();
    for(int i = 0 ; i < cala.length; i++){
      cala[i].update();
      cala[i].display();
    }
  
  }
