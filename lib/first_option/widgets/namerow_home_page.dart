import 'package:flutter/material.dart';

Flexible nameRow(
    BuildContext context, AsyncSnapshot<dynamic> snapshot, int index) {
  return Flexible(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 8, 5),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(snapshot.data![index].name.toString(),
                style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xffff8860),
                    fontWeight: FontWeight.w500))
          ])));
}
