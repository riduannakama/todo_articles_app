import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:uas_flutter_home_v1/models/data.dart';

class DataServices {
  static Future<List<Data>> getData() async {
    var load = await rootBundle.loadString('assets/data/datato.json');
    var data = json.decode(load);
    print(data);
    List<Data> datas =
        (data['data'] as List).map((v) => Data.fromJson(v)).toList();
    return datas;
  }
}
