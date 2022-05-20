class Principal{
  Circulo f;
  Circulo m;
  Fondo r;
  Obstaculos o;
  
  Principal(){
    f = new Circulo( #F57CEF, 150, height-100 );
    m = new Circulo( #7C8CF5, width-150, height-100 );
    o = new Obstaculos( );
    r = new Fondo();
  }
  
  void display(){
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
    //Obstaculos
    o.display();
    o.mover();
  }
  
  void colision(){
    
    float d = dist( f.posX(), f.posY(), o.posX(), o.posY() );
    
    if( d < 10 ){
      background(0);
    }
    
  }
  
  


}
