
import java.util.Arrays;


//populationSize: Hvor mange "controllere" der genereres, controller = bil & hjerne & sensorer
int       populationSize  = 10;
int       matingpoolSize = populationSize/10;
int generation;
int i;
CarSystem[] population;
CarSystem[] matingPool;
  SensorSystem  sensorSystem = new SensorSystem();



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

   matingPool = new CarSystem[matingpoolSize];
   
}


void draw() {
  clear();
  fill(255);
  rect(0, 50, 1000, 1000);
  image(trackImage, 0, 80);
  for (int i = 0; i < populationSize; i++) {
   population[i].updateAndDisplay();
  }
  
     for (int i = 0; i < populationSize; i++) {
     population[i].calculateFitness();

  }
  
   //SensorSystem s = CarSystem.population[].get(i).sensorSystem;
   
 if (frameCount%200==0) {
   


Arrays.sort(population);

for (int i = 0; i < matingPool.length; i++) {
    matingPool[i] = population[i];
  }   

for (int i = 0; i < population.length; i++) {
    int matingpoolIndex = i % matingpoolSize;
    CarSystem cars = matingPool[matingpoolIndex];   
    population[i] = cars.clone(); 
  }

 for (int i = 0; i < population.length; i++) {
    //population[i].mutate();
 }
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

  
