import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:uol_edtech_challenge/app/core/utils/MyGetConnect.dart';

class ProviderClasses extends MyGetConnect {
  @override
  void onInit() {}

  Future<String> getJson() {
    return rootBundle.loadString('fake_classes.json');
  }

  Future list() async {
    var my_data = json.decode(await getJson());
    return my_data;
  }

}
