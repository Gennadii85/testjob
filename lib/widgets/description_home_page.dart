// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../model/text_row.dart';

Column description(int index, List<dynamic> resData, String address) {
  return Column(children: [
    Row(children: [
      CircleAvatar(
        radius: 15,
        backgroundColor: Colors.green[300],
        child: Text(
          '${index + 1}',
          style: const TextStyle(color: Colors.black),
        ),
      ),
      Expanded(
          child: ListTile(
              title: Text(resData[index].username.toString()),
              /*
          Название компании занимает одну строку и обрезается с помощью
          троеточия, если не помещается в ширину карточки.
          */
              subtitle: Text(resData[index].company.name.toString(),
                  overflow: TextOverflow.ellipsis)))
    ]),
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      /*
      пример переиспользования кода
      */
      TextRow(text: 'email: ${resData[index].email}'),
      TextRow(text: 'phone: ${resData[index].phone}'),
      TextRow(text: 'website: ${resData[index].website}'),
      TextRow(text: 'company: ${resData[index].company}'),
      Text(address, overflow: TextOverflow.ellipsis),
    ])
  ]);
}
