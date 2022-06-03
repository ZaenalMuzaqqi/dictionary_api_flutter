// import 'package:dictionary/screens/detail/detail_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:dictionary/model/word_response.dart';
//
// class ListScreen extends StatelessWidget {
//
//
//   final List<WordResponse> words;
//
//   ListScreen(this.words);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.separated(
//           itemBuilder: (context, index) => ListTile(
//             title: Text(words[index].word, style: const TextStyle(color: Colors.white),),
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(words[index]))
//               );
//             },
//           ),
//           separatorBuilder: (context, index) => const Divider(color: Colors.grey,),
//           itemCount: words.length
//       ),
//     );
//   }
// }
