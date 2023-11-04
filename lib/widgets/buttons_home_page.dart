import 'package:flutter/material.dart';

Container buttonsRow(controller) {
  /*
    Переключатель карточек
Зафиксирован внизу страницы. Содержит две кнопки - стрелочку назад и стрелочку вперед
 - по нажатию которых происходит переход к следующей карточке пользователя.
  Переключение должно быть цикличным и не ограниченным кол-вом карточек в списке. 
  Переключатель не меняет свое положение при изменении карточки
    */
  //
  return Container(
      color: const Color(0xffe6eae5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: [
            IconButton(
              onPressed: () {
                // здесь можно было использовать Cubit но у виджета есть свой метод для этого
                controller.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear);
              },
              iconSize: 35,
              icon:
                  const Icon(Icons.arrow_circle_left, color: Color(0xffff8860)),
            ),
            const SizedBox(width: 15),
            IconButton(
              onPressed: () {
                controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear);
              },
              iconSize: 35,
              icon: const Icon(Icons.arrow_circle_right,
                  color: Color(0xffff8860)),
            )
          ])
        ],
      ));
}
