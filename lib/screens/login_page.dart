import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teacher_journal/src/social_sign_in_button.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userIdControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  var userid = "";
  var password = "";

  void login() async {
    print("EMAIL ${userIdControl.text} & PASSWORD ${passwordControl.text}");
    setState(() {
      userid = userIdControl.text;
      password = passwordControl.text;
    });
    var url = Uri.parse("https://ms.digisherpa.ai/users/login");
    final msg = json.encode({"userid": userid, "password": password});
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    http.Response response = await http.post(url, headers: headers, body: msg);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(17),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Image.asset(
              'images/login.png',
              height: 180,
              width: 220,
            ),
            Text(
              "Login In",
              style: TextStyle(color: Colors.cyan, fontSize: 24),
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
              "Email",
              textAlign: TextAlign.left,
              style: TextStyle( fontSize: 14,fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: userIdControl,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1.0),
                ),
                hintText: 'example@gmail.com',
                fillColor: Colors.black26,
                prefixIcon: IconButton(
                  icon: Icon(
                    Icons.mail,
                    size: 18,
                    color: Colors.green.shade400,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
              "Password",
              textAlign: TextAlign.left,
              style: TextStyle( fontSize: 14,fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: passwordControl,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1.0),
                ),
                hintText: '**********',
                fillColor: Colors.black26,
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    size: 18,
                  ),
                  onPressed: () {},
                ),
                prefixIcon: IconButton(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.green.shade400,
                    size: 18,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            
              ],
            ),
            
            SocialSignInButton(
                color: Colors.cyan,
                onPressed: login,
                text: 'Login',
                textColor: Colors.white,
                height: 40,
                logo: 'images/welcomeScreen.png',
                opaque: 'images/login.png'),
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
          ],
        ),
      ),
    );
  }
}
