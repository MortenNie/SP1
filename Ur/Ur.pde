float urPoint1 = -1;
float urHastighed1 = 0.002;

void setup() {
size(1000, 1000);


  
}

void draw() {
background(155);
//uret virker desværre kun i center (0,0) men virker med variabel diameter og jeg flytter det med translate funktionen.
translate(400,400);
displayClock(0,0,400);

}
  


public void displayClock(int xpos, int ypos, int diameter) {
  //lav selve den circkulære struktur.
  fill(255);
   circle(xpos, ypos, diameter);
  
  //lav den bevægelige viser.
  line(xpos, ypos, diameter/2*cos(urPoint1), diameter/2*sin(urPoint1));
   urPoint1 = urPoint1 + urHastighed1; 
  
  
  //indel uret op med 12 pladser, 360 grader delt med 12. dvs. incrementet skal være 30.
  int time = 3;
  for (int y = 0; y < 360; y = y + 30) {
    float vinkel = radians(y);
    line(diameter/2*cos(vinkel)-5, diameter/2*sin(vinkel)-5, diameter/2*cos(vinkel), diameter/2*sin(vinkel));
    
    //Laver pladser til tallene 1 til 12 på uret.
    fill(0);
    text(time, diameter/2*cos(vinkel), diameter/2*sin(vinkel));
    time = time + 1;
    if (time > 12) {
      time = 1;
    }
  }
  
}
