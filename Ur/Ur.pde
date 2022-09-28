float urPoint1 = -1.5;
float urHastighed1 = 0.001;
float urPoint2 = 1.5;
float urHastighed2 = 0.0002;

void setup() {
size(1000, 1000);


  
}

void draw() {


background(155);
//uret virker desværre kun i center (0,0) men virker med variabel diameter og jeg flytter det med translate funktionen.
translate(400,400);
Clock c = new Clock(0,0,400);
c.displayClock();

translate(250,250);
Clock p = new Clock(0,0, 200);
p.displayClock();

}
public class Clock {  

  int xpos;
  int ypos;
  int diameter;
  
  
  
  public Clock(int xpos, int ypos, int diameter) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.diameter = diameter;
    
    
  }

public void displayClock() {
  //lav selve den circkulære struktur.
  
  fill(255);
  
   circle(xpos, ypos, diameter);
   
  //lav de bevægelige visere. jeg har prøvet mange metoder med construktor, men kan ikke få det til at virke.
 
  line(xpos, ypos, diameter/2*cos(urPoint1), diameter/2*sin(urPoint1));
   urPoint1 = urPoint1 + urHastighed1; 
 
   line(xpos, ypos, diameter/2*cos(urPoint2), diameter/2*sin(urPoint2));
   urPoint2 = urPoint2 + urHastighed2; 
  
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


}
