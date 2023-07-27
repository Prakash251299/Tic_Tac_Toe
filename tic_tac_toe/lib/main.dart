import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
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

// class MyApp extends

var swap=0;
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
  // Widget _bottomOptions(){
  //   return
  //   GestureDetector(
  //     child: Container(
  //       height:50,
  //       // width:widget.mq.width,
  //       decoration:BoxDecoration(
  //         color:Color.fromARGB(255, 78, 76, 76),
  //         // border:BorderRadius.only(top:Radius.circular(3))),
  //       ),
  //       // border:,
  //       child:
  //       Row(children: [
  //         MouseRegion(
  //           cursor: SystemMouseCursors.click,
  //           child:
  //         GestureDetector(
  //           child:Container(
  //           width: MediaQuery.of(context).size.width/2-2,
  //           child: Center(child:Text("Start",style:TextStyle(fontSize: 20,color:Colors.white,decoration: TextDecoration.none))),
  //           ),
  //           onTap: () async {

  //           },
  //         ),
  //         ),
  //         MouseRegion(
  //           cursor: SystemMouseCursors.click,
  //           child:
  //         GestureDetector(
  //           child:Container(
  //           width: MediaQuery.of(context).size.width/2-2,
  //           child: Center(child:Text("Computer",style:TextStyle(fontSize: 20,color:Colors.white,decoration: TextDecoration.none))),
  //           ),
  //           onTap: () async {

  //           },
  //         ),
  //         ),
  //       ]),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SafeArea(
      child:
          // Stack(children: [
          // Positioned.fill(
          //     // width:2000,
          //     // height:1000,
          //     child:
          //     Image(
          //       image: AssetImage('images/ttt1.jpeg'),
          //       fit:BoxFit.cover,
          //     ),
          //   ),

          Stack(alignment: Alignment.bottomCenter, children: [
        Positioned.fill(
          // width:2000,
          // height:1000,
          child: Image(
            image: AssetImage('images/ttt1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        // SizedBox(
        //   width:MediaQuery.of(context).size.width,
        //   height:MediaQuery.of(context).size.height,
        //   child:Image.asset('images/ttt1.jpeg'),
        //   // fit:BoxFit.,
        // ),
        // Image.asset('images/ttt1.jpeg'),
        // Image.asset('images/ttt2.jpeg'),
        // Image(image: 'C://Users//Ishu//AndroidStudioProjects//tic_tac_toe//assets//images//tic_tac_toe_image.png'),
        Container(
          // color:Colors.red,
          // decoration: BoxDecoration(
          //   // gradient: LinearGradient(colors: [Colors.red,Colors.orange]),
          //   // gradient: LinearGradient(colors: [Colors.red,Colors.orange]),
          // ),
          child: Scaffold(
            backgroundColor: Colors.black87.withOpacity(0.7),
            body: Center(
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to Tic Tac Toe!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: mq.width <= 400 ? mq.width / 16 : 24,
                            color: Color.fromARGB(255, 127, 240, 105)),
                      ),
                      SizedBox(height: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SizedBox(
                              // minWidth: 30,
                              width: mq.width <= 400 ? mq.width / 2 : 200,
                              child: ElevatedButton(
                                // backgroundColor: ,
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black.withOpacity(0.7),
                                ),
                                onPressed: () {
                                  _textController.text = '';
                                  _textController1.text = '';
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => CompScreen(mq),
                                    ),
                                  );
                                },
                                child: Text('Single Player',
                                    style: TextStyle(
                                      letterSpacing: 1.0,
                                        fontSize: mq.width <= 400
                                            ? mq.width / 31
                                            : 13)),
                              ),
                            ),
                          ),
                          // SizedBox(width: 16),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SizedBox(
                              width: mq.width <= 400 ? mq.width / 2 : 200,
                              // minWidth: 1000,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black.withOpacity(0.7),
                                ),
                                onPressed: () {
                                  _textController.text = '';
                                  _textController1.text = '';
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => screen1(),
                                    ),
                                  );
                                },
                                child: Text('Multiplayer',
                                    style: TextStyle(
                                      letterSpacing: 1.0,
                                        fontSize: mq.width <= 400
                                            ? mq.width / 31
                                            : 13)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),          ),
        ),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     MouseRegion(
        //       cursor: SystemMouseCursors.click,
        //       child: GestureDetector(
        //         child: Container(
        //           height: 50,
        //           width: MediaQuery.of(context).size.width / 2 - 2,
        //           decoration: BoxDecoration(
        //             border: Border(
        //                 right: BorderSide(width: 2, color: Colors.white)),
        //             color: Color.fromARGB(255, 78, 76, 76),
        //           ),
        //           child: Center(
        //               child: Text("Two players",
        //                   style: TextStyle(
        //                       fontSize: 20,
        //                       color: Colors.white,
        //                       decoration: TextDecoration.none))),
        //         ),
        //         onTap: () {
        //           _textController.text = '';
        //           _textController1.text = '';
        //           Navigator.of(context).push(
        //             MaterialPageRoute(
        //               builder: (context) => screen1(),
        //             ),
        //           );
        //         },
        //       ),
        //     ),
        //     MouseRegion(
        //       cursor: SystemMouseCursors.click,
        //       child: GestureDetector(
        //         child: Container(
        //           height: 50,
        //           width: MediaQuery.of(context).size.width / 2 - 2,
        //           color: Color.fromARGB(255, 78, 76, 76),
        //           child: Center(
        //               child: Text("Computer",
        //                   style: TextStyle(
        //                       fontSize: 20,
        //                       color: Colors.white,
        //                       decoration: TextDecoration.none))),
        //         ),
        //         onTap: () {
        //           _textController.text = '';
        //           _textController1.text = '';
        //           Navigator.of(context).push(
        //             MaterialPageRoute(
        //               builder: (context) => CompScreen(mq),
        //             ),
        //           );
        //         },
        //       ),
        //     ),

        //     // Text('data'),
        //   ],
        // )

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

      // ),
      // ]),
    );
  }
}

class screen1 extends StatefulWidget {
  State createState() => screen1State();
}

class screen1State extends State<screen1> with TickerProviderStateMixin {
  late AnimationController _controller;
  // late AnimationController _controller1;
  // animation color
  late Animation<Color?> _color;
  // late Animation<Color?> _color1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    // color tween
    _color =
        ColorTween(begin: Color.fromARGB(255, 78, 136, 165), end: Color.fromARGB(255, 37, 41, 43)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }









  var a = '';
  var myText = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
      Message = player2 + "'s turn",
      gameEnd = 0;
  var cont = 'x';
  var fill = [10, 10, 10, 10, 10, 10, 10, 10, 10], count = 0;
  restart() {
    setState(() {
      // Message = swap==0?player1+"'s turn":player2 + "'s turn";
      Message = player2 + "'s turn";

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
        child: 
        AnimatedBuilder(
          animation: _color,
          builder: (BuildContext context, Widget? _) {
            return 
        Container(
          decoration: BoxDecoration(
            // color: Colors.purple[200],
            // color: fill[i] != 10 ? Colors.red : Color.fromARGB(255, 61, 88, 62),
            // color: fill[i] != 10 ? Colors.red : Color.fromARGB(255, 37, 41, 43),
            color: fill[i] != 10 ? Colors.red : _color.value,


            // color: fill[i]!=10?Colors.red:tapped==i?Colors.green:
            // Colors.black87,
            // Color.fromARGB(255, 61, 88, 62),
            border: Border.all(width: 0.2, color: Colors.white),
          ),
          width: MediaQuery.of(context).size.width <= 240
              ? 80
              : MediaQuery.of(context).size.width > 500
                  ? 500 / 3
                  : MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height <= 400
              ? 400 / 8.032
              : (MediaQuery.of(context).size.height / 2) / 3,
          child: Center(
            child: Text(myText[i], style: TextStyle(color: Colors.white)),
          ),
        );
          }),
        onTap: () {
          if (myText[i] == ' ') {
            if (gameEnd == 0) {
              setState(() {
                myText[i] = cont;
                if (cont == 'x') {
                  Message = player1 + "'s turn";
                  cont = 'o';
                } else {
                  Message = player2 + "'s turn";
                  cont = 'x';
                }
                _check();
                // cont = 'x';
                // _changeText(i);
              });
            }
          }
          // else{
          //   setState(() {
          //     Message = "Game over";
          //   });
          // }
          // print(i);
        });
  }

  Widget _bottomOptions() {
    return GestureDetector(
      child: Container(
        height: 50,
        // width:widget.mq.width,
        decoration: BoxDecoration(
          color: Colors.black87.withOpacity(0.3),
          // border:BorderRadius.only(top:Radius.circular(3))),
        ),
        // border:,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: Container(
                // width: MediaQuery.of(context).size.width/2-2,
                child: Center(
                    child: Text("Restart",
                        style: TextStyle(
                          letterSpacing:1.0,

                            fontSize: 20,
                            color: Colors.blue,
                            // color: Color.fromARGB(255, 127, 240, 105),
                            decoration: TextDecoration.none))),
              ),
              onTap: () async {
                await restart();
              },
            ),
          ),
        ]),
      ),
    );
  }

  Widget hamburgerOptions() {
    var mq = MediaQuery.of(context).size;
    return
        // Column(children: [
        Card(
      // margin: EdgeInsets.symmetric(horizontal:mq.width*0.04,vertical:mq.height*0.01),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Center(
          child: GestureDetector(
            child: Container(
              child:
                  // Row(
                  // mainAxisAlignment: ,
                  // children: [
                  Text(
                "Source code",
                style: TextStyle(
                    fontSize:
                        mq.width > 600 ? 600 * 3 / 100 : mq.width * 3 / 100),
              ),
            ),
            onTap: () {
              launch('https://github.com/Prakash251299/Tic_Tac_Toe');
              // print("asjhd");
            },
          ),
          // ]),
        ),
      ),
    );
  }

  Widget _hamburger() {
    // hamburger = 0;
    var mq = MediaQuery.of(context).size;
    return GestureDetector(
        child: Container(
            // height:20,
            // width:200,
            // color:Colors.red,
            // margin: EdgeInsets.symmetric(horizontal:mq.width*0.04,vertical:mq.height*0.01),
            // shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
            child: Column(
          children: [
            if (hamburger == 1) ...{
              Container(
                // height: MediaQuery.of(context).size.height <= 200
                //     ? 200
                //     : MediaQuery.of(context).size.height,
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width <= 240
                    ? 240 * 35 / 100
                    : MediaQuery.of(context).size.width >= 550
                        ? 550 * 35 / 100
                        : MediaQuery.of(context).size.width * 35 / 100,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                // color: Colors.blueGrey,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  Container(
                    // margin: EdgeInsets.only(
                    //     bottom:
                    //         MediaQuery.of(context).size.width <=
                    //                 240
                    //             ? 240 * 9 / 100
                    //             : MediaQuery.of(context)
                    //                         .size
                    //                         .width >=
                    //                     600
                    //                 ? 600 * 9 / 100
                    //                 : MediaQuery.of(context)
                    //                         .size
                    //                         .width *
                    //                     9 /
                    //                     100),
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (c, i) {
                          return MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Column(
                                children: [
                                  hamburgerOptions(),
                                ],
                              ));
                        }),
                  ),
                ]),
              ),
            },
            // ListTile(),
          ],
        )),
        onTap: () {
          setState(() {
            hamburger = 0;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    // var h = widget.mq.height;
    // var w = widget.mq.width;
    var selected = 0;
    return SafeArea(
      // backgroundColor:
      child: Stack(alignment: Alignment.bottomCenter, children: [
        // Positioned.fill(
        //   // width:2000,
        //   // height:1000,
        //   child: Image(
        //     image: AssetImage('images/ttt2.jpeg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),


        GestureDetector(
          child: 
        Container(
            // decoration: BoxDecoration(
            //   gradient:LinearGradient(colors:[Colors.white,Colors.black]),
            // ),

            // color:Colors.black,
            child: Scaffold(

              extendBodyBehindAppBar: true,
              // backgroundColor: Colors.black87.withOpacity(0.7),
              backgroundColor: Colors.black87,
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
                    // backgroundColor: Colors.black87.withOpacity(1),
                    backgroundColor: Colors.black87,
                    elevation:0,
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



                color: Colors.black87,
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
                            Padding(padding: EdgeInsets.only(bottom:10),child:
                            Text(
                              player1 + ' : o     ',
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
                            Padding(padding: EdgeInsets.only(bottom:10),child:
                            Text(
                              player2 + ' : x',
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

        // _bottomOptions(),



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
                  Message = player2+"'s turn";
                  // tapped = 4;
                }else{
                  swap=0;
                  var c;
                  c=player2;
                  player2=player1;
                  player1=c;
                  Message = player2+"'s turn";
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

    Padding(padding: EdgeInsets.only(right:20, bottom: 20),
    child:
    Align(alignment: Alignment.bottomRight,
      child:FloatingActionButton(
        heroTag: null,
            backgroundColor: Color.fromARGB(255, 54, 54, 54),
            onPressed: () async {
              await restart();
            },
            hoverColor: Colors.red,
            // hoverElevation: 5,
            // onFocus
            child: Icon(Icons.restart_alt_rounded,color:Colors.white),
          ),
        ),
        ),



      ]),
    );
  }
}
