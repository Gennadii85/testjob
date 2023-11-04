import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testjob/cubit/user_cubit.dart';
import '../widgets/buttons_home_page.dart';
import '../widgets/description_home_page.dart';
import '../widgets/image_home_page.dart';
import '../widgets/namerow_home_page.dart';

//
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final PageController controller = PageController();
  /*
      Для вывода данных на UI необходимо использовать Bloc, 
      поставляемый с пакетом flutter_bloc.
      */
  @override
  Widget build(BuildContext context) {
    /*
    обеспечить единоразовый вызов build 
    если у нас StatefulWidget вызвать в initState
    */
    context.read<UserCubit>().fetchUsers();
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state is UserLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is UserLoadedState) {
        List resData = state.loadedUser;
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(title: const Text('Telegram - @Gennadii85')),
              body: Column(children: [
                Expanded(
                  /*
                  вместо PageView.builder можно было использовать ListView.builder
                  и при нажатии на кнопки перехода отображать элемент по ${index+1}
                  а когда index > length --- index = 0
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
                              imageSection(index),
                              nameRow(resData, index),
                              description(index, resData, address)
                            ]));
                      }),
                ),
                buttonsRow(controller),
              ]),
            ));
      }
      if (state is UserErrorState) {
        const Center(child: Text('Произошла ошибка'));
      }
      return const SizedBox.shrink();
    });
  }
}
