
Principal p;

void setup(){
  size(400,600);
   p = new Principal();
}

void draw(){
  p.display();
  p.colision();
  

}

void keyPressed(){
  if( key == 'r' ){
      p.reset();
    }
}
