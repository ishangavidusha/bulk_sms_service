import 'dart:convert';

import 'package:bulk_sms_service/models/sheetIdModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataService {

  Future<List<SheetKeyModel>> getSavedSheetKeys() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String jsonString = _prefs.getString("sheet-keys");

    List<SheetKeyModel> sheetKeyList = [];
    if (jsonString != null && jsonString.isNotEmpty) {
      sheetKeyList = (json.decode(jsonString) as List).map((data) => new SheetKeyModel.fromJson(data)).toList();
    }

    return sheetKeyList;
  }

  Future<bool> addSheetKey(SheetKeyModel sheetKeyModel) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    List<SheetKeyModel> sheetKeyList = await getSavedSheetKeys();
    sheetKeyList.add(sheetKeyModel);

    String jsonString = json.encode(sheetKeyList);
    bool result = await _prefs.setString("sheet-keys", jsonString);

    return result;

  }

  Future<bool> removeSheetKey(SheetKeyModel sheetKeyModel) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    List<SheetKeyModel> sheetKeyList = await getSavedSheetKeys();
    sheetKeyList.removeWhere((element) => element.key == sheetKeyModel.key);

    String jsonString = json.encode(sheetKeyList);
    bool result = await _prefs.setString("sheet-keys", jsonString);

    return result;

  }

  Future<SheetKeyModel> getSelectedKey() async {
    List<SheetKeyModel> sheetKeyList = await getSavedSheetKeys();

    return sheetKeyList.firstWhere((element) => element.selected == "true", orElse: () {
      return null;
    });
  }

  Future<void> setSelectedKey(SheetKeyModel sheetKeyModel) async {
    List<SheetKeyModel> sheetKeyList = await getSavedSheetKeys();

    sheetKeyList.forEach((element) {
      if (element.key == sheetKeyModel.key) {
        element.selected = "true";
      } else {
        element.selected = "false";
      }
    });

  }

}