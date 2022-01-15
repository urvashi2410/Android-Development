import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final cardChild;
  final Color color;
  final Function onPress;
  const ReusableCard(
      {Key? key,
      required this.cardChild,
      required this.color,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}