import 'package:flutter/material.dart';
import 'package:lotto/Pages/random.dart';
import 'package:lotto/userpass/user.dart';
import 'package:lotto/utils/helper.dart';
import 'package:lotto/utils/helper_rule.dart';

import '../Home/MainPage.dart';

class HiloPage extends StatefulWidget {
  const HiloPage({Key? key}) : super(key: key);

  @override
  State<HiloPage> createState() => _HiloPageState();
}

class _HiloPageState extends State<HiloPage> {
  var _user = user();
  int balance =user().Getcredit1();
  var _dice = randomHilo();
  var _dice1 = 0;
  var _dice2 = 0;
  var _dice3 = 0;
  var _sumdice =0;
  var result = '';
  final _formKey = GlobalKey<FormState>();

  var _input1 = TextEditingController();
  var _input2 = TextEditingController();
  var _input3 = TextEditingController();
  var _input4 = TextEditingController();
  var _input5 = TextEditingController();
  var _input6 = TextEditingController();
  var _input11 = TextEditingController();
  var _inputH = TextEditingController();
  var _inputL = TextEditingController();



  void handleClickHome(){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context)=>const MainPage()
        )
    );
  }

  void Rule(){
    showRule(context, 'วิธีการเล่นไฮโล',
        '- การเลือกแทงแต้ม 1-6 ถ้าหากเต๋า 1 ใน 3 ที่เขย่า ออกแต้มที่แทงเอาไว้ก็จะได้เงิน x1',
        '- แทงสูงต่ำ คือ การเลือกแทงแต้มผลรวมของลูกเต๋า 3 ลูก  หากแต้มรวมระหว่าง 3-10 ก็จะเท่ากับแต้มต่ำ ถ้าหากแต้มรวมระหว่าง 11-18 ก็จะเท่ากับแต้มสูง จะได้เงิน x1',
        '- แทง 11 ไฮโล คือ การเลือกแทงผลแต้มรวมของลูกเต๋า 3 ลูก ถ้าผลรวมของแต้มได้ 11 จะได้เงิน x5');
  }

  void handleRandom(){
    var _Hilo1= _dice.H1();
    var _Hilo2= _dice.H2();
    var _Hilo3= _dice.H3();

    var _IP1 = int.tryParse(_input1.text);
    var _IP2 = int.tryParse(_input2.text);
    var _IP3 = int.tryParse(_input3.text);
    var _IP4 = int.tryParse(_input4.text);
    var _IP5 = int.tryParse(_input5.text);
    var _IP6 = int.tryParse(_input6.text);
    var _IP11 = int.tryParse(_input11.text);
    var _IPH = int.tryParse(_inputH.text);
    var _IPL = int.tryParse(_inputL.text);

    setState(() {
      _dice1 = _Hilo1;
      _dice2 = _Hilo2;
      _dice3 = _Hilo3;
      _sumdice = _dice1+_dice2+_dice3;
      if(_sumdice>=11){
        result = 'สูง';
      }else{
        result = 'ต่ำ';
      }
    });

    if(_IP1==null){setState(() {_IP1 =0;});}
    if(_IP2==null){setState(() {_IP2 =0;});}
    if(_IP3==null){setState(() {_IP3 =0;});}
    if(_IP4==null){setState(() {_IP4 =0;});}
    if(_IP5==null){setState(() {_IP5 =0;});}
    if(_IP6==null){setState(() {_IP6 =0;});}
    if(_IP11==null){setState(() {_IP11 =0;});}
    if(_IPH==null){setState(() {_IPH =0;});}
    if(_IPL==null){setState(() {_IPL =0;});}

    int? sumMoney = _IP1!+_IP2!+_IP3!+_IP4!+_IP5!+_IP6!+_IP11!+_IPH!+_IPL!;
    print(sumMoney);

    if(balance<sumMoney) {
      showMyDialog(context, 'ไม่สามารถลงเดิมพันได้', 'เงินคงเหลือไม่เพียงพอ');
      balance = balance;
    }else{
      if(_IP1 != null){
        if(_dice1 == 1 || _dice2 ==1 || _dice3==1){
          setState(() {
            balance = balance+_IP1!;
          });
        }else{
          setState(() {
            balance = balance - _IP1!;
          });
        }
      }

      if(_IP2 != null) {
        if (_dice1 == 2 || _dice2 == 2 || _dice3 == 2) {
          setState(() {
            balance = balance + (_IP2!);
          });
        }else{
          setState(() {
            balance = balance - _IP2!;
          });
        }
      }

      if(_IP3 != null) {
        if (_dice1 == 3 || _dice2 == 3 || _dice3 == 3) {
          setState(() {
            balance = balance + (_IP3!);
          });
        }else{
          setState(() {
            balance = balance - _IP3!;
          });
        }
      }

      if(_IP4 != null) {
        if (_dice1 == 4 || _dice2 == 4 || _dice3 == 4) {
          setState(() {
            balance = balance + (_IP4!);
          });
        }else{
          setState(() {
            balance = balance - _IP4!;
          });
        }
      }

      if(_IP5 != null) {
        if (_dice1 == 5 || _dice2 == 5 || _dice3 == 5) {
          setState(() {
            balance = balance + (_IP5!);
          });
        }else{
          setState(() {
            balance = balance - _IP5!;
          });
        }
      }

      if(_IP6 != null) {
        if (_dice1 == 6 || _dice2 == 6 || _dice3 == 6) {
          setState(() {
            balance = balance + (_IP6!);
          });
        }else{
          setState(() {
            balance = balance - _IP6!;
          });
        }
      }

      if(_IPH != null) {
        if (_sumdice>=11) {
          setState(() {
            balance = balance + (_IPH!);
          });
        }else{
          setState(() {
            balance = balance - _IPH!;
          });
        }
      }

      if(_IPL != null) {
        if (_sumdice<11) {
          setState(() {
            balance = balance + (_IPL!);
          });
        }else{
          setState(() {
            balance = balance - _IPL!;
          });
        }
      }

      if(_IP11 != null) {
        if (_sumdice==11) {
          setState(() {
            balance = balance + (_IP11!*5);
          });
        }else{
          setState(() {
            balance = balance - _IP11!;
          });
        }
      }
    }
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(_dice1==0)Image.asset('assets/images/hilowait1.png',height: 150,),
              if(_dice1==1)Image.asset('assets/images/hilo1.png',height: 150,),
              if(_dice1==2)Image.asset('assets/images/hilo2.png',height: 150,),
              if(_dice1==3)Image.asset('assets/images/hilo3.png',height: 150,),
              if(_dice1==4)Image.asset('assets/images/hilo4.png',height: 150,),
              if(_dice1==5)Image.asset('assets/images/hilo5.png',height: 150,),
              if(_dice1==6)Image.asset('assets/images/hilo6.png',height: 150,),
              SizedBox(width: 30.0,),
              if(_dice2==0)Image.asset('assets/images/hilowait2.png',height: 150,),
              if(_dice2==1)Image.asset('assets/images/hilo1.png',height: 150,),
              if(_dice2==2)Image.asset('assets/images/hilo2.png',height: 150,),
              if(_dice2==3)Image.asset('assets/images/hilo3.png',height: 150,),
              if(_dice2==4)Image.asset('assets/images/hilo4.png',height: 150,),
              if(_dice2==5)Image.asset('assets/images/hilo5.png',height: 150,),
              if(_dice2==6)Image.asset('assets/images/hilo6.png',height: 150,),
              SizedBox(width: 30.0,),
              if(_dice3==0)Image.asset('assets/images/hilowait3.png',height: 150,),
              if(_dice3==1)Image.asset('assets/images/hilo1.png',height: 150,),
              if(_dice3==2)Image.asset('assets/images/hilo2.png',height: 150,),
              if(_dice3==3)Image.asset('assets/images/hilo3.png',height: 150,),
              if(_dice3==4)Image.asset('assets/images/hilo4.png',height: 150,),
              if(_dice3==5)Image.asset('assets/images/hilo5.png',height: 150,),
              if(_dice3==6)Image.asset('assets/images/hilo6.png',height: 150,),
            ],
          ),SizedBox(height: 30.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(_sumdice!=0)Text('$_sumdice'+' '+'$result',style: TextStyle(fontSize:30,fontWeight: FontWeight.bold),)
            ],
          ),
          SizedBox(height: 30.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: handleRandom,
                style: ElevatedButton.styleFrom(
                  primary:Colors.green,
                  //minimumSize: Size(0,55),
                ),
                child:Column(
                  children: [
                    Icon(Icons.casino,color: Colors.white,),
                    Text('เขย่า',style: TextStyle(color: Colors.white,fontSize: 20),),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(width: 20.0,),
                Text('การเดิมพัน',style: TextStyle(fontSize:20)),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 100.0,),
                      Text('1             x1   ',style: TextStyle(fontSize:20)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                              controller: _input1,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'จำนวนเงินเดิมพัน',
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100.0,),
                      Text('2             x1   ',style: TextStyle(fontSize:20)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                              controller: _input2,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'จำนวนเงินเดิมพัน',
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100.0,),
                      Text('3             x1   ',style: TextStyle(fontSize:20)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                              controller: _input3,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'จำนวนเงินเดิมพัน',
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100.0,),
                      Text('4             x1   ',style: TextStyle(fontSize:20)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                              controller: _input4,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'จำนวนเงินเดิมพัน',
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100.0,),
                      Text('5             x1   ',style: TextStyle(fontSize:20)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                              controller: _input5,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'จำนวนเงินเดิมพัน',
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100.0,),
                      Text('6            x1   ',style: TextStyle(fontSize:20)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                              controller: _input6,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'จำนวนเงินเดิมพัน',
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100.0,),
                      Text('ต่ำ           x1   ',style: TextStyle(fontSize:20)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                              controller: _inputL,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'จำนวนเงินเดิมพัน',
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100.0,),
                      Text('สูง           x1   ',style: TextStyle(fontSize:20)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                              controller: _inputH,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'จำนวนเงินเดิมพัน',
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100.0,),
                      Text('11 ไฮโล   x5   ',style: TextStyle(fontSize:20)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                              controller: _input11,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'จำนวนเงินเดิมพัน',
                              )
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
