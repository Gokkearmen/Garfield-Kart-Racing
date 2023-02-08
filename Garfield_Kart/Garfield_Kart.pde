//populationSize: Hvor mange "controllere" der genereres, controller = bil & hjerne & sensorer
int       populationSize  = 1;
int       matingpoolSize = 10;
int generation;
int i;
CarSystem[] population;



//trackImage: RacerBanen , Vejen=sort, Udenfor=hvid, Målstreg= 100%grøn
PImage    trackImage;

void setup() {
  size(500, 600);
  frameRate(100);
  trackImage = loadImage("track.png");
  
  
   population = new CarSystem[populationSize];
 
  for (i = 0; i < population.length; i++) {
  CarSystem carSystem       = new CarSystem();
  population[i] = carSystem;
  }

}


void draw() {
  clear();
  fill(255);
  rect(0, 50, 1000, 1000);
  image(trackImage, 0, 80);
     
  for (int i = 0; i < populationSize; i++) {
    population[i].calculateFitness();
  }

   for (int i = 0; i < populationSize; i++) {
    population[i].updateAndDisplay();
  }




/*
     
  if (frameCount%200==0) {
    generation++;
   println("generation - "+ generation);
   
   for (int i = carSystem.CarControllerList.size()-1 ; i >= 0;  i--) {
   SensorSystem s = carSystem.CarControllerList.get(i).sensorSystem;
   if(s.whiteSensorFrameCount > 0){
   carSystem.CarControllerList.remove(carSystem.CarControllerList.get(i));
   
   }
 */
}

  
