import 'package:flutter/material.dart';
import '../models/perfume.dart';
import '../services/api.dart';

class Perfumes with ChangeNotifier, PerfumeApi {
  List<Perfume> _perfumes = [];

  Future<List<Perfume>> loadPerfumes(BuildContext context) async {
    String filedata = await DefaultAssetBundle.of(context).loadString("assets/perfumes.json");
    _perfumes = PerfumeApi.allperfumesjson(filedata); 
    return _perfumes;
  }

  Perfume findPerfumeById(String id) {
    return _perfumes.firstWhere((perfume) => perfume.id == id);
  }

  List<Perfume> get perfumes {
    return [..._perfumes];
  }

  void set perfumes(List<Perfume> perfume){
    _perfumes = perfume;
  }
}
