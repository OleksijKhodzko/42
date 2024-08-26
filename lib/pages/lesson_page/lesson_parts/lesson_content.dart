import 'package:flutter/material.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/img_in_lesson_widget.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/text_in_lesson_widget.dart';

class LessonContent extends StatelessWidget {

  const LessonContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: 
              Column(children: [
                const Row(
                  children: [
                    Flexible(
                      child: TextParagraph(customText: [
                        TextSpan(text: "Як ми вже з’ясували, натуральні числа позначають кількість предметів." 
                        "І так само як ми можемо порівнювати кількості предметів (наприклад, казати, що яблук" 
                        "у кошику більше ніж груш), ми також можемо порівнювати натуральні числа." 
                        "Наприклад, число 5 більше ніж число 2.\n"
                        "Результат порівняння чисел записуємо за допомогою знаків “>” (більше)" 
                        "або “<” (менше). Наприклад:\n"
                        "1.) 7 > 5 (читаємо: “сім більше за п’ять”);\n"
                        "2.) 5 < 7 (читаємо: “п’ять менше за сім”).\n"),
                        TextSpan(text: "Який знак використовувати в якій ситуації можна легко запам’ятати, якщо "
                        "уявити, що знак порівняння – це дзьоб голодного птаха. Зрозуміло, що цей птах розкриватиме"
                        "дзьоба в ту сторону, де буде більше число.", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(child: LessonIllustration(ref: "/lessons_illustrations/class_5/Math/lesson_1/test.gif")),
                  ],
                ),
                const Row(
                  children: [
                    Flexible(
                      child: TextParagraph(customText: [
                        TextSpan(text: "Правила порівняння натуральних чисел:\n"),
                        TextSpan(text: "1.) Якщо два натуральних числа мають різну кількість цифр, то більшим буде те, у якого більше знаків.\n"
                        "Наприклад, число 733 більше за 54, оскільки кількість знаків у 733 більша за кількість знаків у 54.\n"),
                        TextSpan(text: "2.) Якщо два натуральних числа мають однакову кількість цифр, то більшим числом є те, яке має більшу"
                        "цифру у найвищому розряді. Якщо цифри у найвищому розряді однакові, то порівнюють цифри наступного розряду і т. д.\n"
                        "Порівняймо числа 4723 і 4750.\n"
                        "Кількість знаків у числах однакова, тому порівняймо їхні перші цифри. 4 = 4, тому порівняємо наступні цифри. 7 = 7,"
                        "тому порівняємо наступні. 2 < 5, тому число 4750 > 4723."),
                      ],),
                    )
                  ],
                ),
                // Row(
                //   children: [
                //     ElevatedButton(
                //       onPressed: (){},
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: Colors.green, 
                //         foregroundColor: Colors.white, 
                //       ),
                //       child: Text("Finish Lesson", style: TextStyle(fontSize: 14))),
                //   ],
                // ),
              ],)
            );
  }
}