PVector origin;
Mover bob;
float restLength;

void setup() {
  size(640, 360);
  restLength = 200;
  origin = new PVector(width/2, 0);
  bob = new Mover(width/2, 200);
}

void draw() {
  background(255);
  line(origin.x, origin.y, bob.location.x, bob.location.y);

  PVector spring = PVector.sub(bob.location, origin);
  float currentLength = spring.mag();
  spring.normalize();
  float k = 0.09;
  float displacement = currentLength - restLength;
  spring.mult(-k*displacement);

  bob.applyForce(spring);

  PVector wind = new PVector(0.1, 0);
  if(mousePressed) {
    bob.applyForce(wind);
  }

  PVector gravity = new PVector(0, 0.6);
  bob.applyForce(gravity);

  bob.update();
  bob.display();

}
