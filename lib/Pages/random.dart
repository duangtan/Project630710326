import 'dart:math';

class Game {
  static const defaultMaxRandom = 13;
  int? _cardP1;
  int? _cardP2;
  //int? _cardP3;
  int? _cardB1;
  int? _cardB2;
  //int? _cardB3;
  int? resultP;
  int? resultB;
  var r = Random();
  int maxRandom = defaultMaxRandom;


  CP1(){
  _cardP1 = r.nextInt(maxRandom) + 1;
  return _cardP1;
  }
  CP2(){
  _cardP2 = r.nextInt(maxRandom) + 1;
  return _cardP2;
  }
  /*CP3(){
  _cardP3 = r.nextInt(maxRandom) + 1;
  return _cardP3;
  }*/
  CB1(){
  _cardB1 = r.nextInt(maxRandom) + 1;
  return _cardB1;
  }CB2(){
  _cardB2 = r.nextInt(maxRandom) + 1;
  return _cardB2;
  }
  /*CB3(){
  _cardB3 = r.nextInt(maxRandom) + 1;
  return _cardB3;
  }*/

}

class randomHilo{
  static const defaultMaxRandom = 6;
  int? _Hilo1=0;
  int? _Hilo2=0;
  int? _Hilo3=0;
  var r = Random();
  int maxRandom = defaultMaxRandom;
  H1(){
    _Hilo1 = r.nextInt(maxRandom) + 1;
    return _Hilo1;
  }
  H2(){
    _Hilo2 = r.nextInt(maxRandom) + 1;
    return _Hilo2;
  }
  H3(){
    _Hilo3 = r.nextInt(maxRandom) + 1;
    return _Hilo3;
  }
}