class Loading{
  color green = color( 0,255,0 );
  color white = color( 255 );
  color col1,col2,col3;
  float time, x, y, tam;
  float tam1, tam2;
  
  Loading(){
    time = 0;
    x = width/2;
    y = height/2;
    tam = 50;
    tam1 = 50;
    tam2 = 50;
    col1 = 255;
    col2 = 255;
    col3 = 255;
  }
  
  void display(){
    if( time > 0 && time < 50 ){ col1 = green; tam = 70; } else if( time > 50 ){ col1 = white; tam = 50; }
    if( time > 50 && time < 100 ){ col2 = green; tam1 = 70; } else if( time > 100 ){ col2 = white; tam1 = 50; }
    if( time > 100 && time < 150 ){ col3 = green; tam2 = 70; } else if( time > 150 ){ col3 = white; tam2 = 50; }
    if( time > 150 ){ time = 0; time++; }
    
    Circulo( x-100, y, tam, col1 );
    Circulo( x, y, tam1, col2 );
    Circulo( x+100, y, tam2, col3 );
    
    time ++;
    println( time );
  }
  
  void Circulo( float x, float y, float tambo, color col ){
  fill( col );
  ellipse( x,y,tambo,tambo );
}

}
