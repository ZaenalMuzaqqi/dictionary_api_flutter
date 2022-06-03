import 'package:dictionary_api_flutter/model/model.dart';
import '../service/word_service.dart';

import 'package:flutter/material.dart';
import 'detail_screen.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade900,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(),
              const Text(
                "Dictionary App",
                style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Search any word you want quickly",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextField(
                controller: queryController,
                decoration: InputDecoration(
                  hintText: "Search a word",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  fillColor: Colors.grey[100],
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  hintStyle: const TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async{
                    await WordService.getWordFromDictionary(queryController.text).then((value){

                      if(value != null){
                        DictionaryModel dictionaryModel = value[0];

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailScreen(dictionaryModel)),
                        );
                      }else{

                      }






                    });



                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrangeAccent,
                      padding: const EdgeInsets.all(16)),
                  child: const Text("SEARCH"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







