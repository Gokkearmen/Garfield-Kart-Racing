//populationSize: Hvor mange "controllere" der genereres, controller = bil & hjerne & sensorer
int       populationSize  = 100;
int       matingpoolSize = 10;
int generation;
int i;
double fitness;
CarSystem[] population;



//trackImage: RacerBanen , Vejen=sort, Udenfor=hvid, Målstreg= 100%grøn
PImage    trackImage;

void setup() {
  size(500, 600);
  frameRate(100);
  trackImage = loadImage("track.png");
  
  
   population = new CarSystem[populationSize];
 
  for (i = 0; i < population.length; i++) {
  CarSystem carSystem       = new CarSystem(populationSize);
  population[i] = carSystem;
  }

}

CarSystem carSystem       = new CarSystem(populationSize);

void draw() {
  clear();
  fill(255);
  rect(0, 50, 1000, 1000);
  image(trackImage, 0, 80);
     

  carSystem.updateAndDisplay();



/*

     
  if (frameCount%200==0) {
    generation++;
   println("generation - "+ generation);
   
   for (int i = carSystem.CarControllerList.size()-1 ; i >= 0;  i--) {
   SensorSystem s = carSystem.CarControllerList.get(i).sensorSystem;
   if(s.whiteSensorFrameCount > 0){
   carSystem.CarControllerList.remove(carSystem.CarControllerList.get(i));
   
   for (int i = carSystem.CarControllerList.size()-1 ; i >= 0;  i--) {
   SensorSystem s = carSystem.CarControllerList.get(i).sensorSystem;
   if(
   }
   }
   }
  */
   
}

  
