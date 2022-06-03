import '../model/model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final DictionaryModel wordResponse;

  DetailScreen(this.wordResponse);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(32),
          width: double.infinity,
          child: Column(
            children: [
              Text(
                wordResponse.word!,
                style: const TextStyle(color: Colors.white, fontSize: 36),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final meaning = wordResponse.meanings![index];
                    final definitions = meaning.definitions;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meaning.partOfSpeech!,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(height: 8,),
                        ListView.separated(
                          itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Defination :  ${definitions![index].definition}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              const SizedBox(height: 4,),
                              Text("Sentence  : ${definitions[index].example ?? 'not needed'}", style: const TextStyle(color: Colors.white),),
                            ],
                          ),
                          separatorBuilder: (context, index) => const SizedBox(height: 8,),
                          itemCount: definitions!.length,
                          shrinkWrap: true,
                        )
                      ],
                    );
                  },
                  itemCount: wordResponse.meanings!.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 32,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}