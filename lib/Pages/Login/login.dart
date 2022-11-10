import 'package:flutter/material.dart';
import 'package:lotto/Pages/Home/MainPage.dart';
import 'package:lotto/userpass/user.dart';
import 'package:lotto/utils/helper.dart';


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _nametext = TextEditingController();
  final _passtext = TextEditingController();
  var name = '';
  var pass = '';
  //var credit;
  final _user = user();
  final _formKey = GlobalKey<FormState>();
  void handleClikLogin(){
     print('เข้าสู่ระบบ');
     print(_nametext.text);
     print(_passtext.text);
     name = _nametext.text;
     pass = _passtext.text;


     var info = _user.user1(name,pass);
     if (_formKey.currentState!.validate()) { //หากผ่าน
       // แสดงข้อความจำลอง ใน snackbar
       ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(content: Text('กำลังประมวลผลข้อมูล')
         ),
       );
     }
     if(name == ''){
       print('Input name ERROR!!');
       setState((){
         name ='';
       });
     }else if(info == 1){
       print('correct');
       Navigator.pushReplacement(
           context,
           MaterialPageRoute(builder: (context)=>const MainPage()
           )
       );
     }else if(info == 0){
       print('uncorrect');
       showMyDialog(context, 'เข้าสู่ระบบไม่สำเร็จ', 'ชื่อผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง');
       setState((){
         name ='';
         pass ='';
       });
     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOTTO RUAY'),
    ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
        ),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: 30.0,),
                Row(
                  children: [
                    Text('LOTTO',style: new TextStyle(fontSize: 30.0,color: Colors.black,fontWeight: FontWeight.bold),),
                    Text('RUAY',style: new TextStyle(fontSize: 30.0,color: Colors.red,fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: [
                        Form(
                          key: _formKey,
                          child:Column(
                            children: [
                              SizedBox(
                                width: 500,
                                child:
                                TextFormField(
                                  validator: (name) {
                                    if (name == null || name.isEmpty) {
                                      return 'โปรดระบุชื่อผู้ใช้งาน';
                                    }
                                    return null;
                                  },
                                  controller: _nametext,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'ชื่อผู้ใช้',
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0,),
                              SizedBox(
                                width: 500,
                                child:
                                TextFormField(
                                  validator: (pass) {
                                    if (pass == null ||pass.isEmpty) {
                                      return 'โปรดระบุรหัสผ่าน';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  controller: _passtext,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'รหัสผ่าน',
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0,),
                              Row(
                                children: [
                                  ElevatedButton(
                                      onPressed: handleClikLogin,
                                      child: Text('เข้าสู่ระบบ')
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
