class CarSystem implements Comparable<CarSystem> {

  int generation = 0;
  double fitness = 0;

  //CarSystem - 
  //Her kan man lave en generisk alogoritme, der skaber en optimal "hjerne" til de forhåndenværende betingelser

  CarController controller;

 CarSystem() {
   this.controller = new CarController();
 }

  CarSystem(CarController controller) {
    this.controller = controller;
  }

  void updateAndDisplay() {
    //1.) Opdaterer sensorer og bilpositioner
    controller.update();

    //2.) Tegner tilsidst - så sensorer kun ser banen og ikke andre biler!
    controller.display();
  }

  void calculateFitness() {
    
    float posx = controller.getposx();
    float poxy = controller.getposy();
    int redness = controller.redness();
    float greenness = controller.greenness();
    if (posx > 500) {
    this.fitness = -10000;
    } else if (posx < 0) {
    this.fitness = -10000;  
    } else if (poxy < 0) {
     this.fitness = -10000; 
    } else if (poxy > 600) {
     this.fitness = -10000; 
    } else {
    this.fitness = greenness - redness*2;
    }  
}

  public CarSystem clone() {
    CarController controllerClone = controller.clone();
    CarSystem clone = new CarSystem(controllerClone);   
    return clone;
  }

  @Override public int compareTo(CarSystem a)
  {
    int retval1 = Double.compare(this.fitness, a.fitness);      
    retval1 = retval1 * -1;
    return retval1;
  }

  public void mutate() {
  }
}
