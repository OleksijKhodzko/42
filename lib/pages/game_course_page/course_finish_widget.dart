import 'package:flutter/material.dart';

class CourseFinishLevelMapWidget extends StatelessWidget {
  const CourseFinishLevelMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // The finish widget of the course level map
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => Container(
                  color: Colors.green,
                ));
      },
      style: ElevatedButton.styleFrom(
        elevation: 10,
        shadowColor: Colors.deepPurple,
        // for some reason, it aligns the text in the center
        visualDensity: VisualDensity.comfortable,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(24),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      child: const Text('Finish',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class CourseFinishLevelMapWidget extends StatelessWidget {
//   const CourseFinishLevelMapWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // decoration: BoxDecoration(
//       // shape: BoxShape.circle,
//       // color: Theme.of(context).colorScheme.primary,
//       // border: Border.all(
//       //   color: Theme.of(context).colorScheme.primary,
//       // ),
//       // boxShadow: [
//       //   BoxShadow(
//       //     color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
//       //     spreadRadius: 5,
//       //     blurRadius: 7,
//       //     offset: const Offset(0, 3), // changes position of shadow
//       //   ),
//       // ],
//       // ),
//       color: Theme.of(context).colorScheme.background,
//       child: Image.asset('assets/images/Graduation Cap.png'),
//     );
//   }
// }
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// class CourseFinishLevelMapWidget extends StatelessWidget {
//   const CourseFinishLevelMapWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(r'''
//                                     o
//                                    $""$o
//                                   $"  $$
//                                    $$$$
//                                    o "$o
//                                   o"  "$
//              oo"$$$"  oo$"$ooo   o$    "$    ooo"$oo  $$$"o
// o o o o    oo"  o"      "o    $$o$"     o o$""  o$      "$  "oo   o o o o
// "$o   ""$$$"   $$         $      "   o   ""    o"         $   "o$$"    o$$
//   ""o       o  $          $"       $$$$$       o          $  ooo     o""
//      "o   $$$$o $o       o$        $$$$$"       $o        " $$$$   o"
//       ""o $$$$o  oo o  o$"         $$$$$"        "o o o o"  "$$$  $
//         "" "$"     """""            ""$"            """      """ "
//          "oooooooooooooooooooooooooooooooooooooooooooooooooooooo$
//           "$$$$"$$$$" $$$$$$$"$$$$$$ " "$$$$$"$$$$$$"  $$$""$$$$
//            $$$oo$$$$   $$$$$$o$$$$$$o" $$$$$$$$$$$$$$ o$$$$o$$$"
//            $"""""""""""""""""""""""""""""""""""""""""""""""""""$
//            $"                                                 "$
//            $"$"$"$"$"$"$"$"$"$"$"$"$"$"$"$"$"$"$"$"$"$"$"$"$"$"$
//
//
//
//
//
//       ''');
//   }
// }
