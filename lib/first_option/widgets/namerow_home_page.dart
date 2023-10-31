import 'package:flutter/material.dart';

Flexible nameRow(
    BuildContext context, AsyncSnapshot<dynamic> snapshot, int index) {
  return Flexible(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 8, 5),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            /*
            Ниже отображается имя пользователя полностью, может занимать несколько строк.
            */
            Text(snapshot.data![index].name.toString(),
                maxLines: 10,
                style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xffff8860),
                    fontWeight: FontWeight.w500))
          ])));
}
