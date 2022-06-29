import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  // This widget is the root of your application.

  final double radius;
  final double hit;
  final String val;

  const Button({
    Key? key,
    this.radius = 15.0,
    this.hit = 50,
    required this.val,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(this.radius)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: this.hit,
      width: double.infinity,
      child: MaterialButton(
        onPressed: () {},
        color: Colors.blue,
        child: Text(
          this.val,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
