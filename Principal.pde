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
  PImage ruta;
  
  Principal(){
    
    f = new Circulo( #F57CEF, width-300, height-50 );
    m = new Circulo( #7C8CF5, width-100, height-50 );
    o1 = new Obstaculos(0,450,150,50);
    o2 = new Obstaculos(70,350,130,50);
    o3 = new Obstaculos(40,250,50,50 );
    o4 = new Obstaculos(0,150,100,50);
    o5 = new Obstaculos(150,150,50,50 );
    ruta = loadImage( "ruta.jpg" );
    
    x = width/2;
    y = height/2;
    tam = 150;
    
  }
  
  void display(){
    
    float d1 = dist( mouseX, mouseY, x/2, y );
    //float d2 = dist( mouseX, mouseY, x*1.5, y );
    if( estado.equals( "estado1" ) ){
      background( 120 );
      textAlign( CENTER );
      textSize( 30 );
      fill( 255 );
      text( "Elegí un color", width/2, 150);
      fill( #F57CEF );
      ellipse(x/2, y, tam, tam );
      fill( #7C8CF5 );
      ellipse(x*1.5, y, tam, tam );
    }
    if( d1 < 50 && mousePressed ){
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
    o1.display(100);
    o2.display(100);
    o3.display(100);
    o4.display(100);
    o5.display(100);

    }
    println( velocidad );
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
  
  


}
