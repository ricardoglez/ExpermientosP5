class Calaveras {
  int G = 1;
  PImage[] calavera = new PImage [21];

  float mass = 10;
  float dMin = 12;


  PVector[] zone = { 
    new PVector(50, 152.85), //0
    new PVector(647.15, 770), //1
    new PVector(604.25, 737.10), //2
    new PVector(142.85, 245.70), //3
    new PVector(225.70, 368.55), //4
    new PVector(491.40, 634.25), //5
    new PVector(368.55, 491.40)//6
    };


  PVector centroGrav; // atractor del pLoc
  PVector pLoc;//location x,y
  PVector prevCentre; // Centro anterior
  PVector acceleration; 
  PVector vel;
  PVector mouse = new PVector(mouseX, mouseY);
  String file;
  int fn ;
  
  Calaveras(int calaveraArchivo, float m) {
    fn = calaveraArchivo;
    mass = m;

    float x = random(zone[fn].x, zone[fn].y); //Colocarlo a una distacia aleatoria dentro de su zona
    float y = height/2;

    vel = new PVector(0, 0);// Velocidad 0
    vel.limit(10);
    acceleration = new PVector(-1, 0); //
    pLoc = new PVector( x, y );//Centro del Puerco
    centroGrav = new PVector( x, y);//siemrpre regresar a este punto
    
    file = "c"+fn+"-ls"+".png"; 
    calavera[fn] = loadImage(file);
}


void applyForce(PVector force) {//Aplicar fuerza Gravitacional 
  PVector f = PVector.div(force, mass);
  acceleration.add(f);
}

PVector attract(Atracttor a) {

  PVector force = PVector.sub(pLoc, a.location); 
  float distance = force.mag();
  distance = constrain(distance, 5.0, 25.0);  
  force.normalize();
  float strength = (G * mass * a.mass) / (distance * distance);
  force.mult(strength);  
  // println(force, " Fuerza ", distance);
  return force;
}

void update() {

  vel.add(acceleration);
  pLoc.add(vel);
  acceleration.mult(0);
}

}
