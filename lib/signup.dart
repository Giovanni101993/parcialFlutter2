import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parcial_moviles/constant.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parcial_moviles/dashboard.dart';

class SignUp extends StatelessWidget{
  const SignUp({Key?key}):super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUppage(),
    ) ;
  }
}

class SignUppage extends StatefulWidget{
  const SignUppage({super.key});
  @override
  State<SignUppage> createState() => _SignUppageState();
}

class _SignUppageState extends State<SignUppage>{
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  bool showPassword = false;

  Future register() async{
    var url = Uri.http(Constants().ip,'/bd_flutter/register.php',{'q':'{http}'});
    var response = await http.post(url, body:{
      "name": name.text.toString(),
      "email": email.text.toString(),
      "phone": phone.text.toString(),
      "password": password.text.toString()
    });
    var data = jsonDecode(response.body);
    if(data=="Error"){
      Fluttertoast.showToast(
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        msg: "El usuario ya existe",
        toastLength: Toast.LENGTH_SHORT
      );
    }else{
      Fluttertoast.showToast(
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        msg: "Registro exitoso",
        toastLength: Toast.LENGTH_SHORT
        );
        Navigator.push(
          context,MaterialPageRoute(builder: (context)=>DashBoard())
        );
    }
  } 

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.black87,
              Colors.black       
            ])
          ), 
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40,),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 30),
                    child: Text("Registro", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 60),),
                      ),
                      const SizedBox(width: 20,),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80).copyWith(
                              topRight: const Radius.circular(0),
                              bottomLeft: const Radius.circular(0),
                            ),
                            gradient: const LinearGradient(colors: [Colors.blue,Colors.greenAccent]),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(20).copyWith(right: 0, top: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80).copyWith(
                                topRight: const Radius.circular(0),
                                bottomLeft: const Radius.circular(0)
                              ),
                              gradient: const LinearGradient(colors: [Colors.green, Colors.cyanAccent]),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(20).copyWith(right: 0, top: 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80).copyWith(
                                  topRight: const Radius.circular(0),
                                  bottomLeft: const Radius.circular(0),
                                ),
                                gradient: const LinearGradient(colors: [Colors.deepPurple, Colors.purpleAccent])
                              ),
                            ),
                          ),
                        ),
                      )
                ],
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 320,
                  height: 320,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [

                        //NOMBRE
                        TextField(
                          controller: name,
                          style: const TextStyle(
                            color: Colors.white, fontSize: 15,
                          ),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                            hintText: 'Ingrese su nombre',
                            hintStyle: TextStyle(
                              color: Colors.white, fontSize: 15
                            ),
                            prefixIconConstraints: BoxConstraints(maxHeight: 10),
                            prefixIcon: Padding(
                                padding: EdgeInsets.only(right: 10),
                              child: Icon(Icons.person, color: Colors.white, size: 20,),
                            ),
                            contentPadding: EdgeInsets.only(top: 14, right: 10),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white, width: .2
                              )
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white, width: .2
                              ),
                            )
                          ),
                        ),
                        const SizedBox(
                        height: 10,
                        ),

                        //EMAIL
                        TextField(
                          controller: email,
                          style: const TextStyle(
                            color: Colors.white, fontSize: 15,
                          ),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                            hintText: 'Ingrese su email',
                            hintStyle: TextStyle(
                              color: Colors.white, fontSize: 15
                            ),
                            prefixIconConstraints: BoxConstraints(maxHeight: 10),
                            prefixIcon: Padding(
                                padding: EdgeInsets.only(right: 10),
                              child: Icon(Icons.email, color: Colors.white, size: 20,),
                            ),
                            contentPadding: EdgeInsets.only(top: 14, right: 10),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white, width: .2
                              )
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white, width: .2
                              ),
                            )
                          ),
                        ),
                        const SizedBox(
                        height: 10,
                        ),

                        //PHONE
                        TextField(
                          controller: phone,
                          style: const TextStyle(
                            color: Colors.white, fontSize: 15,
                          ),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                            hintText: 'Ingrese su celular',
                            hintStyle: TextStyle(
                              color: Colors.white, fontSize: 15
                            ),
                            prefixIconConstraints: BoxConstraints(maxHeight: 10),
                            prefixIcon: Padding(
                                padding: EdgeInsets.only(right: 10),
                              child: Icon(Icons.android, color: Colors.white, size: 20,),
                            ),
                            contentPadding: EdgeInsets.only(top: 14, right: 10),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white, width: .2
                              )
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white, width: .2
                              ),
                            )
                          ),
                        ),
                        const SizedBox(
                        height: 10,
                        ),

                        //PASSWORD
                        TextField(
                          controller: password,
                          style: const TextStyle(
                            color: Colors.white, fontSize: 15
                          ),
                          cursorColor: Colors.white,
                          obscureText: showPassword?false:true,
                          decoration: InputDecoration(
                            hintText: 'Ingrese la contraseña',
                            hintStyle: const TextStyle(
                              color: Colors.white, fontSize: 15
                            ),
                            contentPadding: const EdgeInsets.only(top: 14, right: 10),
                            prefixIconConstraints: const BoxConstraints(
                              maxHeight: 10
                            ),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(Icons.lock,color: Colors.white,size: 19,),
                            ),
                            suffixIconConstraints: const BoxConstraints(
                              maxHeight: 10
                            ),
                            suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Icon(
                                  showPassword
                                  ? Icons.visibility
                                      : Icons.visibility_off
                                color: Colors.white70,
                                size: 20,
                                ),
                              ),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white, width: .2
                              )
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white, width: .2
                              )
                            )
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                      //BOTON DE REGISTRO
                      GestureDetector(
                        onTap: register,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50).copyWith(
                              topRight: const Radius.circular(0)
                            ),
                            gradient: const LinearGradient(colors: [
                              Colors.deepPurpleAccent,
                              Colors.greenAccent
                            ])
                          ),
                          child: Text(
                            'Registrar',
                            style: TextStyle(
                              color: Colors.white.withOpacity(.8),
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      )
                      ]
                      ),
                    ),
                )
              ],
            )
            ),
        ),
      )
    );
  }
}

