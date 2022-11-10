import 'dart:math';
class user{
    var name1 = 'you';
    var pass1 = '12345';
    static var money1=0;

  user1(var name , var pass){
    if(name == name1 && pass == pass1){
      return 1;
    }else{
      return 0;
    }
  }

  Setcredit1(int balance){
    money1= balance;
  }
  Getcredit1(){
    //print('$money1');
    return money1;
  }





}