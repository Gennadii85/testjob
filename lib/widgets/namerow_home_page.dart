import 'package:flutter/material.dart';

//
Flexible nameRow(data, index) {
  return Flexible(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 8, 5),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            /*
            Ниже отображается имя пользователя полностью, может занимать несколько строк.
            */
            Text(data[index].name.toString(),
                maxLines: 4,
                style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xffff8860),
                    fontWeight: FontWeight.w500))
          ])));
}
