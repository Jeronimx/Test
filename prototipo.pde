import fisica.*;

FWorld mundo;
Personaje p1;
Pelota p;
//FCircle circulo;
Villano p2;
Arcos a1,a2;
String estado = "inicio";
boolean goal = false;
int tiempoGol = 50;
boolean tiempoGola = false;
int gol, gol1;
//float cx,cy;

void setup(){
  
  size( 1200,600 );
  Fisica.init(this);
  
  gol = 0;
  gol1 = 0;
  
  mundo = new FWorld();
  mundo.setEdges();
  mundo.setGravity(0,0);
  
  
  //cx = width/2;
  //cy = height/2;
  
  //FCircle circulo = new FCircle(50);
  //circulo.setName("circulo"); 
  //circulo.setPosition( cx,cy );
  //circulo.setFill(255,0,0);
  //circulo.setRestitution(1.2);
  //circulo.setBullet(true);
  //circulo.addTorque(12);

  //mundo.add( circulo );
  
  p = new Pelota(50);
  p.inicializar(width/2, height/2 );
  p.setName("circulo"); 
  mundo.add( p );
  
  p1 = new Personaje(80);
  p1.inicializar(100,height/2);
  mundo.add( p1 );
  
  p2 = new Villano(80);
  p2.inicializar(width-100,height/2);
  mundo.add( p2 );
  
  a1 = new Arcos( 10, 150 );
  a1.inicializar( 10, height/2, 255,0,0 );
  a1.setName("arco1");
  mundo.add( a1 );
  
  a2 = new Arcos( 10, 150 );
  a2.inicializar( width-10, height/2, 0,0,255 );
  a2.setName("arco2");
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
  
  if( estado.equals("juego") || estado.equals("gol") ){
    
  background(150);

  p1.actualizar();
  p2.actualizar();
  
  p.setStatic(false);
  
  if( tiempoGola == true ){
    tiempoGol --;
      if( tiempoGol > 0 ){
        text( "GOOOOLL", width/2, height/2 );
      }
  }
  
  if( tiempoGol == 0 ){
      estado = "gol";
      goal = true;
      tiempoGol = 50;
      tiempoGola = false;
    }
  
  if( estado.equals("gol") && goal == true ){
    p.setVelocity( 0, 0 );
    p.inicializar(width/2, height/2 );
    p1.inicializar(100,height/2);
    p2.inicializar(width-100,height/2);
    goal = false;
  }
  
  
    
  text( gol, 100, 100 );
  text( gol1, width-100, 100 );
  
  mundo.step();
  mundo.draw();
  
  }
  
  if( estado.equals("fin") ){
    background( 0 );
    text( "Fin", width/2, height/2);
    text( "Presiona R para reiniciar", width/2, height/2+50);
    gol = 0;
    gol1 = 0;
    p.setVelocity( 0, 0 );
    //circulo.adjustPosition( cx,cy );
    p.inicializar(width/2, height/2 );
    p.setStatic(true);
    p1.inicializar(100,height/2);
    p2.inicializar(width-100,height/2);
    
    if( key == 'r' && estado.equals("fin") ){
      estado = "inicio";
    }
  }
  
  
}

void contactStarted( FContact c){
  FBody f1 = c.getBody1();
  FBody f2 = c.getBody2();
  
  println( "c1 : " + f1.getName() );
  println( "c2 : " + f2.getName() );
  println( "tiempo de gol" + tiempoGol );
  
  
  
  if( f1.getName() == "circulo" && f2.getName() == "arco1" || f1.getName() == "arco1" && f2.getName() == "circulo" ){
    gol1 ++;
    tiempoGola = true;
  } 
  
  if( f1.getName() == "circulo" && f2.getName() == "arco2" || f1.getName() == "arco2" && f2.getName() == "circulo" ){
    gol ++;
    tiempoGola = true;
  } 
  
  if( gol == 3 || gol1 == 3 ){
    estado = "fin";
  }
    
  
}

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
