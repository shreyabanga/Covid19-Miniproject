import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'auth.dart';

class Login extends StatefulWidget {

   @override
  LoginState createState() => LoginState();

}

class LoginState extends State<Login> {
  String isLoggedIn = "false";
  String userName="";
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Covid-19 Tracker',
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              //color: Color(0xFFF2F3F8),
              width: double.infinity,
              height:double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.yellow[700], Colors.redAccent]
                )),
            ),
            
               Positioned(
                 
                 top:100,
                 left:40,
                 
                 child: Text(
                  'Covid-19 Tracker',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0, 1.0),
                        blurRadius: 2.0,
                        color: Colors.yellow[200],
                      )
                    ]
                  )
              ),
               ),

               Positioned(
                 
                 top:300,
                 left:40,
                 
                 child: Text(
                  'Login to continue:',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'OpenSans',
                  )
              ),
               ),

               Positioned(
                 top:350,
                 left:20,
                    child: Container(
                    width: 370,
                    height: 600,
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color:Color(0xFF3A5160).withOpacity(0.2),
                          offset: Offset(1.1,1.1),
                          blurRadius: 100
                        ),
                        
                      ]
                      
                      
                      ), ),
               ),
            
              Center(
                // top:400,
                // right:100,
                // child: Container(
                //   width: 350,
                //   height: 300,
                //   decoration: BoxDecoration(
                //     color: Color.fromRGBO(253, 253, 253, 1),
                //     borderRadius: BorderRadius.circular(8),
                //     boxShadow: <BoxShadow>[
                //       BoxShadow(
                //         color:Color(0xFF3A5160).withOpacity(0.2),
                //         offset: Offset(1.1,1.1),
                //         blurRadius: 100
                //       ),
                      
                //     ]
                    
                    
                //     ), 
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                  SignInButton(
                    
                    Buttons.Google,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0))),
                    text: "Log in with Google",
                    onPressed: () async{
                      userName = await signInWithGoogle();
                    }),

                  SignInButton(
                    Buttons.Facebook,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0))),
                    text: "Log in with Facebook",
                    onPressed: () async{
                  
                    })
                    
                ],)
                
                
                
                
                

                
              ),
            

            
          ]
        
            
            
            
          ),
      ),
    );
  }
}