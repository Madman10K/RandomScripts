// Digital power pin IDs for the first traffic light
#define GREEN 2
#define YELLOW 3
#define RED 4

// Digital power pin IDs for the second traffic light
#define GREEN2 13
#define YELLOW2 12
#define RED2 11

// Digital power pin ID for the audio system
#define AUDIO 7

// Delays for the different light switches
#define DELAY_GREEN 2000
#define DELAY_YELLOW 4000
#define DELAY_RED 2000

// Square wave pitch constants
#define PEDESTRIAN_WAVE 300
#define CAR_WAVE 600

// Buttons
#define CAR_BUTTON 5
#define PEDESTRIAN_BUTTON 6

uint64_t currentPedestrians = 0;
uint64_t currentCars = 0;
float mod = 1.0f;

void setup()
{   
    // Setup the digital pin IDs that we defined to output in order to get voltage
    pinMode(GREEN, OUTPUT);
    pinMode(YELLOW, OUTPUT);
    pinMode(RED, OUTPUT);
    pinMode(GREEN2, OUTPUT);
    pinMode(YELLOW2, OUTPUT);
    pinMode(RED2, OUTPUT);
    pinMode(AUDIO, OUTPUT);

    // These 2 ones will be used to check if a pressure plate is pressed
    pinMode(CAR_BUTTON, INPUT_PULLUP);
    pinMode(PEDESTRIAN_BUTTON, INPUT_PULLUP);
}

// A very botched way of scheduling the input
void updateState(const uint64_t& targetMilliseconds)
{
    uint64_t milliseconds = millis(); // Get the current unix timestamp
    uint64_t currentTime = 0; // Use this to accumulate

    // In this loop we're going to check for any input given by the user
    while (currentTime < targetMilliseconds)
    {
        // Update the current pedestrian and car number
        if (digitalRead(PEDESTRIAN_BUTTON) == LOW)
            currentPedestrians++;
        if (digitalRead(CAR_BUTTON) == LOW)
            currentCars++;   

        currentTime = millis() - milliseconds;
    }
}

void loop()
{
    green_light();
    if (currentPedestrians > currentCars)
    {
        mod = 2.0f; 
        if (currentPedestrians > 20)
            currentPedestrians -= 20;
        else
            currentPedestrians = 0;
    }
    else if (currentPedestrians < currentCars)
    {
        mod =  0.5f;
        if (currentPedestrians > 10)
            currentPedestrians -= 10;
        else
            currentPedestrians = 0;
    }
    else
    {
        if (currentPedestrians > 15)
            currentPedestrians -= 15;
        else
            currentPedestrians = 0;
    }
       
    for (uint64_t i = 0; i < (uint64_t)(5 * mod); i++)
    {
        tone(AUDIO, PEDESTRIAN_WAVE);
        updateState(DELAY_YELLOW / 10);
        noTone(AUDIO);
        updateState(DELAY_YELLOW / 10);    
    }
  
    yellow_light();
    updateState(DELAY_RED);
    red_light();

    if (currentCars > currentPedestrians)
    {
        mod = 2.0f; 
        if (currentCars > 20)
            currentCars -= 20;
        else
            currentCars = 0;
    }
    else if (currentCars < currentPedestrians)
    {
        mod =  0.5f;
        if (currentCars > 10)
            currentCars -= 10;
        else
            currentCars = 0;
    }
    else
    {
        if (currentCars > 15)
            currentCars -= 15;
        else
            currentCars = 0;
    }
    
    tone(AUDIO, CAR_WAVE);
    updateState((uint64_t)(DELAY_YELLOW * mod));
    noTone(AUDIO);
    updateState((uint64_t)(DELAY_YELLOW * mod));
    yellow_light();
    updateState(DELAY_GREEN);
    mod = 1.0f;
}

// Turns on the green light for the pedestrians and the red light for the vehicles
void green_light()
{
    digitalWrite(GREEN, HIGH);
    digitalWrite(YELLOW, LOW);
    digitalWrite(RED, LOW);
    digitalWrite(GREEN2, LOW);
    digitalWrite(YELLOW2, LOW);
    digitalWrite(RED2, HIGH); 
}

// Turns on the yellow lights for both the pedestrians and the vehicles
void yellow_light()
{
    digitalWrite(GREEN, LOW);
    digitalWrite(YELLOW, HIGH);
    digitalWrite(RED, LOW);
    digitalWrite(GREEN2, LOW);
    digitalWrite(YELLOW2, HIGH);
    digitalWrite(RED2, LOW);
}

// Turns on the red light for the pedestrians and the green light for the cars
void red_light()
{
    digitalWrite(GREEN, LOW); 
    digitalWrite(YELLOW, LOW);
    digitalWrite(RED, HIGH);
    digitalWrite(GREEN2, HIGH);
    digitalWrite(YELLOW2, LOW);
    digitalWrite(RED2, LOW);
}
