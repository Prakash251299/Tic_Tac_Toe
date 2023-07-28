import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'main.dart';
import 'hamburger.dart';
import 'package:url_launcher/url_launcher.dart';

var player1 = "Computer";
var player2 = "You";
var hamburger = 0;
var com = 'o', you = 'x';

class CompScreen extends StatefulWidget {
  var mq;
  CompScreen(this. mq){

  }
  State createState() => CompScreenState();
}

class CompScreenState extends State<CompScreen> with TickerProviderStateMixin {

  // animation controller
  late AnimationController _controller;
  late AnimationController _controller1;
  // animation color
  late Animation<Color?> _color;
  late Animation<Color?> _color1;

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(
    //   duration: const Duration(seconds: 5),
    //   vsync: this,
    // )..repeat(reverse: true);
    _controller1 = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    // color tween
    // _color =
        // ColorTween(begin: Colors.white, end: Colors.amber).animate(_controller);
    _color1 =
        ColorTween(begin: Color.fromARGB(255, 78, 136, 165), end: Color.fromARGB(255, 37, 41, 43)).animate(_controller1);
  }

  @override
  void dispose() {
    // _controller.dispose();
    _controller1.dispose();
    super.dispose();
  }

  var swap=0;
  var myText = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
      Message = "Your turn",
      gameEnd = 0;
  var cont = 'x';
  var level = 0;
  var fill = [10, 10, 10, 10, 10, 10, 10, 10, 10], count = 0;
  int tapped = 10;
  restart() {
    setState(() {
      Message = "Your turn";
      // cont = swap==1?you:com;
      // cont = you;
      for (var j = 0; j < 9; j++) {
        myText[j] = ' ';
        fill[j] = 10;
      }
      // a = '';
      count = 0;
      gameEnd = 0;
      tapped = 10;
    });
  }

  _check() {
    setState(() {
      if (myText[0] == 'o' && myText[1] == 'o' && myText[2] == 'o') {
        Message = player1 + ' won';
        fill[0] = 0;
        fill[1] = 1;
        fill[2] = 2;
        gameEnd = 1;
      }
      if (myText[0] == 'o' && myText[3] == 'o' && myText[6] == 'o') {
        Message = player1 + ' won';
        fill[0] = 0;
        fill[3] = 3;
        fill[6] = 6;
        gameEnd = 1;
      }
      if (myText[4] == 'o' && myText[3] == 'o' && myText[5] == 'o') {
        Message = player1 + ' won';
        fill[4] = 4;
        fill[3] = 3;
        fill[5] = 5;
        gameEnd = 1;
      }
      if (myText[4] == 'o' && myText[1] == 'o' && myText[7] == 'o') {
        Message = player1 + ' won';
        fill[4] = 4;
        fill[1] = 1;
        fill[7] = 7;
        gameEnd = 1;
      }
      if (myText[8] == 'o' && myText[6] == 'o' && myText[7] == 'o') {
        Message = player1 + ' won';
        fill[8] = 8;
        fill[6] = 6;
        fill[7] = 7;
        gameEnd = 1;
      }
      if (myText[8] == 'o' && myText[2] == 'o' && myText[5] == 'o') {
        Message = player1 + ' won';
        fill[8] = 8;
        fill[5] = 5;
        fill[2] = 2;
        gameEnd = 1;
      }
      if (myText[4] == 'o' && myText[2] == 'o' && myText[6] == 'o') {
        Message = player1 + ' won';
        fill[4] = 4;
        fill[6] = 6;
        fill[2] = 2;
        gameEnd = 1;
      }
      if (myText[4] == 'o' && myText[0] == 'o' && myText[8] == 'o') {
        Message = player1 + ' won';
        fill[0] = 0;
        fill[4] = 4;
        fill[8] = 8;
        gameEnd = 1;
      }
      if (myText[0] == 'x' && myText[1] == 'x' && myText[2] == 'x') {
        Message = player2 + ' won';
        fill[0] = 0;
        fill[1] = 1;
        fill[2] = 2;
        gameEnd = 1;
      }
      if (myText[0] == 'x' && myText[3] == 'x' && myText[6] == 'x') {
        Message = player2 + ' won';
        fill[0] = 0;
        fill[3] = 3;
        fill[6] = 6;
        gameEnd = 1;
      }
      if (myText[4] == 'x' && myText[1] == 'x' && myText[7] == 'x') {
        Message = player2 + ' won';
        fill[4] = 4;
        fill[1] = 1;
        fill[7] = 7;
        gameEnd = 1;
      }
      if (myText[4] == 'x' && myText[3] == 'x' && myText[5] == 'x') {
        Message = player2 + ' won';
        fill[4] = 4;
        fill[5] = 5;
        fill[3] = 3;
        gameEnd = 1;
      }
      if (myText[8] == 'x' && myText[6] == 'x' && myText[7] == 'x') {
        Message = player2 + ' won';
        fill[6] = 6;
        fill[7] = 7;
        fill[8] = 8;
        gameEnd = 1;
      }
      if (myText[8] == 'x' && myText[2] == 'x' && myText[5] == 'x') {
        Message = player2 + ' won';
        fill[8] = 8;
        fill[5] = 5;
        fill[2] = 2;
        gameEnd = 1;
      }
      if (myText[4] == 'x' && myText[0] == 'x' && myText[8] == 'x') {
        Message = player2 + ' won';
        fill[0] = 0;
        fill[4] = 4;
        fill[8] = 8;
        gameEnd = 1;
      }
      if (myText[4] == 'x' && myText[2] == 'x' && myText[6] == 'x') {
        Message = player2 + ' won';
        fill[4] = 4;
        fill[6] = 6;
        fill[2] = 2;
        gameEnd = 1;
      }
      if(gameEnd==1){
        tapped=10;
        return;
      }
      count = 0;
      for (var j = 0; j < 9; j++) {
        if (myText[j] != ' ') {
          count++;
        }
      }
      if (count == 9) {
        // Message = Message[Message.length-1]!='n'?'Tied':Message;
        Message = 'Tied';
        gameEnd = 1;
      }
    });
  }

  int heuristicFun(var a,int val,var ch){
    int count = 0;
    if(val==1){
      if((a[1]==' ' || a[1]==ch) && (a[2]==' ' || a[2]==ch)){
        count++;
      }
      if((a[3]==' ' || a[3]==ch) && (a[6]==' ' || a[6]==ch)){
        count++;
      }
      if((a[4]==' ' || a[4]==ch) && (a[8]==' ' || a[8]==ch)){
        count++;
      }
      return count;
    }
    
    if(val==2){
      if((a[0]==' ' || a[0]==ch) && (a[2]==' ' || a[2]==ch)){
        count++;
      }
      if((a[4]==' ' || a[4]==ch) && (a[7]==' ' || a[7]==ch)){
        count++;
      }
      return count;
    }
    
    if(val==3){
      if((a[1]==' ' || a[1]==ch) && (a[0]==' ' || a[0]==ch)){
        count++;
      }
      if((a[5]==' ' || a[5]==ch) && (a[8]==' ' || a[8]==ch)){
        count++;
      }
      if((a[4]==' ' || a[4]==ch) && (a[6]==' ' || a[6]==ch)){
        count++;
      }
      return count;
    }
    
    
    if(val==4){
      if((a[0]==' ' || a[0]==ch) && (a[6]==' ' || a[6]==ch)){
        count++;
      }
      if((a[4]==' ' || a[4]==ch) && (a[5]==' ' || a[5]==ch)){
        count++;
      }
      return count;
    }
    
    
    if(val==5){
      if((a[3]==' ' || a[3]==ch) && a[5]==' ' || a[5]==ch){
        count++;
      }
      if((a[1]==' ' || a[1]==ch) && a[7]==' ' || a[7]==ch){
        count++;
      }
      if((a[0]==' ' || a[0]==ch) && a[8]==' ' || a[8]==ch){
        count++;
      }
      if((a[2]==' ' || a[2]==ch) && a[6]==' ' || a[6]==ch){
        count++;
      }
      return count;
    }
    
    
    if(val==6){
      if((a[3]==' ' || a[3]==ch) && a[4]==' ' || a[4]==ch){
        count++;
      }
      if((a[2]==' ' || a[2]==ch) && a[8]==' ' || a[8]==ch){
        count++;
      }
      return count;
    }
    if(val==7){
      if((a[7]==' ' || a[7]==ch) && a[8]==' ' || a[8]==ch){
        count++;
      }
      if((a[3]==' ' || a[3]==ch) && a[0]==' ' || a[0]==ch){
        count++;
      }
      if((a[4]==' ' || a[4]==ch) && a[2]==' ' || a[2]==ch){
        count++;
      }
      return count;
    }
    if(val==8){
      if((a[6]==' ' || a[6]==ch) && a[8]==' ' || a[8]==ch){
        count++;
      }
      if((a[4]==' ' || a[4]==ch) && a[1]==' ' || a[1]==ch){
        count++;
      }
      return count;
    }
    if(val==9){
      if((a[6]==' ' || a[6]==ch) && a[7]==' ' || a[7]==ch){
        count++;
      }
      if((a[5]==' ' || a[5]==ch) && a[2]==' ' || a[2]==ch){
        count++;
      }
      if((a[0]==' ' || a[0]==ch) && a[4]==' ' || a[4]==ch){
        count++;
      }
      return count;
    }
    return 0;
  }
  var ch = ' ';
	int max = 0, currMax = 0, maxer = 10;
  // int optimalMoveForComputer(var ch) {
  Future<int> optimalMoveForComputer(var ch) async {
    maxer = 10;
    // Message = "Computer's turn";
    // await Future.delayed(Duration(milliseconds: 1000));
    // Message = "Your turn";
    max = 0;
    currMax = 0;
    for(int i=0;i<9;i++){ // added equal in (i<9)
      if(myText[i]==' '){
        currMax = heuristicFun(myText,i+1,ch);
        // stdout.write("${currMax} ");
        if(max<currMax){
          max = currMax;
          maxer = i;
        }
      }
    }
    return maxer;
  }

  int forceStep(var ch){
		if(myText[0]==ch && myText[1]==ch && myText[2]==' '){
			return 2;
		}
		if(myText[0]==' ' && myText[1]==ch && myText[2]==ch){
			return 0;
		}
		if(myText[0]==ch && myText[1]==' ' && myText[2]==ch){
			return 1;
		}
		if(myText[0]==ch && myText[3]==' ' && myText[6]==ch){
			return 3;
		}
		if(myText[0]==ch && myText[3]==ch && myText[6]==' '){
			return 6;
		}
		if(myText[0]==' ' && myText[3]==ch && myText[6]==ch){
			return 0;
		}
		if(myText[0]==' ' && myText[4]==ch && myText[8]==ch){
			return 0;
		}
		if(myText[0]==ch && myText[4]==' ' && myText[8]==ch){
			return 4;
		}
		if(myText[0]==ch && myText[4]==ch && myText[8]==' '){
			return 8;
		}
		if(myText[1]==ch && myText[4]==' ' && myText[7]==ch){
			return 4;
		}
		if(myText[1]==ch && myText[4]==ch && myText[7]==' '){
			return 7;
		}
		if(myText[1]==' ' && myText[4]==ch && myText[7]==ch){
			return 1;
		}
		if(myText[2]==' ' && myText[4]==ch && myText[6]==ch){
			return 2;
		}
		if(myText[2]==ch && myText[4]==' ' && myText[6]==ch){
			return 4;
		}
		if(myText[2]==ch && myText[4]==ch && myText[6]==' '){
			return 6;
		}
		if(myText[2]==ch && myText[5]==ch && myText[8]==' '){
			return 8;
		}
		if(myText[2]==ch && myText[5]==' ' && myText[8]==ch){
			return 5;
		}
		if(myText[2]==' ' && myText[5]==ch && myText[8]==ch){
			return 2;
		}
		if(myText[3]==' ' && myText[4]==ch && myText[5]==ch){
			return 3;
		}
		if(myText[3]==ch && myText[4]==' ' && myText[5]==ch){
			return 4;
		}
		if(myText[3]==ch && myText[4]==ch && myText[5]==' '){
			return 5;
		}
		if(myText[6]==ch && myText[7]==ch && myText[8]==' '){
			return 8;
		}
		if(myText[6]==' ' && myText[7]==ch && myText[8]==ch){
			return 6;
		}
		if(myText[6]==ch && myText[7]==' ' && myText[8]==ch){
			return 7;
		}
	  return 10;
  }

  int _cornerCheck(var ch){
    var temp = ch;
    if(ch=='x'){
      temp = 'o';
    }else{
      temp = 'x';
    }
    if(myText[0]==ch && myText[4]==temp && myText[8]==ch){
      if(myText[1]==' '){
        return 1;
      }
      if(myText[3]==' '){
        return 3;
      }
      if(myText[5]==' '){
        return 5;
      }
      if(myText[7]==' '){
        return 7;
      }
    }
    if(myText[2]==ch && myText[4]==temp && myText[6]==ch){
      if(myText[1]==' '){
        return 1;
      }
      if(myText[3]==' '){
        return 3;
      }
      if(myText[5]==' '){
        return 5;
      }
      if(myText[7]==' '){
        return 7;
      }
    }
    if(myText[2]==ch && myText[4]==temp && myText[6]==ch){
      if(myText[1]==' '){
        return 1;
      }
      if(myText[3]==' '){
        return 3;
      }
      if(myText[5]==' '){
        return 5;
      }
      if(myText[7]==' '){
        return 7;
      }
    }



    if(myText[1]==ch && myText[4]==temp && myText[5]==ch){
      if(myText[2]==' '){
        return 2;
      }
    }
    if(myText[1]==ch && myText[4]==temp && myText[3]==ch){
      if(myText[0]==' '){
        return 0;
      }
    }
    if(myText[3]==ch && myText[4]==temp && myText[7]==ch){
      if(myText[6]==' '){
        return 6;
      }
    }
    if(myText[5]==ch && myText[4]==temp && myText[7]==ch){
      if(myText[8]==' '){
        return 8;
      }
    }
    return 10;
  }

  _button(int i) {
    var h = widget.mq.height-50;
    var w = widget.mq.width;
    // var s;
    // if(h>w){
    //   setState(() {
    //     s = w/3;
        
    //   });
    // }
    // else{
    //   if(h<=w){
    //     s = (h*0.5)/3;
    //   }
    // }
    return InkWell(
        child: 
        AnimatedBuilder(
          animation: _color1,
          builder: (BuildContext _, Widget? __) {
            return 



        Container(
        decoration: BoxDecoration(

          // color: _color.value,
          color: fill[i]!=10?Colors.red.withOpacity(0.5):tapped==i?Colors.green:
          _color1.value,
          // color: fill[i]!=10?Colors.red:tapped==i?Colors.green:
          // Color.fromARGB(255, 61, 88, 62),
          border: Border.all(width: 0.2, color: Colors.white),
        ),
        width: MediaQuery.of(context).size.width <= 240
            ? 80
            : MediaQuery.of(context).size.width>500?500/3:MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height <= 400
            ? 400/8.032
            : (MediaQuery.of(context).size.height / 2) / 3,


        child: Center(
          child: Text(myText[i], style: TextStyle(color: Colors.white)),
        )





        // Container(
        //     decoration: BoxDecoration(
        //       color: fill[i]!=10?Colors.red:tapped==i?Colors.green:Color.fromARGB(255, 61, 88, 62),
        //       // color:Colors.grey,
        //       border: Border.all(width: 2, color: Colors.white),
        //     ),
        //     // height: MediaQuery.of(context).size.height>790?600*31/100:MediaQuery.of(context).size.height*20/100,
        //     // width: MediaQuery.of(context).size.width>700?600*31/100:MediaQuery.of(context).size.width * 20 / 100,


        //     // height: h<w?h*15/100:w/3-12,
        //     // width: h<w?h*15/100:w/3-12,
        //     height: h<w?(h*0.5)/3:MediaQuery.of(context).size.width / 3,
        //     // width: h<w?h*0.5/3:MediaQuery.of(context).size.width / 3,
        //     // width: MediaQuery.of(context).size.width <= 240
        //     // ? 80
        //     // : MediaQuery.of(context).size.width / 3,
        //     width: h<w?(h*0.5)/3:MediaQuery.of(context).size.width / 3,

        //     // height: s-12,
        //     // width: s-12,



            // child: Center(
            //   child: Text(myText[i], style: TextStyle(color: Colors.white)),
            // )
        //     // child:Text(i.toString(),style: TextStyle(color: Colors.red),),
            // ),
            );


            }),

        onTap: () async {
          _check();
          // setState(() {
            // tapped = i;
          // });
          if(myText[i]==' '){
            if(level==2){
            var a,k=10;
            if(gameEnd==0){
              // setState((){
                myText[i] = cont;
              await _check();
              if(gameEnd==1){
                return;
              }
                // myText[await optimalMoveForComputer('o')] = 'x';
              // });
              setState((){
                k=10;
              });

              int w = forceStep(com);
              if(w!=10){
                myText[w] = com;
                tapped = w;
                // tapped = w;
                // print(w);
                _check();
                return;
              }
                k = forceStep(you);
                // print(k);
              if(gameEnd==0){
                if(k==10){
                  if(await optimalMoveForComputer(com)==10){

                    for(int i=0;i<myText.length;i++){
                      if(myText[i]==' '){
                        setState(() {
                          myText[i] = com;
                          tapped = i;
                        });
                        _check();
                        break;
                      }
                    }
                  }else{
                    a = await optimalMoveForComputer(com);
                    // print(a);
                    setState(() {
                      myText[a] = com;
                      tapped = a;
                    });
                    await _check();
                  }
                }else{
                  // print(k);
                  setState(() {
                    myText[k] = com;
                    tapped = k;
                    _check();
                  });
                }
              }
            }
          }

          // if(level==1){
            if(level==1){
              var a,b,k=10;
              // tapped=1;
              // print("hi");
              if(gameEnd==0){
                // setState((){
                  myText[i] = cont;
                await _check();
                if(gameEnd==1){
                  return;
                }
                  // myText[await optimalMoveForComputer('o')] = 'x';
                // });
                setState((){
                  k=10;
                });

                int w = forceStep(com);
                if(w!=10){
                  myText[w] = com;
                  tapped = w;
                  // print(w);
                  _check();
                  return;
                }
                  k = forceStep(you);
                  // print(k);
                if(gameEnd==0){
                  if(k==10){
                    if(await optimalMoveForComputer(com)==10){

                      for(int i=0;i<myText.length;i++){
                        if(myText[i]==' '){
                          setState(() {
                            myText[i] = com;
                            tapped = i;
                          });
                          _check();
                          break;
                        }
                      }
                    }else{
                      a = await optimalMoveForComputer(com);
                      b = await optimalMoveForComputer(you);
                      if(b>a){
                        setState(() {
                          a = b;
                        });
                      }
                      // print(a);
                      setState(() {
                        myText[a] = com;
                        tapped = a;
                      });
                      await _check();
                    }
                  }
                  else{
                    // print(k);
                    setState(() {
                      myText[k] = com;
                      tapped = k;
                      _check();
                    });
                  }
                }
              }
            }
            


            if(level==0){
              if(gameEnd==0){
                myText[i] = cont;
                await _check();
                if(gameEnd==1){
                  return;
                }
                Random random = new Random();
                int r;
                for(;;){
                  r = random.nextInt(9);
                  if(myText[r]==' '){
                    myText[r] = com;
                    tapped = r;
                    break;
                  }
                }
                await _check();
              }
            }




          if(level==3){
              var a,b,k=10,c=10;
              // tapped=1;
              // print("hi");
              if(gameEnd==0){
                // setState((){
                  myText[i] = cont;
                await _check();
                if(gameEnd==1){
                  return;
                }
                  // myText[await optimalMoveForComputer('o')] = 'x';
                // });
                setState((){
                  k=10;
                });

                int w = forceStep(com);
                if(w!=10){
                  myText[w] = com;
                  tapped = w;
                  // print(w);
                  _check();
                  return;
                }
                k = forceStep(you);
                // print(k);
                if(gameEnd==0){
                  if(k==10){
                    // var c = _cornerCheck('x');
                    // if(c!=10){
                    //   myText[c] = 'o';
                    //   return;
                    // }
                    if(await optimalMoveForComputer(com)==10){
                      for(int i=0;i<myText.length;i++){
                        if(myText[i]==' '){
                          setState(() {
                            myText[i] = com;
                            tapped = i;
                          });
                          _check();
                          break;
                        }
                      }
                    }else{
                      a = await optimalMoveForComputer(com);
                      b = await optimalMoveForComputer(you);
                      c = _cornerCheck(you);
                      if(c!=10){
                        myText[c] = com;
                        tapped = c;
                        return;
                      }
                      if(b>a){
                        setState(() {
                          a = b;
                        });
                      }
                      // print(a);
                      setState(() {
                        myText[a] = com;
                        tapped = a;
                      });
                      c = _cornerCheck(you);
                      if(c!=10){
                        myText[c] = com;
                        tapped = c;
                        return;
                      }
                      await _check();
                    }
                  }
                  else{
                    // print(k);
                    setState(() {
                      myText[k] = com;
                      tapped = k;
                      _check();
                    });
                  }
                }
              }
            }
          }

        });


  }

  Widget _bottomOptions(){
    return Material(
      // shape:Border.all(BorderSide(color:Colors.red)),
      // shape:Border.all(width:2,color:Colors.black.withOpacity(1.0)),
      child:
    GestureDetector(
      child: 
      Container(
        height:50,
        // width:widget.mq.width,
        decoration:BoxDecoration(
          border: Border.all(width:2,color:Colors.black.withOpacity(1.0)),
      // shape:Border.all(width:2,color:Colors.black87),
          // color:Colors.black87.withOpacity(0.3),
          // color:Color.fromARGB(255, 78, 76, 76),
          color:Colors.black87.withOpacity(1.0),

          // border:BorderRadius.only(top:Radius.circular(3))),
        ),
        // border:,
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [ 

          // MouseRegion(
          //   cursor: SystemMouseCursors.click,
          //   child: GestureDetector(
          //     child:Container(
          //     width: MediaQuery.of(context).size.width/2-2,
          //     child: Center(child:Icon(Icons.start,color:Colors.white)),
          //     // child: Center(child:Text("Restart",style:TextStyle(fontSize: 20,color:Colors.white,decoration: TextDecoration.none))),
          //     ),
          //     onTap: () async {
          //       // setState((){
          //         await restart();
          //       // });
          //     },
          //   ),
          // ),



        // Padding(padding: EdgeInsets.only(bottom:5),child:
          MouseRegion(
            // cursor: SystemMouseCursors.click,
            child:
          GestureDetector(
            child:Container(
            width: MediaQuery.of(context).size.width/2-2,
            decoration: BoxDecoration(
              // border: Border(right: BorderSide(width:2,color:Colors.white)),
            ),
            child: Center(
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                IconButton(
                  onPressed: (){
                    setState((){
                      if(level==0){
                        level=3;
                      }else{
                        level--;
                      }
                    });
                    restart();
                  }, 
                  icon: Icon(Icons.navigate_before,color:Colors.white),
                ),
                Spacer(),
                Text("Level ${level+1}",style:TextStyle(fontSize: 20,color:Colors.white,decoration: TextDecoration.none)),
                Spacer(),
                // Padding(padding:EdgeInsets.only(left:5),child:
                
                IconButton(
                  // size:,
                  onPressed: (){
                    setState((){
                      if(level==3){
                        level=0;
                      }else{
                        level++;
                      }
                    });
                    restart();
                  }, 
                  icon: Icon(Icons.navigate_next,color:Colors.white),
                ),
                // Icon(Icons.navigate_next,color:Colors.white),
                // ),
              ]),
            ),
            ),
            onTap: (){
              // setState((){
              //       if(level==1){
              //         level=2;
              //       }else{
              //         if(level==2){
              //           level=3;
              //         }else{
              //           level = 1;
              //         }
              //       }
              //     });
              //     restart();
            },
          ),
          // ),
        ),


          // MouseRegion(
          //   cursor: SystemMouseCursors.click,
          //   child: GestureDetector(
          //     child:Container(
          //     width: MediaQuery.of(context).size.width/2-2,
          //     child: Center(child:Text("Restart",style:TextStyle(fontSize: 20,color:Colors.white,decoration: TextDecoration.none))),
          //     ),
          //     onTap: () async {
          //       // setState((){
          //         await restart();
          //       // });
          //     },
          //   ),
          // ),



        ]),
      ),
      ),
    );
  }


  Widget hamburgerOptions(){
    // for(int i=0;i<9999;i++){
    //   if(i%1000==0)
    //   _opacity();
    // }
    var mq = MediaQuery.of(context).size;
    // hamburger==1;
    // var k=0;
    return 
      // Scaffold(
      // body: 
      Container(
        alignment: Alignment.center,
        // color: Colors.black87,
        child: AnimatedBuilder(
          animation: _color1,
          builder: (BuildContext _, Widget? __) {
            return Container(
              child:
              // width: 300,
              // height: 300,
            //   decoration:
            //       BoxDecoration(color: _color.value, shape: BoxShape.circle),
            // );
        //   },
        // ),




    // Column(children: [




      Card(
        color: _color.value,
        // color:Colors.red.withOpacity(opacity),
        // margin: EdgeInsets.symmetric(horizontal:mq.width*0.04,vertical:mq.height*0.01),
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
        child: 
        ListTile(
          title: Center(child:
          GestureDetector(child:
            Container(
              // color:Colors.green,
              child:
              // Row(
                // mainAxisAlignment: ,
                // children: [
                Text("Source code",style: TextStyle(fontSize: mq.width>600?600*3/100:mq.width*3/100),),
            ),
            onTap: (){
              launch('https://github.com/Prakash251299/Tic_Tac_Toe');
              // print("asjhd");
            },
          ),
            // ]),
          ),
        ),
      ),
      );
          },
        ),
      );
  }

  Widget _hamburger(){
    var mq = MediaQuery.of(context).size;
    // var k=0;
    return 
    GestureDetector(child:
    Container(
      // height:20,
      // width:200,
      // color:Colors.red,
          // margin: EdgeInsets.symmetric(horizontal:mq.width*0.04,vertical:mq.height*0.01),
          // shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
          child: 
          Column(children: [
            if (hamburger == 1) ...{
            // if (k == 0) ...{
                          Container(
                            // height: MediaQuery.of(context).size.height <= 200
                            //     ? 200
                            //     : MediaQuery.of(context).size.height,
                            height: MediaQuery.of(context).size.height/2,
                            width: MediaQuery.of(context).size.width <= 240
                                ? 240 * 35 / 100
                                : MediaQuery.of(context).size.width >= 550
                                    ? 550 * 35 / 100
                                    : MediaQuery.of(context).size.width *
                                        35 /
                                        100,
                            decoration:BoxDecoration(
                              // color: Colors.blueGrey,

                            ),


                            // color: Colors.blueGrey,
                            child: Stack(
                                alignment: Alignment.bottomCenter,
                                // alignment: Alignment.topRight,
                                children: [
                                  // AnimatedPositioned(
                                  //   // width: hamburger,
                                  //   top: hamburger==1?200:50,
                                  //   // left:mq.width*.25,
                                  //   right:hamburger==1?50:200,
                                  //   left: hamburger==1?50:200,
                                  //   // width:widget.mq.width*0.5,
                                  //   // height:widget.mq.height*0.5,
                                  //   duration:const Duration(seconds:3),
                                  //   curve: Curves.fastOutSlowIn,
                                  //   child:
                                  // //   Text("Uihsadj"),
                                  // // ),
                                  GestureDetector(child:
                                  Container(
                                    // height: 200,
                                    // width: 200,
                                    // color:Color.fromARGB(255, 12, 8, 8),
                                    // child:Text("gjh"),


                                    margin: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.width <=
                                                    240
                                                ? 240 * 9 / 100
                                                : MediaQuery.of(context)
                                                            .size
                                                            .width >=
                                                        600
                                                    ? 600 * 9 / 100
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        9 /
                                                        100),


                                    child: ListView.builder(
                                        itemCount: 3,
                                        itemBuilder: (c, i) {
                                          return 
                                          MouseRegion(
                                            cursor:SystemMouseCursors.click,
                                            child:
                                            Column(children: [
                                              hamburgerOptions(),
                                            ],),
                                          );



                                        }),
                                  ),

                                  ),
                                  // ),

                                  // hamburgerOptions(),
                                  // GestureDetector(
                                  //   child: Text("Close"),
                                  //   onTap: (){
                                  //     setState(() {
                                  //       hamburger = 0;
                                  //     });
                                  //   },
                                  // ),
                                ]),
                          ),
                        },
          ],)
    ),
    onTap: (){
      setState(() {
        hamburger = 0;
      });
    },
      );
  }

  @override
  Widget build(BuildContext context) {
    var selected = 0;
    // var h = widget.mq.height;
    // var w = widget.mq.width;
    return 
    SafeArea(child:
    Stack(
      alignment:Alignment.bottomCenter,
      children:[

        // Container(
        //         height:200,
        //         width:200,
        //         color:Colors.red,
        //       ),

        GestureDetector(
          child: 
        Container(
            // decoration: BoxDecoration(
            //   gradient:LinearGradient(colors:[Colors.white,Colors.black]),
            // ),
            color:Colors.black,
            child: Scaffold(

              extendBodyBehindAppBar: true,
              // backgroundColor: Colors.black87.withOpacity(0.7),
              // backgroundColor: Colors.black87.withOpacity(1),
              appBar: 
              // PreferredSize(
              //   preferredSize: Size.fromHeight(50),
                // child: Container(

                  // decoration:BoxDecoration(
                  //     gradient: LinearGradient(colors: [Colors.white,Colors.black],),
                  //   ),
                  // child: 
                  AppBar(
                    centerTitle: true,

                    // backgroundColor: Color.fromARGB(255, 78, 76, 76).withOpacity(0),
                    backgroundColor: Colors.black87.withOpacity(0.0),
                    elevation:1,
                    // preferredSize: ,
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(right: 10,top: 3),
                        child: Column(children: [
                          IconButton(
                            icon: Icon(Icons.info_outline),
                            onPressed: (){
                              launch('https://github.com/Prakash251299/Tic_Tac_Toe');
                            },
                          ),

                          // if (hamburger == 0) ...{
                          //   IconButton(
                          //     icon: Icon(Icons.menu),
                          //     onPressed: () {
                          //       setState(() {
                          //         hamburger = 1;
                          //       });
                          //     },
                          //   ),
                          // }
                        ]),
                        // Icon(Icons.menu),
                      ),
                    ],
                    title: Text("Tic Tack Toe",style: TextStyle(color:Color.fromARGB(255, 127, 240, 105)),),
                  ),
                // ),
              // ),
              // BoxDecoration()
              // backgroundColor: Colors.grey,
              body: Container(

                // decoration: BoxDecoration(
                //     gradient: LinearGradient(colors: [
                //   Colors.black87,
                //   Colors.black87,
                //   Colors.black87,
                //   Colors.black87
                // ])),



                color: Colors.black87.withOpacity(1.0),
                // height: MediaQuery.of(context).size.height <= 400
                // ? 400
                // : MediaQuery.of(context).size.height,
                // margin: EdgeInsets.all(MediaQuery.of(context).size.width * 3 / 100),
                child: Column(
                    // alignment: Alignment.bottomCenter,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      // Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Padding(padding: EdgeInsets.only(left:10,right:10),child:
                      //       Text(
                      //         player1 + ' : o     ',
                      //         style: TextStyle(
                      //             color: Colors.blue[100],
                      //             // fontSize: h<w?h*8/100:w*8/100,

                      //             fontSize:
                      //                 MediaQuery.of(context).size.width > 450
                      //                     ? 450 * 5 / 100
                      //                     : MediaQuery.of(context).size.width *
                      //                         5 /
                      //                         100),
                      //       ),),
                      //       Spacer(),
                      //       Padding(padding: EdgeInsets.only(left:10,right:10),child:
                      //       Text(
                      //         player2 + ' : x',
                      //         style: TextStyle(
                      //             color: Colors.blue[100],
                      //             fontSize:
                      //                 MediaQuery.of(context).size.width > 450
                      //                     ? 450 * 5 / 100
                      //                     : MediaQuery.of(context).size.width *
                      //                         5 /
                      //                         100),
                      //       ),),
                      //     ]
                      //   ),

                      Padding(padding: EdgeInsets.only(top:10,bottom:10),
                      child:
                      Column(children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(padding: EdgeInsets.only(bottom:10,right:10),child:
                            Text(
                              'Computer' + ' : ${com}',
                              style: TextStyle(
                                  color: Colors.blue[100],
                                  // fontSize: h<w?h*8/100:w*8/100,

                                  fontSize:
                                      MediaQuery.of(context).size.width > 450
                                          ? 450 * 5 / 100
                                          : MediaQuery.of(context).size.width *
                                              5 /
                                              100),
                            ),),
                            // Spacer(),
                            // Padding(
                            //   padding:EdgeInsets.only(right:15),
                            //   child: IconButton(
                            //     icon: Icon(Icons.swap_horiz,color:Colors.white),
                            //     onPressed: (){

                            //   },)
                            // ),

                            // Spacer(),
                            Padding(padding: EdgeInsets.only(bottom:10,left:5),child:
                            Text(
                              'You' + ' : ${you}',
                              style: TextStyle(
                                  color: Colors.blue[100],
                                  fontSize:
                                      MediaQuery.of(context).size.width > 450
                                          ? 450 * 5 / 100
                                          : MediaQuery.of(context).size.width *
                                              5 /
                                              100),
                            ),),
                          ]
                        ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _button(0),
                          _button(1),
                          _button(2),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _button(3),
                          _button(4),
                          _button(5),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _button(6),
                          _button(7),
                          _button(8),
                        ],
                      ),
                      ])),


                      Row(
                        children: [
                          Text(
                            Message,
                            style: TextStyle(
                                color: Message[Message.length-1]=='s'||Message[Message.length-1]=='d'?Colors.red:Colors.blue[100],
                                fontSize:
                                    MediaQuery.of(context).size.width > 450
                                        ? 450 * 5 / 100
                                        : MediaQuery.of(context).size.width *
                                            5 /
                                            100),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      // Padding(padding: EdgeInsets.only(top: 10)),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [

                      // ]),
                    ]),
              ),
            ),
          ),
          onTap: () {
            setState(() {
              hamburger = 0;
            });
          },
        ),

      Padding(padding: EdgeInsets.only(bottom:MediaQuery.of(context).size.height<=450?10:20),child: 
        _bottomOptions(),
      ),


      


      // Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Stack(
      //       // alignment: Alignment.topCenter,
      //       // mainAxisAlignment: MainAxisAlignment.start,
      //       children: [
      //         _hamburger(),
      //     ]),
      //   ]),


      // SizedBox(
      // width: 200,
      // height: 350,
      // child: 
      //   Stack(
      //   children: <Widget>[
      //     AnimatedPositioned(
      //       width: selected==0 ? 200 : 50.0,
      //       height: selected==0 ? 50.0 : 200.0,
      //       top: selected==0 ? 50.0 : 150.0,
      //       duration: const Duration(seconds: 2),
      //       curve: Curves.fastOutSlowIn,
      //       child: GestureDetector(
      //         onTap: () {
      //           print("Tapped");
      //           setState(() {
      //             if(selected==0)
      //             selected = 1;
      //             else
      //             selected = 0;
      //           });
      //         },
      //         child: const ColoredBox(
      //           color: Colors.blue,
      //           child: Center(child: Text('Tap me')),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // ),


      // Padding(padding: EdgeInsets.only(right: 20,bottom: 20),
      //   child:Row(
      //     mainAxisAlignment:MainAxisAlignment.end,
      //     children: [
      //       // SizedBox(
      //       //   width:MediaQuery.of(context).size.width<=450?450*10/100:MediaQuery.of(context).size.width*10/100,
      //       //   height:MediaQuery.of(context).size.width<=450?450*10/100:MediaQuery.of(context).size.width*10/100,
      //       //   // height:widget.mq.width*10/100,
      //       //   // width:100,
      //       //   child:
      //     FloatingActionButton(
      //       backgroundColor: Color.fromARGB(255, 54, 54, 54),
      //       onPressed: () async {
      //         await restart();
      //       },
      //       hoverColor: Colors.red,
      //       // hoverElevation: 5,
      //       // onFocus
      //       child: Icon(Icons.restart_alt_rounded),
      //     ),
      //       // ),
      //   ]),
      // ),

      // Padding(padding: EdgeInsets.only(left: 20,bottom: 20),
      //   child:Row(
      //     mainAxisAlignment:MainAxisAlignment.start,
      //     children: [
      //     FloatingActionButton(
      //       backgroundColor: Color.fromARGB(255, 54, 54, 54),
      //       onPressed: () async {
      //         await restart();
      //       },
      //       hoverColor: Colors.red,
      //       // hoverElevation: 5,
      //       // onFocus
      //       child: Icon(Icons.restart_alt_rounded),
      //     ),
      //     // Spacer(),
      //     FloatingActionButton(
      //       backgroundColor: Color.fromARGB(255, 54, 54, 54),
      //       onPressed: () async {
      //         await restart();
      //       },
      //       hoverColor: Colors.red,
      //       // hoverElevation: 5,
      //       // onFocus
      //       child: Icon(Icons.restart_alt_rounded),
      //     ),
      //   ]),
      // ),
      
      // Padding(padding: EdgeInsets.only(right: 0,bottom: 0),
      //   child:Row(
      //     mainAxisAlignment:MainAxisAlignment.end,
      //     children: [
      //     FloatingActionButton(
      //       backgroundColor: Color.fromARGB(255, 54, 54, 54),
      //       onPressed: () async {
      //         await restart();
      //       },
      //       hoverColor: Colors.red,
      //       // hoverElevation: 5,
      //       // onFocus
      //       child: Icon(Icons.restart_alt_rounded),
      //     ),
      //   ]),
      // ),



    /* Swapping */
    Padding(padding: EdgeInsets.only(left:20, bottom: 20),
    child:
    Align(alignment: Alignment.bottomLeft,
      child:FloatingActionButton(
        heroTag: null,
            backgroundColor: Color.fromARGB(255, 54, 54, 54),
            onPressed: () async {
              await restart();
              setState(() {
                if(swap==0){
                  swap=1;
                  var c;
                  c=player2;
                  player2=player1;
                  player1=c;
                  // tapped = 4;
                  com = 'x';
                  you = 'o';
                  cont = you;

                  Random random = new Random();
                  int r;
                  for(;;){
                    r = random.nextInt(9);
                    if(myText[r]==' '){
                      myText[r] = com;
                      tapped = r;
                      break;
                    }
                  }
                  // myText[4] = com;
                }else{
                  swap=0;
                  var c;
                  c=player2;
                  player2=player1;
                  player1=c;
                  com = 'o';
                  you = 'x';
                  cont = you;
                }
              });
            },
            hoverColor: Colors.red,
            // hoverElevation: 5,
            // onFocus
            child: Icon(Icons.swap_horiz,color:Colors.white),
          ),
        ),
    ),


    /* Restart */
    Padding(padding: EdgeInsets.only(right:20, bottom: 20),
    child:
    Align(alignment: Alignment.bottomRight,
      child:FloatingActionButton(
        heroTag: null,
            backgroundColor: Color.fromARGB(255, 54, 54, 54),
            onPressed: () async {
              await restart();
              setState(() {
                if(swap==1){
                  // var c;
                  // c=player2;
                  // player2=player1;
                  // player1=c;
                  // com = 'x';
                  // you = 'o';
                  Message = player2+"r turn";
                  Random random = new Random();
                  int r;
                  for(;;){
                    r = random.nextInt(9);
                    if(myText[r]==' '){
                      myText[r] = com;
                      tapped = r;
                      break;
                    }
                  }
                  // myText[4] = com;
                }
              });
            },
            hoverColor: Colors.red,
            // hoverColor: Colors.green,
            
            // hoverColor: Color.fromARGB(255, 134, 99, 99),
            // hoverColor: Colors.grey[100],

            // hoverElevation: 1,
            // onFocus
            child: Icon(Icons.restart_alt_rounded,color:Colors.white),
          ),
        ),
        ),








      ]),
    );
  }
}