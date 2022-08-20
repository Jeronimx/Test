import fisica.*;

FWorld mundo;
Personaje p1;
Villano p2;
Arcos a1,a2;
String estado = "inicio";

void setup(){
  
  size( 1200,600 );
  Fisica.init(this);
  
  mundo = new FWorld();
  mundo.setEdges();
  mundo.setGravity(0,0);
  
  FCircle circulo = new FCircle(50);
  circulo.setName("circulo"); 
  circulo.setPosition( width/2, height/2 );
  circulo.setFill(255,0,0);
  circulo.setRestitution(1.2);
  circulo.setBullet(true);
  circulo.addTorque(12);

  mundo.add( circulo );

  
  p1 = new Personaje(30,70);
  p1.inicializar(100,height/2);
  mundo.add( p1 );
  
  p2 = new Villano(30,70);
  p2.inicializar(width-100,height/2);
  mundo.add( p2 );
  
  a1 = new Arcos( 10, 150 );
  a1.inicializar( 10, height/2, 255,0,0 );
  
  mundo.add( a1 );
  
  a2 = new Arcos( 10, 150 );
  a2.inicializar( width-10, height/2, 0,0,255 );
  mundo.add( a2 );

}

void draw(){
  if( estado.equals("inicio") ){
    textAlign( CENTER );
    textSize(50);
    background(0);
    fill(255);
    text( "PRESIONA ENTER PARA CONTINUAR", width/2, height/2 );
    if( keyCode == ENTER ){
      estado = "juego";
    }
  }
  if( estado.equals("juego") ){
    
  background(150);

  p1.actualizar();
  p2.actualizar();
  
  mundo.step();
  mundo.draw();
  
  }
  
  
}

//void contactStarted( FContact c){
//  FBody f1 = c.getBody1();
//  FBody f2 = c.getBody2();
  
//  println( "cuerpo1 : " + f1.getName() );
//  println( "cuerpo2 : " + f2.getName() );
//}

void keyPressed(){
  if( key == 'w' ){
    p1.upPress = true;
  }
  if( key == 's' ){
    p1.unPress = true;
  }
  if( key == 'd' ){
    p1.derPress = true;
  }
  if( key == 'a' ){
    p1.izqPress = true;
  }
  
  
  
  
  if( keyCode == UP ){
    p2.upPress = true;
  }
  if( keyCode == DOWN ){
    p2.unPress = true;
  }
  if( keyCode == RIGHT ){
    p2.derPress = true;
  }
  if( keyCode == LEFT ){
    p2.izqPress = true;
  }
  
  
}

void keyReleased(){
  if( key == 'w' ){
    p1.upPress = false;
  }
  if( key == 's' ){
    p1.unPress = false;
  }
  if( key == 'd' ){
    p1.derPress = false;
  }
  if( key == 'a' ){
    p1.izqPress = false;
  }
  
  
  
  if( keyCode == UP ){
    p2.upPress = false;
  }
  if( keyCode == DOWN ){
    p2.unPress = false;
  }
  if( keyCode == RIGHT ){
    p2.derPress = false;
  }
  if( keyCode == LEFT ){
    p2.izqPress = false;
  }
}
