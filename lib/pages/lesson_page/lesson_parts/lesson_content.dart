import 'package:flutter/material.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/img_in_lesson_widget.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/text_in_lesson_widget.dart';

class LessonContent extends StatefulWidget {

  LessonContent({super.key});

  @override
  State<LessonContent> createState() => _LessonContentState();
}

class _LessonContentState extends State<LessonContent> {
  List<bool> _buttonStates = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Visibility(
            visible: _buttonStates[0],
            child: Column(
              children: [
                const Row(
                  children: [
                    Flexible(
                      child: TextParagraph(customText: [
                        TextSpan(text: "З розвитком людства в давні часи з’явилося багато проблем, які вимагали створення "
                                      "нової науки – математики. Спочатку задачі були прості: порахувати кількість голів худоби, кількість "
                                      "деревини і продуктів, що приготували. Щоб відповісти на питання “Скільки?” людство винайшло натуральні числа.\n\nОтже, ", style: TextStyle(fontSize: 16)),

                        TextSpan(text: "Натуральні числа – числа, які використовуються при лічбі\n", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

                        TextSpan(text: "Найменше натуральне число 1, оскільки 0 не є натуральним числом.", style: TextStyle(fontSize: 16)),
                        TextSpan(text: "Найбільшого натурального числа не існує. Неважливо, наскільки велике число ви придумаєте, " 
                                        "до нього завжди можна додати 1 або будь-яке інше число.", style: TextStyle(fontSize: 16)),
                        TextSpan(text: "Дроби, від’ємні числа і число 0 не є натуральними в свою чергу.\n\n", style: TextStyle(fontSize: 16)),
                        TextSpan(text: "Тепер поговоримо про натуральний ряд.\n", style: TextStyle(fontSize: 16)),
                        TextSpan(text: "Натуральний ряд - це всі натуральні числа записані по порядку від 1, тобто\n"
                                        "1,2,3,4,5,6,7,8,9… - натуральний ряд\n\n", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        TextSpan(text: "Над натуральними числами можна виконувати операції тільки множення і додавання, тоді результатом буде також натуральне число\n" 
                                        "Операції віднімання і ділення над натуральними числами можуть виводити за рамки натуральних чисел\n\n", style: TextStyle(fontSize: 16)),
                        TextSpan(text: "Наприклад:\n", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16)),
                        TextSpan(text: "15+273=288\n15- натуральне число, 273 – натуральне число, 288- натуральне число\n"
                                       "2*23=46, усі три числа також є натуральними, втім 5:2=2, 5 – натуральне число, 2 – також натуральне число, втім 2 не натуральне\n" 
                                       "Також з відніманням, якщо ви віднімаєте більше число від меншого то отримуєте число, яке менше за 0, а від’ємні числа не є натуральними", style: TextStyle(fontSize: 16)),
                      ],),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            _buttonStates[1] = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,  
                          shadowColor: Colors.black, 
                          elevation: 5,
                        ),
                        child: const SizedBox(
                          height: 50,
                          width: 100,
                          child: Center(child: Text("Next", style: TextStyle(color: Colors.white, fontSize: 16),),),
                        ),
                      ),
                    ),
                ],),
              ],
            ),
          ),
          Visibility(
            visible: _buttonStates[1],
            child: Column(
              children: [
                const Row(
                  children: [
                    Flexible(
                      child: TextParagraph(customText: [
                        TextSpan(text: "Як ми вже з’ясували, натуральні числа позначають кількість предметів. І так само як ми можемо"
                        "порівнювати кількості предметів (наприклад, казати, що яблук у кошику більше ніж груш), ми також можемо" 
                        "порівнювати натуральні числа. Наприклад, число 5 більше ніж число 2.\n", style: TextStyle(fontSize: 16)),

                        TextSpan(text: "Результат порівняння чисел записуємо за допомогою знаків “>” (більше) або “<” (менше). Наприклад:\n"
                        "1.) 7 > 5 (читаємо: “сім більше за п’ять”);\n2.) 5 < 7 (читаємо: “п’ять менше за сім”). \nЯкий знак використовувати в якій ситуації "
                        "можна легко запам’ятати, якщо уявити, що знак порівняння – це дзьоб голодного птаха. Зрозуміло, що цей птах розкриватиме "
                        "дзьоба в ту сторону, де буде більше число.\n\n", style: TextStyle(fontSize: 16)),

                        TextSpan(text: "      Правила порівняння натуральних чисел:\n     ", style: TextStyle(fontSize: 16)),
                        TextSpan(text: "1.) Якщо два натуральних числа мають різну кількість цифр, то більшим буде те, у якого більше знаків.\n"
                        "Наприклад, число 733 більше за 54, оскільки кількість знаків у 733 більша за кількість знаків у 54.\n2.) Якщо два натуральних " 
                        "числа мають однакову кількість цифр, то більшим числом є те, яке має більшу цифру у найвищому розряді. Якщо цифри у найвищому "
                        "розряді однакові, то порівнюють цифри наступного розряду і т. д.\nПорівняймо числа 4723 і 4750.\nКількість знаків у числах однакова, "
                        "тому порівняймо їхні перші цифри. 4 = 4, тому порівняємо наступні цифри. 7 = 7, тому порівняємо наступні. 2 < 5, тому число 4750 > 4723.", style: TextStyle(fontSize: 16)),
                      ],),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          _buttonStates[2] = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,  
                        shadowColor: Colors.black, 
                        elevation: 5,
                      ),
                      child: const SizedBox(
                        height: 50,
                        width: 100,
                        child: Center(child: Text("Next", style: TextStyle(color: Colors.white),),),
                      ),
                    ),
                ],),
              ],
            ),
          ),
          Visibility(
            visible: _buttonStates[2],
            child: Column(
              children: [
                const Row(
                  children: [
                    Flexible(
                      child: TextParagraph(customText: [
                        TextSpan(text: "Як ми вже з’ясували, натуральні числа позначають кількість предметів. І так само як ми можемо"
                        "порівнювати кількості предметів (наприклад, казати, що яблук у кошику більше ніж груш), ми також можемо" 
                        "порівнювати натуральні числа. Наприклад, число 5 більше ніж число 2.\n"),

                        TextSpan(text: "Результат порівняння чисел записуємо за допомогою знаків “>” (більше) або “<” (менше). Наприклад:\n"
                        "1.) 7 > 5 (читаємо: “сім більше за п’ять”);\n2.) 5 < 7 (читаємо: “п’ять менше за сім”). \nЯкий знак використовувати в якій ситуації "
                        "можна легко запам’ятати, якщо уявити, що знак порівняння – це дзьоб голодного птаха. Зрозуміло, що цей птах розкриватиме "
                        "дзьоба в ту сторону, де буде більше число.\n\n", style: TextStyle()),

                        TextSpan(text: "      Правила порівняння натуральних чисел:\n     ", style: TextStyle()),
                        TextSpan(text: "1.) Якщо два натуральних числа мають різну кількість цифр, то більшим буде те, у якого більше знаків.\n"
                        "Наприклад, число 733 більше за 54, оскільки кількість знаків у 733 більша за кількість знаків у 54.\n2.) Якщо два натуральних " 
                        "числа мають однакову кількість цифр, то більшим числом є те, яке має більшу цифру у найвищому розряді. Якщо цифри у найвищому "
                        "розряді однакові, то порівнюють цифри наступного розряду і т. д.\nПорівняймо числа 4723 і 4750.\nКількість знаків у числах однакова, "
                        "тому порівняймо їхні перші цифри. 4 = 4, тому порівняємо наступні цифри. 7 = 7, тому порівняємо наступні. 2 < 5, тому число 4750 > 4723.", style: TextStyle()),
                      ],),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: (){},
                      child: const SizedBox(
                        height: 50,
                        width: 100,
                        child: Text("Next", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                ],),
              ],
            ),
          ),
          Visibility(
            visible: _buttonStates[3],
            child: Column(
              children: [
                const Row(
                  children: [
                    Flexible(
                      child: TextParagraph(customText: [
                        TextSpan(text: "Як ми вже з’ясували, натуральні числа позначають кількість предметів. І так само як ми можемо"
                        "порівнювати кількості предметів (наприклад, казати, що яблук у кошику більше ніж груш), ми також можемо" 
                        "порівнювати натуральні числа. Наприклад, число 5 більше ніж число 2.\n"),

                        TextSpan(text: "Результат порівняння чисел записуємо за допомогою знаків “>” (більше) або “<” (менше). Наприклад:\n"
                        "1.) 7 > 5 (читаємо: “сім більше за п’ять”);\n2.) 5 < 7 (читаємо: “п’ять менше за сім”). \nЯкий знак використовувати в якій ситуації "
                        "можна легко запам’ятати, якщо уявити, що знак порівняння – це дзьоб голодного птаха. Зрозуміло, що цей птах розкриватиме "
                        "дзьоба в ту сторону, де буде більше число.\n\n", style: TextStyle()),

                        TextSpan(text: "      Правила порівняння натуральних чисел:\n     ", style: TextStyle()),
                        TextSpan(text: "1.) Якщо два натуральних числа мають різну кількість цифр, то більшим буде те, у якого більше знаків.\n"
                        "Наприклад, число 733 більше за 54, оскільки кількість знаків у 733 більша за кількість знаків у 54.\n2.) Якщо два натуральних " 
                        "числа мають однакову кількість цифр, то більшим числом є те, яке має більшу цифру у найвищому розряді. Якщо цифри у найвищому "
                        "розряді однакові, то порівнюють цифри наступного розряду і т. д.\nПорівняймо числа 4723 і 4750.\nКількість знаків у числах однакова, "
                        "тому порівняймо їхні перші цифри. 4 = 4, тому порівняємо наступні цифри. 7 = 7, тому порівняємо наступні. 2 < 5, тому число 4750 > 4723.", style: TextStyle()),
                      ],),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: (){},
                      child: const SizedBox(
                        height: 50,
                        width: 100,
                        child: Text("Next", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                ],),
              ],
            ),
          ),
      ],
    );
  }
}