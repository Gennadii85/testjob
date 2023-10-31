import 'package:flutter/material.dart';
import 'package:testjob/apiProvider/user_api.dart';
import 'package:http/http.dart' as http;

import 'widgets/buttons_home_page.dart';
import 'widgets/description_home_page.dart';
import 'widgets/image_home_page.dart';
import 'widgets/namerow_home_page.dart';

class GoodsDetails extends StatelessWidget {
  GoodsDetails({Key? key}) : super(key: key);

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UserProvider().fetchUsers(http.Client()),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            List resData = snapshot.data!;
            return MaterialApp(
                home: Scaffold(
              appBar: AppBar(title: const Text('Telegram - @Gennadii85')),
              body: Column(children: [
                Expanded(
                  /*
                  вместо PageView.builder можно было использовать ListView.builder
                  и при нажатии на кнопки перехода отображать элемент по ${index+1}
                  а когда index> length --- index = 0
                  */
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: controller,
                      itemBuilder: (context, index) {
                        String address =
                            '''address: ${resData[index].address.city}, 
                              ${resData[index].address.street}, 
                              ${resData[index].address.suite}''';
                        /* 
                        Карточка должна быть скролящейся, чтобы была возможность полностью
                        просмотреть описание профиля.
                        */
                        return SingleChildScrollView(
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                              imageSection(index, snapshot),
                              nameRow(context, snapshot, index),
                              description(index, resData, address)
                            ]));
                      }),
                ),
                buttonsRow(controller),
              ]),
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
