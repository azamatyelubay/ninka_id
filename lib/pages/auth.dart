import 'package:flutter/material.dart';

class AutorizationPage extends StatefulWidget {
  @override
  _AutorizationPageState createState() => _AutorizationPageState();
}

class _AutorizationPageState extends State<AutorizationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email;
  String password;
  bool showlogin=true;


  Widget logo(){
    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: Align(
        child:  Text(
          'Max Fit',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

      ),
    );
  }
  Widget input(Icon icon,String hint,TextEditingController controller , bool obsecure){


    return Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: TextField(
        controller: controller,
        obscureText: obsecure,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white30),
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white,
              width: 3,

            ),

          ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white54,
                width: 1,
              ),
            ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 10,left: 10),
            child: IconTheme(
              data: IconThemeData(
                color: Colors.white
              ),
              child: icon,
            ),
          )
        ),
      ),

    );
  }
  Widget button(String lable,void func()){
    return RaisedButton(
      splashColor: Theme.of(context).primaryColor,
      highlightColor: Theme.of(context).primaryColor,
      color: Colors.white,
      child: Text(
        lable,
        style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 20),
      ),
      onPressed: (){
        func();
      },
    );


  }
  Widget form(String label,void func()){
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(bottom: 20,top: 10),
            child: input(Icon(Icons.email),"Email",emailController,false),
         ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: input(Icon(Icons.lock),"Password",passwordController,true),
          ),
          SizedBox(height: 20,),

          Padding(padding: EdgeInsets.only(left: 20,right: 20),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: button(label,func),
            ),

          ),



        ],
      ),
    );
  }
  void buttonAction(){
    email = emailController.text;
    password = passwordController.text;

    emailController.clear();
    passwordController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          logo(),
          (showlogin?
          Column(
            children: <Widget> [
              form('Login',buttonAction),
              Padding(

                  child: GestureDetector(
                    child: Text('Not registred yet? REGISTER',style: TextStyle(fontSize: 20,color: Colors.white),),
                    onTap:(){
                      setState(() {
                        showlogin=false;
                      });
                    },
                  ),
                padding: EdgeInsets.all(10),
              )

            ],
          )
          :
          Column(
            children: <Widget> [
              form('Register',buttonAction),
              Padding(

                child: GestureDetector(
                  child: Text('Already registred! LOGIN',style: TextStyle(fontSize: 20,color: Colors.white),),
                  onTap:(){
                    setState(() {
                      showlogin=true;
                    });
                  },
                ),
                padding: EdgeInsets.all(10),
              )

            ],
          )

          ),
        ],
      ),
    );
  }
}
