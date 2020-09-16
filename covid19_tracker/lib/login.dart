import 'information_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:delayed_display/delayed_display.dart';
import 'auth.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  String isLoggedIn = "false";
  String userName = "";
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  DelayedDisplay(
                    delay: Duration(seconds: 1),
                    slidingBeginOffset: Offset(0, 0),
                    child: Text('Welcome to ',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 40,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto',
                        )),
                  ),
                  DelayedDisplay(
                    slidingBeginOffset: Offset(0, 0),
                    delay: Duration(seconds: 1),
                    child: Text('Covid-19 Tracker',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 40,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto',
                        )),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      DelayedDisplay(
                        delay: Duration(seconds: 2),
                        child: InformationCard(
                            title: "Track Covid-19 Updates",
                            subtitle:
                                "See updates about Covid-19 from all around the world.",
                            image: "assets/images/001-screening.png"),
                      ),
                      DelayedDisplay(
                        delay: Duration(seconds: 3),
                        child: InformationCard(
                            title: "Log your symptoms",
                            subtitle:
                                "Check in daily about how you feel and keep a record of your symptoms.",
                            image: "assets/images/004-cough.png"),
                      ),
                      DelayedDisplay(
                        delay: Duration(seconds: 4),
                        child: InformationCard(
                            title: "Learn more about Covid-19",
                            subtitle:
                                "Ensure that you are taking right precautions against the virus.",
                            image: "assets/images/029-washing.png"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  DelayedDisplay(
                    delay: Duration(seconds: 5),
                    slidingBeginOffset: Offset(0, 0),
                    child: Text('Login to continue:',
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'OpenSans',
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DelayedDisplay(
                    delay: Duration(milliseconds: 5500),
                    slidingBeginOffset: Offset(0, 0),
                    child: SizedBox(
                      height: 50,
                      width: 250,
                      child: SignInButton(Buttons.Google,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          text: "Log in with Google", onPressed: () async {
                        try {
                          userName = await signInWithGoogle();
                          Navigator.pushNamed(context, '/home');
                        } catch (e) {
                          print(e);
                        }
                      }),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
