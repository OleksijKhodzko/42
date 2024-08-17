// else if (text.substring(i, i+3)=='</a') {

//         int k = i + 3;
//         int hIndex = -1, wIndex = -1;

//         while(text.substring(k, k+3) != 'a/>') {
//           k++;
//           if (text.substring(k, k + 2) == 'h:') {
//             hIndex = k;
//           } else if (text.substring(k, k + 2) == 'w:') {
//             wIndex = k;
//           }
//         }
//         widgetsOnScreen.add(LessonAnimation(ref: text.substring(i+3, hIndex), 
//           height: double.parse(text.substring(hIndex + 2, wIndex)), 
//           width: double.parse(text.substring(wIndex + 2, k)),));
//       }
//       // else if (text.substring(i, i+3)=='</b') {
//       //   int k = i + 3;
//       //   while(text.substring(k, k+3) != 'b/>') {
//       //     k++;
//       //   }
//       //   widgetsOnScreen.add(LessonParagraph(text: text.substring(i+3, k)));
//       // }