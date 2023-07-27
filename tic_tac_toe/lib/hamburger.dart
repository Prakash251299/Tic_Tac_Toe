import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
Widget _hamburger(){
  return Container();
}
class Hamburger extends StatefulWidget{
  State createState() => HamburgerState();
}

class HamburgerState extends State<Hamburger>{
  @override
  Widget build(BuildContext context){
    return 
    Stack(children: [
      Container(
        height: 20,
        width: 20,
        color:Colors.red,
        // child: ,
      ),
    ],);
    // Container();
  }
}