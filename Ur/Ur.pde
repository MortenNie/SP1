float urPoint1 = -1.5;
float urHastighed1 = 0.001;
float urPoint2 = 1.5;
float urHastighed2 = 0.0002;

void setup() {
size(1000, 1000);


  
}

void draw() {


background(155);
//the clock only works in center(0,0) sadly, I move the clocks with the translate function.
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
  //make the circulure structur.
  
  fill(255);
  
   circle(xpos, ypos, diameter);
   
  //Make the move-able arms.
 
  line(xpos, ypos, diameter/2*cos(urPoint1), diameter/2*sin(urPoint1));
   urPoint1 = urPoint1 + urHastighed1; 
 
   line(xpos, ypos, diameter/2*cos(urPoint2), diameter/2*sin(urPoint2));
   urPoint2 = urPoint2 + urHastighed2; 
  
  //divide the circle in 12. "spaces" 360 / 12 = 30. that means the increment in the loop should be 30.
  int tid = 3;
  for (int y = 0; y < 360; y = y + 30) {
    float vinkel = radians(y);
    line(diameter/2*cos(vinkel)-5, diameter/2*sin(vinkel)-5, diameter/2*cos(vinkel), diameter/2*sin(vinkel));
    
    //make the numbers on the circle.
    fill(0);
    text(tid, diameter/2*cos(vinkel), diameter/2*sin(vinkel));
    tid = tid + 1;
    if (tid > 12) {
      tid = 1;
    }
  }
  
}


}
