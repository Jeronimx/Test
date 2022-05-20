Femenino f;
Fondo r;
void setup() {
  size( 600, 700 );
  f = new Femenino();
  r = new Fondo();
}

void draw() {
  background(120);
  //Fondo ruta
  r.display();
  r.fondoLoop();
  //Personaje Femenino
  f.display();
  f.mover();
  f.limites();
}
