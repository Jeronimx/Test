class Principal{
  Circulo f;
  Circulo m;
  Obstaculos o1;
  Obstaculos o2;
  Obstaculos o3;
  Obstaculos o4;
  Obstaculos o5;
  Obstaculos o6;
  int velocidad = 5;
  float x, y, tam;
  String estado = "estado1";
  PImage ruta, barrera;
  
  Principal(){
    
    f = new Circulo( #F57CEF, width-300, height-50 );
    m = new Circulo( #00AAFC, width-100, height-50 );
    o1 = new Obstaculos(0,470,150,30);
    o2 = new Obstaculos(70,380,130,30);
    o3 = new Obstaculos(40,300,100,30);
    o4 = new Obstaculos(0,220,100,30);
    o5 = new Obstaculos(100,150,100,30);
    ruta = loadImage( "ruta.jpg" );
    
    x = width/2;
    y = height/2;
    tam = 150;
    
  }
  
  void display(){
    
    //boton elegi un color
    float d1 = dist( mouseX, mouseY, x/2, y );
    //float d2 = dist( mouseX, mouseY, x*1.5, y );
    if( estado.equals( "estado1" ) ){ //ELECCION
      background( 120 );
      textAlign( CENTER );
      textSize( 30 );
      fill( 255 );
      text( "Elegí un color", width/2, 150);
      fill( #F57CEF );
      ellipse(x/2, y, tam, tam );
      fill( #00AAFC );
      ellipse(x*1.5, y, tam, tam );
    }
    if( (d1) < 50 && mousePressed ){
      estado = "juego";
    } 
  

    
    if( estado.equals( "juego" )){
    image( ruta, 0, 0,400,600);
    //Personaje Femenino
    f.display();
    f.mover( velocidad );
    f.limites();
    //Personaje Masculino
    m.display();
    m.moverMasculino();
    //Obstaculos
    o1.display();
    o2.display();
    o3.display();
    o4.display();
    o5.display();

    }
    //println( velocidad );
  }
  
  
 void colision(){
    
   if( (f.posX()> o1.x) &&  (f.posX()<o1.x+o1.ancho) && (f.posY()>o1.y) &&  (f.posY()<o1.y+o1.alto) )  {
      background(0);
      f.y = f.y +10;
    } 
    
     if( (f.posX()>o2.x) &&  (f.posX()<o2.x+o2.ancho) && (f.posY()>o2.y) &&  (f.posY()<o2.y+o2.alto) ){
      background(0);
      f.y = f.y +10;
      velocidad = velocidad-1;
    } if( velocidad <= 0 ){ velocidad = 1; }
    
     if( (f.posX()>o3.x) &&  (f.posX()<o3.x+o3.ancho) && (f.posY()>o3.y) &&  (f.posY()<o3.y+o3.alto) ){
      background(0);
      f.y = f.y +10;
    
    }
    
     if( (f.posX()>o4.x) &&  (f.posX()<o4.x+o4.ancho) && (f.posY()>o4.y) &&  (f.posY()<o4.y+o4.alto) ){
      background(0);
      f.y = f.y +10;
      velocidad = velocidad-1;
    }if( velocidad <= 0 ){ velocidad = 1; }
    
      if( (f.posX()>o5.x) &&  (f.posX()<o5.x+o5.ancho) && (f.posY()>o5.y) &&  (f.posY()<o5.y+o5.alto) ){
      background(0);
      f.y = f.y +10;
     
    }
    
  
  }
  
  void reset(){
    estado = "estado1";
    m.reset(width-100, height-50);
    f.reset(width-300, height-50);
    velocidad = 5;
  }
  


}
