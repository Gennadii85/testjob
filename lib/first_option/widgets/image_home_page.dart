import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testjob/first_option/model/image_network.dart';
import '../../apiProvider/user_api.dart';
import 'cart_photos.dart';

Padding imageSection(int index, data) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
      child: FutureBuilder(
        future: UserProvider().fetchPhotos(http.Client()),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            List thumbnailUrl =
                snapshot.data!.map((e) => e.thumbnailUrl).toList();
            List url = snapshot.data!.map((e) => e.url).toList();
            return InkResponse(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CartPhotos(data: thumbnailUrl);
                    });
              },
              child: ImageNetwork(data: url, index: index),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ));
}
