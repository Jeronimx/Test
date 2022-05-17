// TECLAS A, S, D

Loading l;
Modular m;
void setup(){
  size( 600,600 );
  l = new Loading();
  m = new Modular();
}

void draw(){
  background( 0 );
  if( key == 'a' || key == 'A' ){
    l.display(); 
  }
  if( key == 's' || key == 'S'){
    m.agrandar(); 
  }
  if( key == 'd' || key == 'D'){
    m.achicar(); 
  }
}
