double calculateBonus( ) {
  double value=0 ;
  int numberpost=0;
  int numbercomment=1;
  int numbershare=0;
  if(numberpost>0||numbercomment>0||numbershare>0){
    value+=0.5;
  }
  return value ; 
}