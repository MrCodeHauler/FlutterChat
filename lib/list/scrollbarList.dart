import 'package:flutter/material.dart';

class LetterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return Scrollbar(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: str.split("").map((e) => Text(e)).toList(),
          ),
        ),
      ),
    );
  }
}
