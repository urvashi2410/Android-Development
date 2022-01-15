import 'dart:math';

import 'package:flutter/material.dart';

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int selectedNumberRight = Random().nextInt(6) + 1;
  int selectedNumberLeft = Random().nextInt(6) + 1;
  void generateNumberRight() {
    setState(() {
      selectedNumberRight = Random().nextInt(6) + 1;
    });
  }
  void generateNumberLeft() {
    setState(() {
      selectedNumberLeft = Random().nextInt(6) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('The Dice'),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                onTap: generateNumberLeft,
                child: Image.asset('assets/images/dice-${selectedNumberLeft}.png')
                ),
              ),
              Expanded(
                child: InkWell(
                onTap: generateNumberRight,
                child: Image.asset('assets/images/dice-${selectedNumberRight}.png')
                ),
              ),
            ],)
        ),
      ),
    );
  }
}
