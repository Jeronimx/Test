class Modular{
  float tam, tam_,vel;
  
  Modular(){
    tam = 300;
    tam_ = 5;
    vel = 5;
  }
  
  void achicar(){
    fill( 255 );
    ellipse( width/2, height/2, tam, tam );
    tam = tam-vel;
    if( tam <= 0 ){
      tam = 300;
      tam = tam-vel;
      }
  }

void agrandar(){
    fill( 255 );
    ellipse( width/2, height/2, tam_, tam_ );
    tam_ = tam_+vel;
    if( tam_ >= 300 ){
      tam_ = 5;
      tam_ = tam_+vel;
      } 
  }

}
