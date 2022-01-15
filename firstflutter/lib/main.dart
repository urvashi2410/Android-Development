import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// override is used to give my app's build more weightage than the inherited one
class MyApp extends StatelessWidget {
  void onPressButtonFunction() {
    print('Button is pressed by the user');
  }

  void elevatedButtonPressed() {
    print('Elevated button is pressed by the user');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // to disable the debug
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          title: const Text('Flutter'),
          leading: const Icon(Icons.menu),
          actions: [Icon(Icons.notification_add_outlined)],
        ),
        //   body: Center(
        //     child: Image.asset('assets/images/flutterImg.png'),
        // ),

        // body: Center(
            //     child: Text(
            //   "Hello Flutter",
            //   style: TextStyle(
            //       fontWeight: FontWeight.w900, fontSize: 50, color: Colors.cyan),
            // )),
        //     child: ElevatedButton(
        //   onPressed: elevatedButtonPressed,
        //   child: Text('Click me'),
        // )),
        
        // body: Container(
        //   color: Colors.amber,
        //   // container wrap up its child and take space equals to the child size only 
        //   child: Text('This is my text'),
        //   // for all directions padding 
        //   padding: EdgeInsets.all(10),
        //   // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20)
        //   // padding: EdgeInsets.only(right: 20, top: 45),
        //   margin: EdgeInsets.all(20),
        // ),

        // body: Padding(
        //   padding: EdgeInsets.all(20),
        //   child: Text("hello Flutter this side Urvashi Anand"),),

        // body: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //   Container(
        //   padding: EdgeInsets.all(20),
        //   color: Colors.blue,
        //   child: Icon(Icons.ac_unit),
        //   ),
        //   Container(
        //   padding: EdgeInsets.all(20),
        //   color: Colors.pink,
        //   child: Icon(Icons.ac_unit),
        //   ),
        //   Container(
        //   padding: EdgeInsets.all(20),
        //   color: Colors.yellow,
        //   child: Icon(Icons.ac_unit),
        //   ),
        // ]
        // ),

        // Homework :-D 
        // body: TextButton(
        //  onPressed: () {},
        //     child: Text('Simple Button'),
        //   ),

        // body:TextButton.icon(
        //     icon: Icon(Icons.camera),
        //     label: Text('Take A Photo'),
        //     onPressed: () {},
        //   ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
          padding: EdgeInsets.all(20),
          color: Colors.yellow,
          child: Icon(Icons.ac_unit),
          ),
          Container(
          padding: EdgeInsets.all(10),
          color: Colors.blue,
          child: Icon(Icons.ac_unit),
          ),
          Container(
          padding: EdgeInsets.all(5),
          color: Colors.pink,
          child: Icon(Icons.ac_unit),
          ),
          ],),

        // don't use const jab function call kre ya api call kre ya koi dynamic cheez ho to
        floatingActionButton: FloatingActionButton(
          // calling pointer to the function so that it will run on clicking the button
          onPressed: onPressButtonFunction,
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
// Raisedbutton
// Flatbutton
// both of these buttons are depreciated in flutter 2
