import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'playWithComputer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

var player1 = 'John',
    player2 = 'Roman',
    _textController = TextEditingController(),
    _textController1 = TextEditingController();
// var mq = MediaQuery.of(context).size;
var name = 'Default: player1 = John, Player2 = Roman';
var withComputer = 0;

class MyApp extends StatefulWidget {
  State createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  Widget _bottomOptions(){
    return 
    GestureDetector(
      child: Container(
        height:50,
        // width:widget.mq.width,
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
            child: Center(child:Text("Start",style:TextStyle(fontSize: 20,color:Colors.white,decoration: TextDecoration.none))),
            ),
            onTap: () async {
              
            },
          ),
          GestureDetector(
            child:Container(
            width: MediaQuery.of(context).size.width/2-2,
            child: Center(child:Text("Computer",style:TextStyle(fontSize: 20,color:Colors.white,decoration: TextDecoration.none))),
            ),
            onTap: () async {

            },
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return 
    SafeArea(child:
    Stack(
      alignment:Alignment.bottomCenter,
      children: [
        Container(child:
      Scaffold(
        backgroundColor: Colors.black87,
        body: 
        // Center(
        //   // ListView.builder(itemBuilder: (context){})
        //   child: 
          Container(
            height: MediaQuery.of(context).size.height <= 400
                ? 400
                : MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // children:[
              //   new Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  Text(
                    name,
                    style: TextStyle(
                      // color: Color.fromARGB(255, 240, 234, 234),
                      color: Colors.white,
                    fontSize:mq.width>600?600*4/100:mq.width*4/100),
                  )
                ]),
                TextField(
                  controller: _textController,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    // color
                    
                    hintText: 'Name of Player 1',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  onChanged: (val){
                    player1 = val;
                    // _textController.text = '';
                  },
                ),
                TextField(
                  controller: _textController1,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Name of Player 2',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  onChanged: (val){
                    player2 = val;
                  },
                ),
                //   ],
                // ),
                // Padding(padding: EdgeInsets.only(bottom: 10)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    // ElevatedButton(
                    //     child: Text('Start'),
                    //     onPressed: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => screen1(),
                          //   ),
                          // );
                    //       setState(() {
                    //         player1 = _textController.text;
                    //         player2 = _textController1.text;
                    //         if (player1 == '') {
                    //           player1 = 'John';
                    //         }
                    //         if (player2 == '') {
                    //           player2 = 'Roman';
                    //         }
                    //       });
                    //     }),

                        // SizedBox(height: 10,),

                    // ElevatedButton(
                    //     child: Text('Computer'),
                    //     onPressed: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => CompScreen(mq),
                          //   ),
                          // );
                    //       setState(() {
                    //         withComputer = 1;
                    //         // player1 = _textController.text;
                    //         // player2 = _textController1.text;
                    //         // if (player1 == '') {
                    //         //   player1 = 'John';
                    //         // }
                    //         // if (player2 == '') {
                    //         //   player2 = 'Roman';
                    //         // }
                    //       });
                    //     }),
                  ],
                ),
              ],
            ),
          // ),
        ),
      ),
      ),
      // Container(
      //   height:10,
      //   width:10,
      //   color:Colors.red,
      //   // child: ,
      // ),
      // Text("hjfjhgkj"),


      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child:
          Container(
            height:50,
            width: MediaQuery.of(context).size.width/2-2,
            decoration: BoxDecoration(
              border: Border(right: BorderSide(width:2,color:Colors.white)),
              color:Color.fromARGB(255, 78, 76, 76),
            ),
            child:Center(child: Text("Two players",style:TextStyle(fontSize: 20,color:Colors.white,decoration: TextDecoration.none))),
          ),
          onTap: (){
            _textController.text = '';
            _textController1.text = '';
            Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => screen1(),
                            ),
                          );
          },
          ),
          GestureDetector(
            child:
          Container(
            height:50,
            width: MediaQuery.of(context).size.width/2-2,
            color:Color.fromARGB(255, 78, 76, 76),
            child:Center(child: Text("Computer",style:TextStyle(fontSize: 20,color:Colors.white,decoration: TextDecoration.none))),
          ),
          onTap: (){
            _textController.text = '';
            _textController1.text = '';
            Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CompScreen(mq),
                            ),
                          );
          },
          ),

        // Text('data'),
      ],)

      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      // GestureDetector(
      //       child:Container(
      //         // color:Colors.red,
      //       width: MediaQuery.of(context).size.width,
      //       // child:Center(
      //         child:Text("Start",style:TextStyle(fontSize: 20,color:Colors.white,decoration: TextDecoration.none))
      //         // ),
      //       ),
      //       onTap: () async {

      //         // await restart();
      //       },
      //     ),
      // ]),


      // GestureDetector(
      //       child:Container(
      //       width: MediaQuery.of(context).size.width/2-2,
      //       child: Center(child:Text("Computer",style:TextStyle(fontSize: 20,color:Colors.white,decoration: TextDecoration.none))),
      //       ),
      //       onTap: () async {

      //         // await restart();
      //       },
      //     ),



    ]),
    );
  }
}

class screen1 extends StatefulWidget {
  State createState() => screen1State();
}

class screen1State extends State<screen1> {
  var a = '';
  var myText = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
      Message = player2 +"'s turn",
      gameEnd = 0;
  var cont = 'x';
  var fill = [10, 10, 10, 10, 10, 10, 10, 10, 10], count = 0;
  restart() {
    setState(() {
      Message = player2+"'s turn";
      cont = 'x';
      for (var j = 0; j < 9; j++) {
        myText[j] = ' ';
        fill[j] = 10;
      }
      // a = '';
      count = 0;
      gameEnd = 0;
    });
  }

  _check() {
    setState(() {
      if (myText[0] == 'o' && myText[1] == 'o' && myText[2] == 'o') {
        Message = player1 + ' wins';
        fill[0] = 0;
        fill[1] = 1;
        fill[2] = 2;
        gameEnd = 1;
      }
      if (myText[0] == 'o' && myText[3] == 'o' && myText[6] == 'o') {
        Message = player1 + ' wins';
        fill[0] = 0;
        fill[3] = 3;
        fill[6] = 6;
        gameEnd = 1;
      }
      if (myText[4] == 'o' && myText[3] == 'o' && myText[5] == 'o') {
        Message = player1 + ' wins';
        fill[4] = 4;
        fill[3] = 3;
        fill[5] = 5;
        gameEnd = 1;
      }
      if (myText[4] == 'o' && myText[1] == 'o' && myText[7] == 'o') {
        Message = player1 + ' wins';
        fill[4] = 4;
        fill[1] = 1;
        fill[7] = 7;
        gameEnd = 1;
      }
      if (myText[8] == 'o' && myText[6] == 'o' && myText[7] == 'o') {
        Message = player1 + ' wins';
        fill[8] = 8;
        fill[6] = 6;
        fill[7] = 7;
        gameEnd = 1;
      }
      if (myText[8] == 'o' && myText[2] == 'o' && myText[5] == 'o') {
        Message = player1 + ' wins';
        fill[8] = 8;
        fill[5] = 5;
        fill[2] = 2;
        gameEnd = 1;
      }
      if (myText[4] == 'o' && myText[2] == 'o' && myText[6] == 'o') {
        Message = player1 + ' wins';
        fill[4] = 4;
        fill[6] = 6;
        fill[2] = 2;
        gameEnd = 1;
      }
      if (myText[4] == 'o' && myText[0] == 'o' && myText[8] == 'o') {
        Message = player1 + ' wins';
        fill[0] = 0;
        fill[4] = 4;
        fill[8] = 8;
        gameEnd = 1;
      }
      if (myText[0] == 'x' && myText[1] == 'x' && myText[2] == 'x') {
        Message = player2 + ' wins';
        fill[0] = 0;
        fill[1] = 1;
        fill[2] = 2;
        gameEnd = 1;
      }
      if (myText[0] == 'x' && myText[3] == 'x' && myText[6] == 'x') {
        Message = player2 + ' wins';
        fill[0] = 0;
        fill[3] = 3;
        fill[6] = 6;
        gameEnd = 1;
      }
      if (myText[4] == 'x' && myText[1] == 'x' && myText[7] == 'x') {
        Message = player2 + ' wins';
        fill[4] = 4;
        fill[1] = 1;
        fill[7] = 7;
        gameEnd = 1;
      }
      if (myText[4] == 'x' && myText[3] == 'x' && myText[5] == 'x') {
        Message = player2 + ' wins';
        fill[4] = 4;
        fill[5] = 5;
        fill[3] = 3;
        gameEnd = 1;
      }
      if (myText[8] == 'x' && myText[6] == 'x' && myText[7] == 'x') {
        Message = player2 + ' wins';
        fill[6] = 6;
        fill[7] = 7;
        fill[8] = 8;
        gameEnd = 1;
      }
      if (myText[8] == 'x' && myText[2] == 'x' && myText[5] == 'x') {
        Message = player2 + ' wins';
        fill[8] = 8;
        fill[5] = 5;
        fill[2] = 2;
        gameEnd = 1;
      }
      if (myText[4] == 'x' && myText[0] == 'x' && myText[8] == 'x') {
        Message = player2 + ' wins';
        fill[0] = 0;
        fill[4] = 4;
        fill[8] = 8;
        gameEnd = 1;
      }
      if (myText[4] == 'x' && myText[2] == 'x' && myText[6] == 'x') {
        Message = player2 + ' wins';
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

  _button(int i) {
    return InkWell(
        child: Container(
            decoration: BoxDecoration(
              color: fill[i]!=10?Colors.red:Color.fromARGB(255, 61, 88, 62),
              // color:Colors.grey,
              border: Border.all(width: 0.2, color: Colors.white),
            ),
            // height: MediaQuery.of(context).size.height <= 400
                // ? 400 * 20 / 100
                // : MediaQuery.of(context).size.height * 20 / 100,
                height: MediaQuery.of(context).size.width>700?700*20/100:MediaQuery.of(context).size.width * 20 / 100,
            width: MediaQuery.of(context).size.width>700?700*20/100:MediaQuery.of(context).size.width * 20 / 100,
            // child:Center(child:Text(myText[i],style: TextStyle(color: Color.fromARGB(255, 235, 171, 167)),)),
            child: Center(
              child: Text(myText[i], style: TextStyle(color: Colors.white)),
            )
            // child:Text(i.toString(),style: TextStyle(color: Colors.red),),
            ),
        onTap: () {
          if (gameEnd == 0) {
            setState(() {
              myText[i] = cont;
              if (cont == 'x') {
                Message = player1 +"'s turn";
                cont = 'o';
              } else {
                Message = player2 +"'s turn";
                cont = 'x';
              }
              _check();
              // cont = 'x';
              // _changeText(i);
            });
          }
          // else{
          //   setState(() {
          //     Message = "Game over";
          //   });
          // }
          // print(i);
        });
  }

  Widget _bottomOptions(){
    return 
    GestureDetector(
      child: Container(
        height:50,
        // width:widget.mq.width,
        decoration:BoxDecoration(
          color:Color.fromARGB(255, 78, 76, 76),
          // border:BorderRadius.only(top:Radius.circular(3))),
        ),
        // border:,
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
            
          // ]),
        ]),
      ),
      ),
    ),


      _bottomOptions(),

      ]),
    );
  }
}
