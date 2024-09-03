import 'package:demo_widget/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 81),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text("Welcome Back", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),),
                  ),

                  Text("Enter Your credential to login", style: TextStyle(fontWeight: FontWeight.w500,),),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: TextFormField(
                          controller: username,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 25) ,
                            filled: true,
                              fillColor: Colors.purple.shade50,
                              hintText: "Username",
                              prefixIcon: Icon(Icons.person, color: Colors.black26,),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),

                              borderSide: BorderSide(
                                color: Colors.black38,

                              )
                            ),
                             focusedBorder: OutlineInputBorder(

                               borderSide: BorderSide(
                                 color: Colors.blue,
                               ),
                               borderRadius: BorderRadius.circular(21),
                             )
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 1,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 25),
                        hintText: "Password",
                        filled: true,
                        fillColor: Colors.purple.shade50,

                          prefixIcon: Icon(Icons.password, color: Colors.black26, ),
                        enabledBorder: OutlineInputBorder(

                          borderSide: BorderSide(

                            color: Colors.black38,
                          ),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(21),
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    width: 375,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                          ),


                        ),
                           onPressed: (){
                          },
                        child: Text("Login", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600, color: Colors.white),)),
                     ),
                 const SizedBox(
                   height: 100,
                 ),
               const InkWell(

                 child:Text("Forgot password?", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),),
               ),
                  const SizedBox(
                    height: 100,
                  ),
                  RichText(
                      text: TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                      children: [

                      TextSpan(text: "Don't have an account?  ",style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black) ),

                      TextSpan(text: "Sign up", recognizer: TapGestureRecognizer() ..onTap = () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                      }
                       ),
                    ],

                  ),

                  )



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
