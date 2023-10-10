import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_app/modals/json_modals.dart';

class JsonController extends ChangeNotifier {
  List<JsonModals> allData = [];

  JsonController() {
    loadJson();
  }

  loadJson() async {
    String res = await rootBundle.loadString("assets/Json/data.json");
    List allPosts = jsonDecode(res);

    allData = allPosts.map((e) => JsonModals.fromMap(data: e)).toList();

    notifyListeners();
  }
}
