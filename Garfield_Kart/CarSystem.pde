class CarSystem implements Comparable<CarSystem> {

  int generation = 0;
  double fitness = 0;

  //CarSystem - 
  //Her kan man lave en generisk alogoritme, der skaber en optimal "hjerne" til de forhåndenværende betingelser

  CarController controller = new CarController();


  void updateAndDisplay() {
    //1.) Opdaterer sensorer og bilpositioner
    controller.update();

    //2.) Tegner tilsidst - så sensorer kun ser banen og ikke andre biler!
    controller.display();
  }

  void calculateFitness() {

    boolean isgreen = controller.isGreen();
    int redness = controller.redness();
    float greenness = controller.greenness();
    
    this.fitness = greenness - redness;
    /*if (isgreen == false) {
     this.fitness = this.fitness -2; 
    } else {
     this.fitness = this.fitness +1; 
    
    }*/
     println(this.fitness);
 
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

  public void mutate() {
  }
}
