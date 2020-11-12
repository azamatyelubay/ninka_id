import 'package:flutter/material.dart';
import 'package:ninjia_id/pages/home.dart';
import 'domain/workout.dart';
import 'package:ninjia_id/pages/auth.dart';
 void main() => runApp(Ninja_id());
 class Ninja_id extends StatelessWidget{

   @override
   Widget build(BuildContext context){
     return MaterialApp(
       title: 'Max Fitness',
       theme: ThemeData(
         primaryColor: Colors.cyan,
       ),
       home: AutorizationPage(),
     );
   }
}











