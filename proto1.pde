Circulo f;
Circulo m;
Fondo r;
void setup() {
  size( 600, 600 );
  f = new Circulo( #F57CEF, 150, height-100 );
  m = new Circulo( #7C8CF5, width-150, height-100 );
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
  //Personaje Masculino
  m.display();
  m.moverMasculino();
}
