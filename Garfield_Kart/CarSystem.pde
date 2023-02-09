class CarSystem implements Comparable<CarSystem> {
int       generation = 0;
double fitness = 0;

SensorSystem  sensorSystem = new SensorSystem();

  //CarSystem - 
  //Her kan man lave en generisk alogoritme, der skaber en optimal "hjerne" til de forhåndenværende betingelser

   
  
  ArrayList<CarController> CarControllerList  = new ArrayList<CarController>();

  CarSystem() {
      CarController controller = new CarController();
      CarControllerList.add(controller);
    }

  void updateAndDisplay() {
    //1.) Opdaterer sensorer og bilpositioner
    for (CarController controller : CarControllerList) {
      controller.update();
    }

    //2.) Tegner tilsidst - så sensorer kun ser banen og ikke andre biler!
    for (CarController controller : CarControllerList) {
      controller.display();
    }
  }
  
    void calculateFitness() {

    }

public CarSystem clone() {
     CarSystem clone = new CarSystem();     
     return clone;
  }

 @Override public int compareTo(CarSystem a)
  {
      int retval1 = Double.compare(this.fitness, a.fitness);      

      retval1 = retval1 * -1;
      return retval1;     
  }
  
}
 
 
