// To parse this JSON data, do
//
//     final dictionaryModel = dictionaryModelFromJson(jsonString);

import 'dart:convert';

List<DictionaryModel> dictionaryModelFromJson(String str) => List<DictionaryModel>.from(json.decode(str).map((x) => DictionaryModel.fromJson(x)));

String dictionaryModelToJson(List<DictionaryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DictionaryModel {
  DictionaryModel({
    this.word,
    this.phonetics,
    this.meanings,
    this.license,
    this.sourceUrls,
  });

  String? word;
  List<Phonetic>? phonetics;
  List<Meaning>? meanings;
  License? license;
  List<String>? sourceUrls;

  factory DictionaryModel.fromJson(Map<String, dynamic> json) => DictionaryModel(
    word: json["word"],
    phonetics: List<Phonetic>.from(json["phonetics"].map((x) => Phonetic.fromJson(x))),
    meanings: List<Meaning>.from(json["meanings"].map((x) => Meaning.fromJson(x))),
    license: License.fromJson(json["license"]),
    sourceUrls: List<String>.from(json["sourceUrls"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "word": word,
    "phonetics": List<dynamic>.from(phonetics!.map((x) => x.toJson())),
    "meanings": List<dynamic>.from(meanings!.map((x) => x.toJson())),
    "license": license?.toJson(),
    "sourceUrls": List<dynamic>.from(sourceUrls!.map((x) => x)),
  };
}

class License {
  License({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory License.fromJson(Map<String, dynamic> json) => License(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

class Meaning {
  Meaning({
    this.partOfSpeech,
    this.definitions,
    this.synonyms,
    this.antonyms,
  });

  String? partOfSpeech;
  List<Definition>? definitions;
  List<String>? synonyms;
  List<String>? antonyms;

  factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
    partOfSpeech: json["partOfSpeech"],
    definitions: List<Definition>.from(json["definitions"].map((x) => Definition.fromJson(x))),
    synonyms: List<String>.from(json["synonyms"].map((x) => x)),
    antonyms: List<String>.from(json["antonyms"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "partOfSpeech": partOfSpeech,
    "definitions": List<dynamic>.from(definitions!.map((x) => x.toJson())),
    "synonyms": List<dynamic>.from(synonyms!.map((x) => x)),
    "antonyms": List<dynamic>.from(antonyms!.map((x) => x)),
  };
}

class Definition {
  Definition({
    this.definition,
    this.synonyms,
    this.antonyms,
    this.example,
  });

  String? definition;
  List<dynamic>? synonyms;
  List<dynamic>? antonyms;
  String? example;

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
    definition: json["definition"],
    synonyms: List<dynamic>.from(json["synonyms"].map((x) => x)),
    antonyms: List<dynamic>.from(json["antonyms"].map((x) => x)),
    example: json["example"],
  );

  Map<String, dynamic> toJson() => {
    "definition": definition,
    "synonyms": List<dynamic>.from(synonyms!.map((x) => x)),
    "antonyms": List<dynamic>.from(antonyms!.map((x) => x)),
    "example": example,
  };
}

class Phonetic {
  Phonetic({
    this.audio,
    this.sourceUrl,
    this.license,
    this.text,
  });

  String? audio;
  String? sourceUrl;
  License? license;
  String? text;

  factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
    audio: json["audio"],
    sourceUrl: json["sourceUrl"],
    license: json["license"] == null ? null : License.fromJson(json["license"]),
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "audio": audio,
    "sourceUrl": sourceUrl,
    "license": license == null ? null : license!.toJson(),
    "text": text,
  };
}
