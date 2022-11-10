import 'package:flutter/material.dart';
import 'package:lotto/Pages/Home/MainPage.dart';
import 'package:lotto/Pages/random.dart';
import 'package:lotto/userpass/user.dart';
import 'package:lotto/utils/helper.dart';
import 'package:lotto/utils/helper_rule.dart';

class BacaraPage extends StatefulWidget {
  const BacaraPage({Key? key}) : super(key: key);

  @override
  State<BacaraPage> createState() => _BacaraPageState();
}

class _BacaraPageState extends State<BacaraPage> {
  var _user = user();
  var _inputP = TextEditingController();
  final _inputT = TextEditingController();
  final _inputB = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var winP =false;
  var winB =false;
  var winT =false;
  int balance =user().Getcredit1();
  
  var _card = Game();

  int resultP =0;
  int resultB =0;

  var _cardP1;
  int _cardPlayer1=0;

  var _cardP2;
  int _cardPlayer2=0;

  var _cardB1;
  int _cardBanker1=0;

  var _cardB2;
  int _cardBanker2=0;

  //int credit =500;

  void handleClickHome(){
    //balance = _user.Setcredit1(balance);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context)=>const MainPage()
        )
    );
  }
  void Rule(){
    showRule(context, 'วิธีการเล่นบาคาร่าไพ่ 2 ใบ',
        '1.ผู้เล่นวางเดิมพันอย่างน้อยหนึ่งรายการในผลลัพธ์ที่เป็นไปได้',
        '2.แจกไพ่สองใบให้ผู้เล่นแต่ละฝั่ง ผู้เล่นที่มีแต้มสูงสุดจะเป็นผู้ชนะ',
        '3.ลงเดิมพันฝั่ง Player หรือ Banker ถ้าชนะจะได้เงิน x1 ถ้าลงเสมอจะได้เงิน x5');
  }
  void Confirm(){

    var _cardP1 = _card.CP1();
    var _cardP2 = _card.CP2();
    setState(() {
      _cardPlayer1 = _cardP1;
    });
    setState(() {
      _cardPlayer2 = _cardP2;
    });
    //print(_cardPlayer1);
    //print(_cardPlayer2);
    if(_cardPlayer1>=10&&_cardPlayer2>=10){
      resultP = 0;
    }else if(_cardPlayer1>=10){
      resultP = _cardPlayer2;
    }else if(_cardPlayer2>=10){
      resultP = _cardPlayer1;
    }else if(_cardPlayer1 <10 &&_cardPlayer2<10){
      resultP = _cardPlayer1+_cardPlayer2;
      if(resultP>=10){
        resultP=resultP-10;
      }
    }setState(() {
      resultP;
    });

    var _cardB1 = _card.CB1();
    var _cardB2 = _card.CB2();
    setState(() {
      _cardBanker1 = _cardB1;
    });
    setState(() {
      _cardBanker2 = _cardB2;
    });
    //print(_cardBanker1);
    //print(_cardBanker2);
    if(_cardBanker1>=10&&_cardBanker2>=10){
      resultB = 0;
    }else if(_cardBanker1>=10){
      resultB = _cardBanker2;
    }else if(_cardBanker2>=10){
      resultB = _cardBanker1;
    }else if(_cardBanker1 <10 &&_cardBanker2<10){
      resultB = _cardBanker1+_cardBanker2;
      if(resultB>=10){
        resultB=resultB-10;
      }
    }setState(() {
      resultB;
    });

    if(resultP>resultB){
      winP =true;
    }if(resultB>resultP){
      winB =true;
    }if(resultB==resultP){
      winT =true;
    }

    var quantityP = int.tryParse(_inputP.text);
    var quantityT = int.tryParse(_inputT.text);
    var quantityB = int.tryParse(_inputB.text);
    int sumqt=0;

    if(quantityP==null &&quantityB==null&&quantityT==null){
      showMyDialog(context, 'ไม่สามารถลงเดิมพันได้', 'กรุณากรอกตัวเลข');
    }
    if(quantityB !=null && quantityP!= null){
      showMyDialog(context, 'ไม่สามารถลงเดิมพันฝั่ง PLAYER พร้อมกับ BANKER', 'กรุณาลงเดิมพันใหม่');
      balance =balance;
    }else if(quantityP!=null && quantityT!=null){
      sumqt = quantityT+quantityP;
      if(balance<sumqt){
        showMyDialog(context, 'ไม่สามารถลงเดิมพันได้', 'เงินคงเหลือไม่เพียงพอ');
        balance =balance;
      }else{
        if(winP==true){
          balance = balance+quantityP-quantityT;
        }
        if(winT==true){
          balance = balance + (quantityT*5) ;
        }
        if(winB==true){
          balance = balance - quantityT - quantityP;
        }
      }
    }else if(quantityB!=null && quantityT!=null){
      sumqt = quantityT+quantityB;
      if(balance<sumqt){
        showMyDialog(context, 'ไม่สามารถลงเดิมพันได้', 'เงินคงเหลือไม่เพียงพอ');
        balance =balance;
      }else{
        if(winP==true){
          balance = balance - quantityT - quantityB;
        }
        if(winT==true){
          balance = balance + (quantityT*5) ;
        }
        if(winB==true){
          balance = balance+quantityB-quantityT;
        }
      }
    }
    else if(quantityP!=null){
      sumqt = quantityP;
      if(balance<sumqt){
        showMyDialog(context, 'ไม่สามารถลงเดิมพันได้', 'เงินคงเหลือไม่เพียงพอ');
        balance =balance;
      }else{
        if(winP==true){
          balance = balance+quantityP;
        }
        if(winT==true){
          balance = balance;
        }
        if(winB==true){
          balance = balance-quantityP;
        }
      }
    }else if(quantityT!=null){
      sumqt = quantityT;
      if(balance<sumqt){
        showMyDialog(context, 'ไม่สามารถลงเดิมพันได้', 'เงินคงเหลือไม่เพียงพอ');
        balance =balance;
      }else{
        if(winP==true){
          balance = balance-quantityT;
        }
        if(winT==true){
          balance = balance+(quantityT*5);
        }
        if(winB==true){
          balance = balance-quantityT;
        }
      }
    }else if(quantityB!=null){
      sumqt = quantityB;
      if(balance<sumqt){
        showMyDialog(context, 'ไม่สามารถลงเดิมพันได้', 'เงินคงเหลือไม่เพียงพอ');
        balance =balance;
      }else{
        if(winP==true){
          balance = balance-quantityB;
        }
        if(winT==true){
          balance = balance;
        }
        if(winB==true){
          balance = balance+quantityB;
        }
      }
    }
    setState(() {
      balance;
    });
    winP=false;
    winB=false;
    winT=false;

  var credit =_user.Setcredit1(balance);
  balance = _user.Getcredit1();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CASINO GAME'),),
      //backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: handleClickHome,
                  style: ElevatedButton.styleFrom(
                    primary:Colors.white,
                    //minimumSize: Size(0,55),
                  ),
                  child:Row(
                    children: [
                      Icon(Icons.home,color: Colors.black,),
                      Text('หน้าหลัก',style: TextStyle(color: Colors.black),),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: Rule,
                  child: const Text('วิธีเล่น'),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(child:
              Container(
                color: Colors.yellow,height: 25,
                child:Row(
                  children: [
                    Icon(Icons.account_balance_wallet),
                    Text("เงินคงเหลือ : $balance",style: new TextStyle(fontSize: 20.0),)
                  ],
                ),
              ),
              ),
            ],
          ),
          SizedBox(height: 50.0,),

          Expanded(
            child: Container(
              color: Colors.black12,
              child:
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('PLAYER',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Color(0xFF0000A0)),),
                        Text('$resultP',style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold,color: Color(0xFF0000A0)),),
                        Row(
                          children: [
                            if(_cardPlayer1==1) Image.asset('assets/images/1.png',height: 100.0,),
                            if(_cardPlayer1==2) Image.asset('assets/images/2.png',height: 100.0,),
                            if(_cardPlayer1==3) Image.asset('assets/images/3.png',height: 100.0,),
                            if(_cardPlayer1==4) Image.asset('assets/images/4.png',height: 100.0,),
                            if(_cardPlayer1==5) Image.asset('assets/images/5.png',height: 100.0,),
                            if(_cardPlayer1==6) Image.asset('assets/images/6.png',height: 100.0,),
                            if(_cardPlayer1==7) Image.asset('assets/images/7.png',height: 100.0,),
                            if(_cardPlayer1==8) Image.asset('assets/images/8.png',height: 100.0,),
                            if(_cardPlayer1==9) Image.asset('assets/images/9.png',height: 100.0,),
                            if(_cardPlayer1==10) Image.asset('assets/images/10.png',height: 100.0,),
                            if(_cardPlayer1==11) Image.asset('assets/images/11.png',height: 100.0,),
                            if(_cardPlayer1==12) Image.asset('assets/images/12.png',height: 100.0,),
                            if(_cardPlayer1==13) Image.asset('assets/images/13.png',height: 100.0,),
                            //Text('$_cardPlayer1'),

                            SizedBox(width: 30.0,),
                           // if(_cardP1>=1&&_cardP1<5)
                            if(_cardPlayer2==1) Image.asset('assets/images/1.png',height: 100.0,),
                            if(_cardPlayer2==2) Image.asset('assets/images/2.png',height: 100.0,),
                            if(_cardPlayer2==3) Image.asset('assets/images/3.png',height: 100.0,),
                            if(_cardPlayer2==4) Image.asset('assets/images/4.png',height: 100.0,),
                            if(_cardPlayer2==5) Image.asset('assets/images/5.png',height: 100.0,),
                            if(_cardPlayer2==6) Image.asset('assets/images/6.png',height: 100.0,),
                            if(_cardPlayer2==7) Image.asset('assets/images/7.png',height: 100.0,),
                            if(_cardPlayer2==8) Image.asset('assets/images/8.png',height: 100.0,),
                            if(_cardPlayer2==9) Image.asset('assets/images/9.png',height: 100.0,),
                            if(_cardPlayer2==10) Image.asset('assets/images/10.png',height: 100.0,),
                            if(_cardPlayer2==11) Image.asset('assets/images/11.png',height: 100.0,),
                            if(_cardPlayer2==12) Image.asset('assets/images/12.png',height: 100.0,),
                            if(_cardPlayer2==13) Image.asset('assets/images/13.png',height: 100.0,),
                          ],
                        ),
                        SizedBox(height: 70,)
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(child: Container(color: Colors.black,height: 5.0,width: 5.0,)),
                      ],
                    ),
                    Column(
                      children: [
                        Text('BANKER',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Color(0xFFA00000)),),
                        Text('$resultB',style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold,color: Color(0xFFA00000)),),
                        Row(
                          children: [
                            if(_cardBanker1==1)Image.asset('assets/images/1.png',height: 100.0,),
                            if(_cardBanker1==2)Image.asset('assets/images/2.png',height: 100.0,),
                            if(_cardBanker1==3)Image.asset('assets/images/3.png',height: 100.0,),
                            if(_cardBanker1==4)Image.asset('assets/images/4.png',height: 100.0,),
                            if(_cardBanker1==5)Image.asset('assets/images/5.png',height: 100.0,),
                            if(_cardBanker1==6)Image.asset('assets/images/6.png',height: 100.0,),
                            if(_cardBanker1==7)Image.asset('assets/images/7.png',height: 100.0,),
                            if(_cardBanker1==8)Image.asset('assets/images/8.png',height: 100.0,),
                            if(_cardBanker1==9)Image.asset('assets/images/9.png',height: 100.0,),
                            if(_cardBanker1==10)Image.asset('assets/images/10.png',height: 100.0,),
                            if(_cardBanker1==11)Image.asset('assets/images/11.png',height: 100.0,),
                            if(_cardBanker1==12)Image.asset('assets/images/12.png',height: 100.0,),
                            if(_cardBanker1==13)Image.asset('assets/images/13.png',height: 100.0,),
                            SizedBox(width: 30.0,),

                            if(_cardBanker2==1)Image.asset('assets/images/1.png',height: 100.0,),
                            if(_cardBanker2==2)Image.asset('assets/images/2.png',height: 100.0,),
                            if(_cardBanker2==3)Image.asset('assets/images/3.png',height: 100.0,),
                            if(_cardBanker2==4)Image.asset('assets/images/4.png',height: 100.0,),
                            if(_cardBanker2==5)Image.asset('assets/images/5.png',height: 100.0,),
                            if(_cardBanker2==6)Image.asset('assets/images/6.png',height: 100.0,),
                            if(_cardBanker2==7)Image.asset('assets/images/7.png',height: 100.0,),
                            if(_cardBanker2==8)Image.asset('assets/images/8.png',height: 100.0,),
                            if(_cardBanker2==9)Image.asset('assets/images/9.png',height: 100.0,),
                            if(_cardBanker2==10)Image.asset('assets/images/10.png',height: 100.0,),
                            if(_cardBanker2==11)Image.asset('assets/images/11.png',height: 100.0,),
                            if(_cardBanker2==12)Image.asset('assets/images/12.png',height: 100.0,),
                            if(_cardBanker2==13)Image.asset('assets/images/13.png',height: 100.0,),
                          ],
                        ),
                        SizedBox(height: 70,)
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _inputP,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Price',
                  )
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _inputT,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Price',
                  )
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _inputB,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Price',
                  )
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(child: Container(alignment:Alignment.center,color: Color(0xFF0000A0),child: Text('PLAYER',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 50.0),),)),
              Expanded(child: Container(alignment:Alignment.center,color: Colors.green,child: Text('TIE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 50.0),),)),
              Expanded(child: Container(alignment:Alignment.center,color: Color(0xFFA00000),child: Text('BANKER',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 50.0),),)),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: Confirm,
                style: ElevatedButton.styleFrom(
                      primary:Color(0xFF000000),
                ),
                  child: Text('Confirm',style: TextStyle(fontSize: 30),))
            ],
          ),
          SizedBox(height: 20,),

        ],
      ),
    );
  }
}
