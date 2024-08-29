import 'package:flutter/material.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/img_in_lesson_widget.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/text_in_lesson_widget.dart';
import 'package:fortytwo/pages/lesson_page/lesson_page.dart';

List<bool> _buttonStates = [true, false, false, false, false, false, false, false, false];
final List<GlobalKey> widgetsID = List.generate(9, (index) => GlobalKey());

void scrollToWidget(double position) {

  controller.animateTo(
    position, 
    duration: const Duration(milliseconds: 500), 
    curve: Curves.easeIn,
  );
  
}

class Block1 extends StatefulWidget {

  const Block1({super.key});

  @override
  State<Block1> createState() => _Block1State();
}

class _Block1State extends State<Block1> {

  @override
  Widget build(BuildContext context) {
    return Visibility(
          //key: widgetsID[0],
          visible: _buttonStates[0],
          child: Column(
            children: [
              const Row(
                children: [
                  Flexible(
                    child: TextParagraph(customText: [
                      TextSpan(text: "З розвитком людства в давні часи з’явилося багато проблем, які вимагали створення "
                                    "нової науки – математики. Спочатку задачі були прості: порахувати кількість голів худоби, кількість "
                                    "деревини і продуктів, що приготували. Щоб відповісти на питання “Скільки?” людство винайшло натуральні числа.\n\nОтже, ", style: TextStyle()),

                      TextSpan(text: "Натуральні числа – числа, які використовуються при лічбі\n", style: TextStyle(fontWeight: FontWeight.bold)),

                      TextSpan(text: "Найменше натуральне число 1, оскільки 0 не є натуральним числом.", style: TextStyle()),
                      TextSpan(text: "Найбільшого натурального числа не існує. Неважливо, наскільки велике число ви придумаєте, " 
                                      "до нього завжди можна додати 1 або будь-яке інше число.", style: TextStyle()),
                      TextSpan(text: "Дроби, від’ємні числа і число 0 не є натуральними в свою чергу.\n\n", style: TextStyle()),
                      TextSpan(text: "Тепер поговоримо про натуральний ряд.\n", style: TextStyle()),
                      TextSpan(text: "Натуральний ряд - це всі натуральні числа записані по порядку від 1, тобто\n"
                                      "1,2,3,4,5,6,7,8,9… - натуральний ряд\n\n", style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: "Над натуральними числами можна виконувати операції тільки множення і додавання, тоді результатом буде також натуральне число\n" 
                                      "Операції віднімання і ділення над натуральними числами можуть виводити за рамки натуральних чисел\n\n", style: TextStyle()),
                      TextSpan(text: "Наприклад:\n", style: TextStyle(fontStyle: FontStyle.italic)),
                      TextSpan(text: "15+273=288\n15- натуральне число, 273 – натуральне число, 288- натуральне число\n"
                                      "2*23=46, усі три числа також є натуральними, втім 5:2=2, 5 – натуральне число, 2 – також натуральне число, втім 2 не натуральне\n" 
                                      "Також з відніманням, якщо ви віднімаєте більше число від меншого то отримуєте число, яке менше за 0, а від’ємні числа не є натуральними", style: TextStyle()),
                    ],),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ElevatedButton(                 
                      onPressed: (){
                        double distance = controller.position.maxScrollExtent + 50;
                        setState(() {                              
                          _buttonStates[1] = true;
                        });
                        scrollToWidget(0);
                        scrollToWidget(distance);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,  
                        shadowColor: Colors.grey, 
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
        );
  }
}



class Block2 extends StatefulWidget {
  const Block2({super.key});

  @override
  State<Block2> createState() => _Block2State();
}

class _Block2State extends State<Block2> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
            //key: widgetsID[1],
            visible: _buttonStates[1],
            child: Column(
              children: [
                const Row(
                  children: [
                    Flexible(
                      child: TextParagraph(customText: [
                        TextSpan(text: "Як ми вже з’ясували, натуральні числа позначають кількість предметів. І так само як ми можемо"
                        "порівнювати кількості предметів (наприклад, казати, що яблук у кошику більше ніж груш), ми також можемо" 
                        "порівнювати натуральні числа. Наприклад, число 5 більше ніж число 2.\n", style: TextStyle()),

                        TextSpan(text: "Результат порівняння чисел записуємо за допомогою знаків “>” (більше) або “<” (менше). Наприклад:\n"
                        "1.) 7 > 5 (читаємо: “сім більше за п’ять”);\n2.) 5 < 7 (читаємо: “п’ять менше за сім”). \nЯкий знак використовувати в якій ситуації "
                        "можна легко запам’ятати, якщо уявити, що знак порівняння – це дзьоб голодного птаха. Зрозуміло, що цей птах розкриватиме "
                        "дзьоба в ту сторону, де буде більше число.\n\n", style: TextStyle()),

                        TextSpan(text: "  Правила порівняння натуральних\n\t\tчисел: \n", style: TextStyle()),
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
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: ElevatedButton(
                      onPressed: (){
                        double _scrollDistance = controller.position.maxScrollExtent + 50;
                        setState(() {                              
                          _buttonStates[2] = true;
                        });
                        scrollToWidget(_scrollDistance);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,  
                        shadowColor: Colors.grey, 
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
        );
  }
}



class Block3 extends StatefulWidget {
  const Block3({super.key});

  @override
  State<Block3> createState() => _Block3State();
}

class _Block3State extends State<Block3> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
          visible: _buttonStates[2],
          //key: widgetsID[2],
          child: Column(
            children: [
              const Row(
                children: [
                  Flexible(
                    child: TextParagraph(customText: [
                      TextSpan(text: "Припустимо, наприклад, що кількість яблук у ящику була 1253. Через певний час кількість яблук у "
                      "ящику може змінитися. У числі може змінитися цифра розрядів одиниць, а можливо, і десятків. Тому можна сказати, "
                      "що у ящику приблизно 1250 яблук. Тобто ми замінили цифру одиниць на нуль. У цьому разі кажуть, що число округлили "
                      "до десятків. Це записують так: 1253 ≈ 1250. Знак ≈ називають знаком наближеної рівності і читають: «наближено дорівнює». "
                      "Округлюють число до заданого розряду так, щоб результат округлення якнайменше відрізнявся від даного числа. Тому при "
                      "округленні до сотень маємо 1253 ≈ 1300 (1253 ближче до 1300 ніж до 1200). Проте що ж робити, якщо, скажімо, нам потрібно "
                      "заокруглити число 350 до сотих? Тут маємо особливий випадок, оскільки число 350 рівновіддалене від 300 і 400. У таких "
                      "випадках число заокруглюють у бік більшого значення. Отже, 350 ≈ 400.\n", style: TextStyle()),

                      TextSpan(text: "  Правила округлення натуральних\n\t\tчисел: \n", style: TextStyle()),
                      TextSpan(text: "Щоб округлити число до певного розряду, потрібно:\n1.) усі цифри, записані за цим розрядом замінити на "
                      "нулі;\n2.) Якщо першою наступною цифрою за цим розрядом є цифра 0, 1, 2, 3 або 4, то цифру цього розряду не змінювати; "
                      "якщо ж першою наступною за цим розрядом є цифра 5, 6, 7, 8, або 9, то цифру цього розряду збільшити на одиницю.", style: TextStyle()),
                    ],),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ElevatedButton(
                      onPressed: (){
                        double _scrollDistance = controller.position.maxScrollExtent + 50;
                        setState(() {                              
                          _buttonStates[3] = true;
                        });
                        scrollToWidget(_scrollDistance);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,  
                        shadowColor: Colors.grey, 
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
        );
  }
}



// class Block4 extends StatefulWidget {
//   const Block4({super.key});

//   @override
//   State<Block4> createState() => __Block4StateState();
// }

// class __Block4StateState extends State<Block4> {
//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//           visible: _buttonStates[3],
//           key: widgetsID[3],
//           child: Column(
//             children: [
//               const Row(
//                 children: [
//                   Flexible(
//                     child: TextParagraph(customText: [
//                       TextSpan(text: "Пам’ятаємо, що числа позначають кількість предметів. І так само, як ми можемо до п’яти яблук додати два яблука "
//                       "і сказати, що у нас сім яблук, так само ми можемо робити з числами. Наприклад, 4 додати 5 дорівнює 9.\nДію додавання позначають "
//                       "знаком “+”. Наприклад 3 + 2 = 5. Числа, які додають називають доданками, а число, отримане в результаті дії додавання, – сумою.\n"
//                       "     Властивості дії додавання:     \n"),

//                       TextSpan(text: "1.) Від перестановки доданків сума не змінюється, так само, як і два яблука додати п’ять усе одно, що п’ять яблук додати два.\na + b = b + a\n"
//                       "2.) Щоб до суми двох чисел додати третє, можна до першого числа додати суму першого і третього.\n(a + b) + c = a + (b + c)\n\n"
//                       "Зауваження:\nа + 0 = а або 0 + а = а так само, як і якщо до п’яти яблук додати нічого (нуль) у вас залишиться п’ять яблук.", style: TextStyle()),
//                     ],),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: ElevatedButton(
//                       onPressed: (){
//                         setState(() {
//                           _buttonStates[4] = true;
//                         });
//                         scrollToWidget(widgetsID[4]);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         foregroundColor: Colors.white,  
//                         shadowColor: Colors.grey, 
//                         elevation: 5,
//                       ),
//                       child: const SizedBox(
//                         height: 50,
//                         width: 100,
//                         child: Center(child: Text("Next", style: TextStyle(color: Colors.white, fontSize: 16),),),
//                       ),
//                     ),
//                   ),
//               ],),
//             ],
//           ),
//         );
//   }
// }



// class Block5 extends StatefulWidget {
//   const Block5({super.key});

//   @override
//   State<Block5> createState() => _Block5State();
// }

// class _Block5State extends State<Block5> {
//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//           visible: _buttonStates[4],
//           key: widgetsID[4],
//           child: Column(
//             children: [
//               const Row(
//                 children: [
//                   Flexible(
//                     child: TextParagraph(customText: [
//                       TextSpan(text: "Пам’ятаємо, що числа позначають кількість предметів. І так само, як якщо від п’яти яблук відняти два яблука "
//                       "у нас залишиться три яблука, так само 5 відняти 2 дорівнює 3.\nДію віднімання позначають знаком “-”. Наприклад 5 - 3 = 2. "
//                       "Число, від якого віднімають, називають зменшуваним, число, яке віднімають від зменшуваного – від’ємником, а результат віднімання, – різницею.\n\n"
//                       "     Властивості дії віднімання:     \n"),

//                       TextSpan(text: "1.) Щоб відняти суму від числа, можна від числа спочатку відняти один з доданків, а потім від результату відняти другий доданок:\n"
//                       "a - (b + c) = (a - b) - c = (a - c) - b\n"
//                       "2.) Щоб відняти число від суми, можна відняти його від одного з доданків, а потім до результату додати другий доданок:\n"
//                       "(a + b) - c = (a - c) + b = (b - c) + a\n\n"
//                       "Зауваження:\nа - 0 = а так само, як і якщо від п’яти яблук відняти нічого у вас залишиться п’ять яблук.\n"
//                       "а - а = 0 так само, як і якщо від п’яти яблук відняти п’ять яблук, у вас не залишиться нічого.", style: TextStyle()),
//                     ],),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: ElevatedButton(
//                       onPressed: (){
//                         setState(() {
//                           _buttonStates[5] = true;
//                         });
//                         scrollToWidget(widgetsID[5]);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         foregroundColor: Colors.white,  
//                         shadowColor: Colors.grey, 
//                         elevation: 5,
//                       ),
//                       child: const SizedBox(
//                         height: 50,
//                         width: 100,
//                         child: Center(child: Text("Next", style: TextStyle(color: Colors.white, fontSize: 16),),),
//                       ),
//                     ),
//                   ),
//               ],),
//             ],
//           ),
//         );
//   }
// }


// class Block6 extends StatefulWidget {
//   const Block6({super.key});

//   @override
//   State<Block6> createState() => _Block6State();
// }

// class _Block6State extends State<Block6> {
//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//           visible: _buttonStates[5],
//           key: widgetsID[5],
//           child: Column(
//             children: [
//               const Row(
//                 children: [
//                   Flexible(
//                     child: TextParagraph(customText: [
//                       TextSpan(text: "Добуток a * b натуральних чисел a і b аналогічний додаванню числа a b разів. Також кажуть, що число а збільшили у b разів.\n"
//                       "a * b = "),
//                       TextSpan(text: "a + a + a + … + a.\n", style: TextStyle(decoration: TextDecoration.underline)),
//                       TextSpan(text: "                  b доданків\n"),
//                       TextSpan(text: "Числа а і b називають множниками, а число с = а * b добутком.\n\n"
//                       "      Властивості дії множення:     \n"
//                       "1.) Від перестановки множників добуток не змінюється. Це можна пояснити наступним чином: уяви, що перед тобою 5 рядів по 3 яблука в кожному, "
//                       "розміщені так, як показано на рисунку внизу.\n", style: TextStyle()),
//                     ],),
//                   ),
//                 ],
//               ),
//               Row(children: [
//                   Column(children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Image.asset('images/apple.png', height: 50, width: 50,),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Image.asset('images/apple.png', height: 50, width: 50,),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Image.asset('images/apple.png', height: 50, width: 50,),
//                     ),
//                   ],),
//                   Column(children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Image.asset('images/apple.png', height: 50, width: 50,),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Image.asset('images/apple.png', height: 50, width: 50,),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Image.asset('images/apple.png', height: 50, width: 50,),
//                     ),
//                   ],),
//                   Column(children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Image.asset('images/apple.png', height: 50, width: 50,),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Image.asset('images/apple.png', height: 50, width: 50,),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Image.asset('images/apple.png', height: 50, width: 50,),
//                     ),
//                   ],),
//                   Column(children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Image.asset('images/apple.png', height: 50, width: 50,),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Image.asset('images/apple.png', height: 50, width: 50,),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Image.asset('images/apple.png', height: 50, width: 50,),
//                     ),
//                   ],),
//                   Column(children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Image.asset('images/apple.png', height: 50, width: 50,),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Image.asset('images/apple.png', height: 50, width: 50,),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Image.asset('images/apple.png', height: 50, width: 50,),
//                     ),
//                   ],),
//                 ],
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(top: 10),
//                 child: Row(
//                   children: [
//                     Flexible(
//                       child: TextParagraph(customText: [
//                         TextSpan(text: "Зрозуміло, що загальну кількість яблук можна обчислити з одного боку – 5 разів додавши число 3, а "
//                         "з іншого – 3 рази додавши число 5. Так сам і 5 * 3 дає таке саме число, як і 3 * 5.\n"),
//                         TextSpan(text: "2.) Щоб добуток двох чисел помножити на третє, можна перше число помножити на добуток другого й третього. "
//                         "(a * b) * c = a * (b * c)\n3.) Щоб помножити суму на число, можна помножити на це число кожний доданок і ці добутки додати. "
//                         "Та й справді, додавши число 3 7 разів отримаємо такий же результат, якби ми додали це число 5 разів, а тоді ще 2 рази.\n"
//                         "(a + b) * c = a * c + b * c - "),
//                         TextSpan(text: "розподільний закон множення\n", style: TextStyle(fontWeight: FontWeight.bold)),
//                         TextSpan(text: "4.) Щоб помножити різницю на число, можна зменшуване і від’ємник помножити на це число і від першого добутку відняти другий:\n"
//                         "(a - b) * c = a * c - b * c\n\nЗауваження:\nЩоб помножити натуральне число на розрядну одиницю 10, 100, 1000, …, треба написати справа до цього числа стільки нулів, "
//                         "скільки їх в розрядній одиниці. Наприклад: 54 * 100 = 5400\nа * 1 = а оскільки один раз додати число а дасть число а. а * 0 = 0 так само, як якщо а разів додати число 0 дасть 0."),
//                       ],),
//                     ),
//                   ],
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: ElevatedButton(
//                       onPressed: (){
//                         setState(() {
//                           _buttonStates[6] = true;
//                         });
//                         scrollToWidget(widgetsID[6]);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         foregroundColor: Colors.white,  
//                         shadowColor: Colors.grey, 
//                         elevation: 5,
//                       ),
//                       child: const SizedBox(
//                         height: 50,
//                         width: 100,
//                         child: Center(child: Text("Next", style: TextStyle(color: Colors.white, fontSize: 16),),),
//                       ),
//                     ),
//                   ),
//               ],),
//             ],
//           ),
//         );
//   }
// }



// class Block7 extends StatefulWidget {
//   const Block7({super.key});

//   @override
//   State<Block7> createState() => _Block7State();
// }

// class _Block7State extends State<Block7> {
//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//           visible: _buttonStates[6],
//           key: widgetsID[6],
//           child: Column(
//             children: [
//               const Row(
//                 children: [
//                   Flexible(
//                     child: TextParagraph(customText: [
//                       TextSpan(text: "Ми вже знаємо, що суму деякої кількості однакових доданків можна записати у коротшому вигляді – добутку. "
//                       "Так ось, аналогічно добуток деякої кількості однакових множників можна записати у вигляді степеня числа.\n7 * 7 * 7 * 7 * 7 = 7"),
//                       TextSpan(text: "5", style: TextStyle()), 
//                     ],),
//                   ),
//                 ],
//               ),
//               const Row(
//                 children: [
//                   Flexible(
//                     child: TextParagraph(customText: [
//                       TextSpan(text: "\nДругий степінь числа часто називають квадратом числа, а третій степінь кубом. Також варто запам’ятати, "
//                       "що якщо вираз містить дію піднесення до степеня, то спочатку виконують піднесення до степеня, а тоді всі інші дії."),
//                     ],),
//                   ),
//                   ],
//                 ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: ElevatedButton(
//                       onPressed: (){
//                         setState(() {
//                           _buttonStates[7] = true;
//                         });
//                         scrollToWidget(widgetsID[7]);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         foregroundColor: Colors.white,  
//                         shadowColor: Colors.grey, 
//                         elevation: 5,
//                       ),
//                       child: const SizedBox(
//                         height: 50,
//                         width: 100,
//                         child: Center(child: Text("Next", style: TextStyle(color: Colors.white, fontSize: 16),),),
//                       ),
//                     ),
//                   ),
//               ],),
//             ],
//           ),
//         );
//   }
// }



// class Block8 extends StatefulWidget {
//   const Block8({super.key});

//   @override
//   State<Block8> createState() => _Block8State();
// }

// class _Block8State extends State<Block8> {
//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//           visible: _buttonStates[7],
//           key: widgetsID[7],
//           child: Column(
//             children: [
//               const Row(
//                 children: [
//                   Flexible(
//                     child: TextParagraph(customText: [
//                       TextSpan(text: " Дію, за допомогою якої за добутком та одним з множників можна знайти інший множник називають діленням. "
//                       "Власне, правильність ділення можна перевірити множенням. Наприклад, 48 : 6 = 8, оскільки 6 * 8 = 48.\n Частка (результат ділення) показує, "
//                       "у скільки разів ділене (число, яке ділять) більше за дільник (число, на яке ділять).\n a : b = cЧисло а називають діленим, b – дільником, c – часткою.\n\n"),

//                       TextSpan(text: "Зауваження:\nЩПрипустимо, що 5 : 0 = а, де а – якесь число. Тоді 0 * а = 5, проте ми ж знаємо, що це не так. Якщо ж припустити, що 0 : 0 = с, "
//                       "де с – також якесь число, то 0 * с = 0. Проте ми також знаємо, що ця рівність виконується для безлічі різних значень с. "
//                       "Отже, ділення на нуль не має смислу.\n"),
//                       TextSpan(text: "Тому зарубай собі на носі: на нуль ділити не можна!", style: TextStyle(fontWeight: FontWeight.bold)),
//                     ],),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: ElevatedButton(
//                       onPressed: (){
//                         setState(() {
//                           _buttonStates[8] = true;
//                         });
//                         scrollToWidget(widgetsID[8]);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         foregroundColor: Colors.white,  
//                         shadowColor: Colors.grey, 
//                         elevation: 5,
//                       ),
//                       child: const SizedBox(
//                         height: 50,
//                         width: 100,
//                         child: Center(child: Text("Next", style: TextStyle(color: Colors.white, fontSize: 16),),),
//                       ),
//                     ),
//                   ),
//               ],),
//             ],
//           ),
//         );
//   }
// }


// class Block9 extends StatefulWidget {
//   const Block9({super.key});

//   @override
//   State<Block9> createState() => _Block9State();
// }

// class _Block9State extends State<Block9> {
//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//           visible: _buttonStates[8],
//           key: widgetsID[8],
//           child: Column(
//             children: [
//               const Row(
//                 children: [
//                   Flexible(
//                     child: TextParagraph(customText: [
//                       TextSpan(text: " Ділення одного числа націло на інше не завжди можливе. Наприклад якщо спробувати поділити сімнадцять "
//                       "яблук поміж п’ятьма дітьми, то кожна дитина отримає по три яблука, а два яблука залишаться в остачі "
//                       "(спробуй поділити два яблука поміж п’ятьма дітьми порівну, не розрізаючи їх).\nЗаписують це так: 17 : 5 = 3 (ост. 2). "
//                       "Іншими словами число 17 містить 3 рази по 5 і ще 2.\nТобто 17 = 5 * 3 + 2. З цього випливає, що щоб знайти ділене у діленні з остачею, "
//                       "необхідно помножити неповну частку (3) на дільник (5) і до отриманого добутку додати остачу (2)."),
//                     ],),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: ElevatedButton(
//                       onPressed: (){
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
                              
//                               title: const Text("System notification"),
//                               content: const Center(child: Text('You are the BEAST', style: TextStyle(color: Color.fromARGB(255, 19, 29, 34)))),
//                               actions: [
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                   child: Text('ОК'),
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         foregroundColor: Colors.white,  
//                         shadowColor: Colors.grey, 
//                         elevation: 5,
//                       ),
//                       child: const SizedBox(
//                         height: 50,
//                         width: 100,
//                         child: Align(
//                           alignment: Alignment.center,
//                           child: Text("Finish lesson", style: TextStyle(color: Colors.white, fontSize: 16),),
//                         ),
//                       ),
//                     ),
//                   ),
//               ],),
//             ],
//           ),
//         );
//   }
// }


 