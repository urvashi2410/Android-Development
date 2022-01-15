import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String data;
  final Color textColor;
  final String belowText;
  final Color bgColor;
  const MyCard(
      {Key? key,
      required this.data,
      required this.textColor,
      required this.belowText,
      required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                belowText,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
