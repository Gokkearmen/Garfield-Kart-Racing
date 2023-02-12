class CarController {
  //Forbinder - Sensorer & Hjerne & Bil
  float varians             = 2; //hvor stor er variansen på de tilfældige vægte og bias
  Car bil;
  NeuralNetwork hjerne; 
  SensorSystem  sensorSystem;

  CarController() {
    this.bil          = new Car();
    this.hjerne       = new NeuralNetwork(varians); 
    this.sensorSystem = new SensorSystem();
  }

  CarController(Car car, NeuralNetwork neuralNetwork) { 
    this.bil = car;
    this.hjerne = neuralNetwork;
    this.sensorSystem = new SensorSystem();
  }

  void update() {
  if(sensorSystem.whiteSensorFrameCount == 0 /*&& sensorSystem.lastGreenDetection != true*/){
    //1.)opdtarer bil 
    bil.update();

    //2.)opdaterer sensorer    
    sensorSystem.updateSensorsignals(bil.pos, bil.vel);

    //3.)hjernen beregner hvor meget der skal drejes
    float turnAngle = 0;
    float x1 = int(sensorSystem.leftSensorSignal);
    float x2 = int(sensorSystem.frontSensorSignal);
    float x3 = int(sensorSystem.rightSensorSignal);    
    turnAngle = hjerne.getOutput(x1, x2, x3);    

    //4.)bilen drejes
    bil.turnCar(turnAngle);
  }
}

  void display() {
    bil.displayCar();
    sensorSystem.displaySensors();
  }

  public float getposx() {
    float svar = bil.getposx();
    return svar;
  }
  
  public float getposy() {
    float svar = bil.getposy();
    return svar;
  }

  public int redness() {
    int redness = sensorSystem.redness();
    return redness;
  }

  public float greenness() {
    float greenness = sensorSystem.greenness();
    return greenness;
  }

  public CarController clone() {
    Car carClone = bil.clone();
    NeuralNetwork neuralNetworkClone = hjerne.clone();
    CarController controllerClone = new CarController(carClone,neuralNetworkClone);     
    return controllerClone;
  }
}
