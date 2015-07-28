// Liquid Class
class Liquid {

  float x, y, w, h, c; // Rect data + drag coefficient

  Liquid(float x_, float y_, float w_, float h_, float c_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }

  // Mover liquid or not?
  boolean contains(Mover m) {
    PVector l = m.location;
    return l.x > x && l.x < x + w && l.y > y && l.y < y + h;
  }

  // Calculate drag force
  PVector drag(Mover m) {

    // Magnitude is coeddicient * speed * speed
    float speed = m.velocity.mag();
    float dragMag = c * speed * speed;

    // Direction is inverse of velocity
    PVector dragForce = m.velocity.get();
    dragForce.mult(-1);

    dragForce.normalize();
    dragForce.mult(dragMag);
    return dragForce;

  }

  void display() {
    noStroke();
    fill(50);
    rect(x, y, w, h);
  }

}
