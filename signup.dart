import 'package:flutter/material.dart';
import 'package:mechat/services/auth.dart';
import 'package:mechat/widgets/widget.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final formkey=GlobalKey<FormState>();
  bool isloading=false;

  AuthMethods authMethods= AuthMethods();

  signMeUp(){
    if(formkey.currentState.validate()){
       setState(() {
         isloading=true;
       });
       authMethods.signUpWithEmailAndPassword(emailTextEditingController.text,
           passwordTextEditingController.text).then((val){
             print("$val");
       });
    }
  }

  TextEditingController userNameTextEditingController=new TextEditingController();
  TextEditingController emailTextEditingController=new TextEditingController();
  TextEditingController passwordTextEditingController=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      body: isloading ?Container(
        child: Center(child: CircularProgressIndicator(),),
      )  :Container(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val){
                          return val.isEmpty || val.length <2 ? "Please provide usename":null;
                        },
                        controller: userNameTextEditingController,
                        style: TextStyle(color: Colors.white),
                        decoration: textFieldDecoration("Username"),
                      ),
                      TextFormField(
                        validator: (val){
                          return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                          null : "Enter correct email";
                        },
                        controller: emailTextEditingController,
                        style: TextStyle(color: Colors.white),
                        decoration: textFieldDecoration("email"),
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (val){
                          return val.length>6 ? null:"please provide 6+ characters";
                        },
                        controller: passwordTextEditingController,
                        style: TextStyle(color: Colors.white),
                        decoration: textFieldDecoration("password"),
                      ),
                    ],
                  ),
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
                GestureDetector(
                  onTap: (){
                      signMeUp();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 15),)),
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
                    Text("Already have an account?",style:  TextStyle(color: Colors.white,fontSize: 15),),
                    Text("SignIn now",
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
          ),
        ) ,
      ),
    );
  }
}
