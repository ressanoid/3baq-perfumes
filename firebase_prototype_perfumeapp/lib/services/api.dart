import 'dart:convert';
import '../models/notes.dart';

import '../models/perfume.dart';

class PerfumeApi {
  static List<Perfume> allperfumesjson(String jsondata) {
    List<Perfume> perfumes = [];
    json
        .decode(jsondata)['Perfumes']
        .forEach((perfume) => perfumes.add(Perfume.fromJson(perfume)));

    return perfumes;
  }
}

class NoteApi {
  static List<Note> allnotesjson(String jsondata) {
    List<Note> notes = [];
    json
        .decode(jsondata)['Notes']
        .forEach((note) => notes.add(Note.fromJson(note)));

    return notes;
  }
}
