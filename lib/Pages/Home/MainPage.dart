import 'package:flutter/material.dart';
import 'package:lotto/Pages/Baccarat/Bacara.dart';
import 'package:lotto/Pages/Hilo/hilo.dart';
import 'package:lotto/userpass/user.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _user = user();
  int balance=0;
  String name =user().name1;
  void _deposit(){
    int credit = 7000;
    if(credit!=null){
      int ?monney =_user.Setcredit1(credit);
      setState(() {
        balance =_user.Getcredit1();
      });
    }
  }

  void _withdraw(){
    setState(() {
      balance=0;
    });
  }
  void _refresh(){
    setState(() {
      balance =_user.Getcredit1();
    });
  }
  /*void _Lotto(){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context)=>const LottoPage()
        )
    );
  }*/
  void _Hilo(){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context)=>const HiloPage()
        )
    );
  }
  void _Casino(){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context)=>const BacaraPage()
        )
    );
  }
  void initState() {
    super.initState();
    setState(() {
      balance =_user.Getcredit1();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ยินดีต้อนรับเข้าสู่ CASINO GAME'),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(Icons.currency_bitcoin,color: Colors.yellow,size: 50.0,),
                      Row(
                        children: [
                          Text('CASINO',style: new TextStyle(fontSize: 30.0,color: Colors.red,fontWeight: FontWeight.bold),),
                          Text('GAME',style: new TextStyle(fontSize: 30.0,color: Colors.white,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child:
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.redAccent,
                    ),
                    child:Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10.0,height: 10.0,),
                            Icon(Icons.account_balance_wallet_rounded ,color: Colors.yellow,),
                            SizedBox(width: 10.0,height: 10.0,),
                            Text('เงินคงเหลือ',style: new TextStyle(color: Colors.yellow,fontSize: 20.0,fontWeight: FontWeight.bold),),
                            SizedBox(width: 10.0,height: 10.0,),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 40.0,height: 10.0,),
                            Text('$balance',style: new TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),),
                            SizedBox(width: 10.0,height: 10.0,),
                            //ElevatedButton(onPressed: _refresh, child: Icon(Icons.refresh)),
                            SizedBox(width: 10.0,height: 10.0,),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10.0,height: 10.0,),
                            Icon(Icons.account_box ,color: Colors.yellow,),
                            SizedBox(width: 10.0,height: 10.0,),
                            Text('$name',style: new TextStyle(color: Colors.yellow,fontSize: 20.0,fontWeight: FontWeight.bold),),
                            SizedBox(width: 10.0,height: 10.0,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:const EdgeInsets.all(3.0),
                      child: ElevatedButton(
                        onPressed: _deposit,
                        style: ElevatedButton.styleFrom(
                          primary:Colors.green,
                          minimumSize: Size(0,55),
                        ),
                        child: Text('ฝากเงิน',style: new TextStyle(fontSize: 20.0),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:const EdgeInsets.all(3.0),
                      child: ElevatedButton(
                        onPressed: _withdraw,
                        style: ElevatedButton.styleFrom(
                          primary:Colors.lightBlue,
                          minimumSize: Size(0,55),
                        ),
                        child: Text('ถอนเงิน',style: new TextStyle(fontSize: 20.0),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child:
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.grey,
                    ),

                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: _Casino,
                                style: ElevatedButton.styleFrom(
                                  primary:Colors.white,
                                  minimumSize: Size(0,55),
                                ),
                                child:Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Icon(Icons.money,color: Colors.red,),
                                      Text('ไพ่',style: new TextStyle(fontSize: 20.0,color: Colors.red),),
                                    ],
                                  ),
                                ) ,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: _Hilo,
                                style: ElevatedButton.styleFrom(
                                  primary:Colors.white,
                                  minimumSize: Size(0,55),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Icon(Icons.casino ,color: Colors.red,),
                                      Text('ไฮโล',style: new TextStyle(fontSize: 20.0,color: Colors.red),),
                                    ],
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
