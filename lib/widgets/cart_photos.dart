// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../model/image_network.dart';

class CartPhotos extends StatelessWidget {
  final List data;
  const CartPhotos({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 300.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ImageNetwork(
            data: data,
            index: index,
          );
        });
  }
}
