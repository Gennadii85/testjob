import 'package:flutter/material.dart';

//
class ImageNetwork extends StatelessWidget {
  const ImageNetwork({Key? key, required this.data, required this.index})
      : super(key: key);

  final List data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      data[index],
      fit: BoxFit.fill,
    );
  }
}
