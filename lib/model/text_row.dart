import 'package:flutter/material.dart';

//
class TextRow extends StatelessWidget {
  final String text;
  const TextRow({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(text),
      ],
    );
  }
}
