import 'package:flutter/material.dart';
import 'package:testjob/model/image_network.dart';
import '../services/user_api.dart';
import 'cart_photos.dart';

Padding imageSection(int index) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
      /*
      FutureBuilder использован в демонстрационных целях 
      как альтернатива Bloc в процессе обработки состояния
      */
      child: FutureBuilder(
        future: UserProvider().fetchPhotos(),
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
