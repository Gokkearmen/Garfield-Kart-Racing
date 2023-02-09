class Car {  
  //Bil - indeholder position & hastighed & "tegning"
  PVector pos;
  PVector vel;

  Car() {
    pos = new PVector(60, 232);
    vel = new PVector(0, 5);
  }

  Car(PVector pos, PVector vel) {
    this.pos = new PVector(pos.x, pos.y);
    this.vel = new PVector(vel.x, vel.y);
  }

  void turnCar(float turnAngle) {
    vel.rotate(turnAngle);
  }

  void displayCar() {
    stroke(100);
    fill(100);
    ellipse(pos.x, pos.y, 10, 10);
  }

  void update() {
    pos.add(vel);
  }

  public Car clone() {
    Car clone = new Car(pos, vel);    
    return clone;
  }
}
