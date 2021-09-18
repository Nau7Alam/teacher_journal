import 'package:flutter/material.dart';
import 'package:teacher_journal/screens/login_page.dart';
import 'package:teacher_journal/src/social_sign_in_button.dart';

class Welcome  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:const EdgeInsets.all(17),
        color: Colors.cyan,
        child: Column(
        children:[
        SizedBox(height:40),
        Text("My Teacher Journal",
        style: TextStyle(color: Colors.white, fontSize: 33,fontWeight:FontWeight.w600),
        ),
        SizedBox(height:20),
        Container(
          child: Image.asset( 'images/welcomeScreen.png') ,
          width: MediaQuery.of(context).size.width*0.9,
        ),
        SizedBox(height:40),
        Text(
          "A simple tool for understanding complex behaviours.",
          textAlign: TextAlign.center,
          style:
           TextStyle(color:Colors.white),
           ),
        SizedBox(height:25),
          SocialSignInButton(
                color: Colors.white,
                onPressed:  () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  LoginPage()),
                  );
                },
                text: 'Login',
                textColor: Colors.cyan,
                height: 40,
                logo: 'images/welcomeScreen.png',
                opaque: '../../images/login.png'
                ),
              Expanded(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('../../images/teamTeach.png',width: 42,height: 39,),
                    SizedBox(  height: 7,),
                    Text("Powered by Team Teach")
                  ],
                )
            )
      ]),
      ));
  }
}