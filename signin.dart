import 'package:flutter/material.dart';
import 'package:mechat/widgets/widget.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: textFieldDecoration("email"),
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: textFieldDecoration("password"),
              ),
              SizedBox(height: 8,),
              Container(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: Text("Forgot Password?",style: TextStyle(color: Colors.white,fontSize: 15),),
                ),
              ),
              SizedBox(height: 8,),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 15),)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                      colors: [
                        Colors.blueAccent,
                        Colors.blue
                      ]
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(child: Text("Sign In with Google",style: TextStyle(color: Colors.black,fontSize: 15),)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",style:  TextStyle(color: Colors.white,fontSize: 15),),
                  Text("Register now",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        decoration: TextDecoration.underline
                    ),
                  )
                ],
              ),
              SizedBox(height: 50,)
            ],
          ),
        ) ,
      ),
    );
  }
}
