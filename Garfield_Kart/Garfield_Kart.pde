
import java.util.Arrays;

//programmet laver nye generationer efter "FramesPerGeneration" af frames. Hver generation muteres, og de biler med højest fitness frasorteres.
//Klonerne starter hvor sidste generation sluttede, men kan efter behov let rykkes til startlinjen med en p-vektor. Dette er dog ikke nødvendigt, da fitness beregnes uden brug af laptimes.

//populationSize: Hvor mange "controllere" der genereres, controller = bil & hjerne & sensorer
int populationSize  = 100;
int framesPerGeneration = 250;
int matingpoolSize = 10;
int generation;
int i;

CarSystem[] population;
CarSystem[] matingPool;

//trackImage: RacerBanen , Vejen=sort, Udenfor=hvid, Målstreg= 100%grøn
PImage    trackImage;

void setup() {
  size(500, 600);
  frameRate(100);
  trackImage = loadImage("track.png");

  // create array 
  population = new CarSystem[populationSize];

  // populate array
  for (i = 0; i < population.length; i++) {
    CarSystem carSystem = new CarSystem();
    population[i] = carSystem;
  }
  
  // create array
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

  // calc fintess for each car 
  for (int i = 0; i < populationSize; i++) {
    population[i].calculateFitness();
  }

  
  if (frameCount%framesPerGeneration==0) {
    
    // sort cars
    Arrays.sort(population);


    // copy the most fit into mating pool   
    for (int i = 0; i < matingPool.length; i++) {
      matingPool[i] = population[i];
    }   

    // clone from mating pool into generation
    for (int i = 0; i < population.length; i++) {
      int matingpoolIndex = i % matingpoolSize;
      CarSystem cars = matingPool[matingpoolIndex];   
      population[i] = cars.clone();
    }
    
    println("change generation" + i++);

    // mutate new population 
    for (int i = 0; i < population.length; i++) {
      population[i].mutate(population[i].controller);
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
