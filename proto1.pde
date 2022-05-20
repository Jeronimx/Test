Principal p;
void setup() {
  size( 600, 600 );
  p = new Principal();
}

void draw() {

  background(120);
  p.display();
  p.colision();
}
