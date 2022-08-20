class Villano extends FBox{
  
  boolean unPress, upPress, derPress, izqPress;
  float velocidad;
  
  Villano( float x_, float h_){
    super( x_, h_ );
    setDensity(10);
  }
  
  void inicializar( float x_, float y_ ){    
    
    velocidad = 500;
    
    unPress = false;
    upPress = false;
    derPress = false;
    izqPress = false;
    
    setName( "Personaje" );
    setPosition( x_, y_ );
    //setDamping(1);
    setRestitution(1);
    //setFriction(0);
    setRotatable(false);
  }
  
  void actualizar(){
    if( upPress ){
      setVelocity( getVelocityX(), -velocidad );
    }
    if( unPress ){
      setVelocity( getVelocityX(), velocidad );
    }
    if( derPress ){
      setVelocity( velocidad, getVelocityY() );
    }
    if( izqPress ){
      setVelocity( -velocidad, getVelocityY() );
    }
    
    if( !upPress && !unPress && !derPress && !izqPress  ){
      setVelocity( 0, 0 );
    }
    
  }
  
  

}
