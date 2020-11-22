Particle[] starArray;
void setup()
{
  size(1000,750);
  background(0);
  starArray = new Particle[300];
  for (int i = 0; i < starArray.length; i+=1){
    starArray[i] = new Particle(500,350);
  }
  for (int i = 0; i < starArray.length-250; i+=1){
    starArray[i] = new OddballParticle(500,350);
  }
}
void draw()
{
  background(0);
  for (int i = 0; i < starArray.length; i+=1){
    starArray[i].show();
    starArray[i].move();
  }
}
void mousePressed(){
  background(0);
  for (int i = 0; i < starArray.length; i+=1){
    starArray[i] = new Particle(mouseX,mouseY);
  }
  for (int i = 0; i < starArray.length-250; i+=1){
    starArray[i] = new OddballParticle(mouseX,mouseY);
}
}
class Particle
{
  float xPos, yPos;
  double starAngle, starSpeed;
  color particleColor;
  Particle(float x_, float y_){
    xPos = x_;
    yPos = y_;
    starAngle = Math.random()*2*Math.PI;
    starSpeed = Math.random()*10;
    particleColor = color((int)(Math.random()*256),(int)(Math.random()*256), (int)(Math.random()*256));
    }
    
  void move() {
    xPos += Math.cos(starAngle)*starSpeed;
    yPos += Math.sin(starAngle)*starSpeed;
  }
  void show() {
    fill(particleColor);
    ellipse(xPos, yPos, 5, 5);
  }
}

class OddballParticle extends Particle
{
  OddballParticle(float x_,float y_){
    super(x_, y_);
    xPos = x_;
    yPos = y_;
  }
  void move() {
     xPos+=(float)starSpeed*Math.cos(starAngle);
     yPos+=(float)starSpeed*Math.sin(starAngle);
  }
  void show() {
    fill(particleColor);
    int randSize = (int)(Math.random()*25);
    ellipse(xPos,yPos,randSize,randSize);
  }
}
