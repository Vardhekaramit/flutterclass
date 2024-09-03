import 'package:demo_widget/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController user = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController repass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Sign up ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 15,
                ),
                Text("Create your account",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black, ), ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: user,
                      decoration: InputDecoration(
                        fillColor: Colors.purple.shade50,
                          filled: true,
                          hintText: "Username",
                          contentPadding: EdgeInsets.symmetric(vertical: 18),
                        prefixIcon: Icon(Icons.person),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                          borderSide: BorderSide(color: Colors.red),
                        )

                      ),
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                          fillColor: Colors.purple.shade50,
                          contentPadding: EdgeInsets.symmetric(vertical: 18),
                          filled: true,
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide(color: Colors.red),
                          )

                      ),
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(

                      controller: pass,
                      decoration: InputDecoration(
                          fillColor: Colors.purple.shade50,
                          filled: true,
                          hintText: "Password",
                          contentPadding: EdgeInsets.symmetric(vertical: 18),
                          prefixIcon: Icon(Icons.password),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide(color: Colors.red),
                          )

                      ),
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(

                      controller: repass,
                      decoration: InputDecoration(
                        filled: true,
                          fillColor: Colors.purple.shade50,
                          hintText: "Confirm password",
                          contentPadding: EdgeInsets.symmetric(vertical: 18),
                          prefixIcon: Icon(Icons.password),
                           enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(21),
                             borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                             borderSide: BorderSide(color: Colors.red),
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Container(
                  height: 60,
                  width: 330,

                  child: ElevatedButton(onPressed: ()
                  {},style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,

                  ), child: Text("Sign up", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19, color: Colors.white),)),
                ),
                SizedBox(
                  height:35 ,
                ),
                Text("Or"),
                SizedBox(
                  height: 35,
                ),
                Container(
                    height:50 ,
                    width: 325,

                    child: TextButton(onPressed: (){},
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21),
                            side: BorderSide(color: Colors.purple)
                          ),
                        ),

                        child:
                        Text("Sign in with Google", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w600, fontSize: 15 ),))),
                SizedBox(
                  height: 50
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.purple,
                    ),
                    children: [
                      TextSpan(text: "Already have account?   ",style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black) ),
                      TextSpan(text: "Login ", recognizer: TapGestureRecognizer() ..onTap =(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
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
    );
  }
}
