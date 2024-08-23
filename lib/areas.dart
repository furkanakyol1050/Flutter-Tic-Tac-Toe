import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyArea extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var text;

  MyArea({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 248, 234, 1),
          borderRadius: BorderRadius.circular(18),
          border: const Border.fromBorderSide(
            BorderSide(
              width: 5,
              color: Color.fromRGBO(129, 91, 91, 1),
            ),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(89, 69, 69, 1),
            ),
          ),
        ),
      ),
    );
  }
}
