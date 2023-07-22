import 'dart:io';

import 'package:flutter/material.dart';
import 'main.dart';
var player1 = "Computer";
var player2 = "You";
class CompScreen extends StatefulWidget {
  var mq;
  CompScreen(this. mq){

  }
  State createState() => CompScreenState();
}

class CompScreenState extends State<CompScreen> {
  // var a = '';
  var myText = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
      Message = "Your turn",
      gameEnd = 0;
  var cont = 'x';
  var level = 1;
  var fill = [10, 10, 10, 10, 10, 10, 10, 10, 10], count = 0;
  int tapped = 10;
  restart() {
    setState(() {
      Message = "Your turn";
      cont = 'x';
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
      count = 0;
      for (var j = 0; j < 9; j++) {
        if (myText[j] != ' ') {
          count++;
        }
      }
      if (count == 9) {
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
    for(int i=0;i<9;i++){
      if(myText[i]==' '){
        currMax = heuristicFun(myText,i+1,ch);
        // stdout.write("${currMax} ");
        if(max<currMax){
          max = currMax;
          maxer = i;
        }
      }
    }
    // print("${max} ${maxer}");
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
        Container(
        decoration: BoxDecoration(
          // color: Colors.purple[200],
          color: fill[i]!=10?Colors.red:tapped==i?Colors.green:
          Colors.black87,
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
            ),

        onTap: () async {
          // setState(() {
            // tapped = i;
          // });
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

            int w = forceStep('o');
            if(w!=10){
              myText[w] = 'o';
              // tapped = w;
              // print(w);
              _check();
              return;
            }
              k = forceStep('x');
              // print(k);
            if(gameEnd==0){
              if(k==10){
                if(await optimalMoveForComputer('o')==10){

                  for(int i=0;i<myText.length;i++){
                    if(myText[i]==' '){
                      setState(() {
                        myText[i] = 'o';
                      });
                      break;
                    }
                  }
                }else{
                  a = await optimalMoveForComputer('o');
                  // print(a);
                  setState(() {
                    myText[a] = 'o';
                  });
                  await _check();
                }
              }else{
                // print(k);
                setState(() {
                  myText[k] = 'o';
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

              int w = forceStep('o');
              if(w!=10){
                myText[w] = 'o';
                tapped = w;
                // print(w);
                _check();
                return;
              }
                k = forceStep('x');
                // print(k);
              if(gameEnd==0){
                if(k==10){
                  if(await optimalMoveForComputer('o')==10){

                    for(int i=0;i<myText.length;i++){
                      if(myText[i]==' '){
                        setState(() {
                          myText[i] = 'o';
                          tapped = i;
                        });
                        break;
                      }
                    }
                  }else{
                    a = await optimalMoveForComputer('o');
                    b = await optimalMoveForComputer('x');
                    if(b>a){
                      setState(() {
                        a = b;
                      });
                    }
                    // print(a);
                    setState(() {
                      myText[a] = 'o';
                      tapped = a;
                    });
                    await _check();
                  }
                }
                else{
                  // print(k);
                  setState(() {
                    myText[k] = 'o';
                    tapped = k;
                  });
                }
              }
            }
          }
        // }


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

              int w = forceStep('o');
              if(w!=10){
                myText[w] = 'o';
                tapped = w;
                // print(w);
                _check();
                return;
              }
              k = forceStep('x');
              // print(k);
              if(gameEnd==0){
                if(k==10){
                  // var c = _cornerCheck('x');
                  // if(c!=10){
                  //   myText[c] = 'o';
                  //   return;
                  // }
                  if(await optimalMoveForComputer('o')==10){
                    for(int i=0;i<myText.length;i++){
                      if(myText[i]==' '){
                        setState(() {
                          myText[i] = 'o';
                          tapped = i;
                        });
                        break;
                      }
                    }
                  }else{
                    a = await optimalMoveForComputer('o');
                    b = await optimalMoveForComputer('x');
                    c = _cornerCheck('x');
                    if(c!=10){
                      myText[c] = 'o';
                      return;
                    }
                    if(b>a){
                      setState(() {
                        a = b;
                      });
                    }
                    // print(a);
                    setState(() {
                      myText[a] = 'o';
                      tapped = a;
                    });
                    c = _cornerCheck('x');
                    if(c!=10){
                      myText[c] = 'o';
                      return;
                    }
                    await _check();
                  }
                }
                else{
                  // print(k);
                  setState(() {
                    myText[k] = 'o';
                    tapped = k;
                  });
                }
              }
            }
          }

        });


  }

  Widget _bottomOptions(){
    return 
    GestureDetector(
      child: Container(
        height:50,
        width:widget.mq.width,
        decoration:BoxDecoration(
          color:Color.fromARGB(255, 78, 76, 76),
          // border:BorderRadius.only(top:Radius.circular(3))),
        ),
        // border:,
        child:
        Row(children: [ 
          GestureDetector(
            child:Container(
            width: MediaQuery.of(context).size.width/2-2,
            decoration: BoxDecoration(
              border: Border(right: BorderSide(width:2,color:Colors.white)),
            ),
            child: Center(child:Text("Level ${level}",style:TextStyle(fontSize: 20,color:Colors.white,decoration: TextDecoration.none))),
            ),
            onTap: (){
              setState((){
                    if(level==1){
                      level=2;
                    }else{
                      if(level==2){
                        level=3;
                      }else{
                        level = 1;
                      }
                    }
                  });
                  restart();
            },
          ),
          GestureDetector(
            child:Container(
            width: MediaQuery.of(context).size.width/2-2,
            child: Center(child:Text("Restart",style:TextStyle(fontSize: 20,color:Colors.white,decoration: TextDecoration.none))),
            ),
            onTap: () async {

              await restart();
            },
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // var h = widget.mq.height;
    // var w = widget.mq.width;
    return 
    SafeArea(child:
    Stack(
      alignment:Alignment.bottomCenter,
      children:[
        Container(
          // decoration: BoxDecoration(
          //   gradient:LinearGradient(colors:[Colors.white,Colors.black]),
          // ),
          child:
    Scaffold(

      appBar:
      PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: 
        Container(
          // decoration:BoxDecoration(
        //     gradient: LinearGradient(colors: [Colors.white,Colors.black],),
        //   ),
          child:
        AppBar(
          centerTitle: true,
          
          backgroundColor: Color.fromARGB(255, 78, 76, 76),
          // preferredSize: ,
          actions: [
            Padding(padding: EdgeInsets.only(right:10),
            child:
            Icon(Icons.menu),),
          ],
          title: Text("Tic Tack Toe"),
        ),
      ),
      ),
      // BoxDecoration()
      // backgroundColor: Colors.grey,
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black87,Colors.black87,Colors.black87,Colors.black87])),
        // color: Colors.grey,
        // height: MediaQuery.of(context).size.height <= 400
            // ? 400
            // : MediaQuery.of(context).size.height,
        // margin: EdgeInsets.all(MediaQuery.of(context).size.width * 3 / 100),
        child:
            new Column(
              // alignment: Alignment.bottomCenter,
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
              Text(
                player1+' : o     ',style: TextStyle(
                  color: Colors.blue[100],
                  // fontSize: h<w?h*8/100:w*8/100,


                    fontSize: MediaQuery.of(context).size.width > 450
                        ? 450 * 5 / 100
                        : MediaQuery.of(context).size.width * 5 / 100
                ),
              ),
              Text(
                player2+' : x',style: TextStyle(
                    color: Colors.blue[100],
                    fontSize: MediaQuery.of(context).size.width > 450
                        ? 450 * 5 / 100
                        : MediaQuery.of(context).size.width * 5 / 100),
              ),
              ]),
          new Row(
            children: [

              Text(
                Message,
                style: TextStyle(
                    color: Colors.blue[100],
                    fontSize: MediaQuery.of(context).size.width > 450
                        ? 450 * 5 / 100
                        : MediaQuery.of(context).size.width * 5 / 100),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _button(0),
              _button(1),
              _button(2),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _button(3),
              _button(4),
              _button(5),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _button(6),
              _button(7),
              _button(8),
            ],
          ),
          // Padding(padding: EdgeInsets.only(top: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
          ]),
        ]),
      ),
      ),
    ),


      _bottomOptions(),

      ]),
    );
  }
}