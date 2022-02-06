import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
Juego juego;
void setup(){
  minim = new Minim(this);
  imageMode( CENTER );
  textAlign( CENTER );
  size( 800,600 );
  juego = new Juego(this);
}

void draw(){
  juego.actualizarJuego();
  juego.dibujarJuego();
  juego.puntos();
}

void keyPressed(){
  juego.tecleoJuego();
}
