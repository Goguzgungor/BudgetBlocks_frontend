import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:budget_blocks/app/memory/hive_boxes.dart';

class HiveManager {
  static HiveManager? _instance;
  static HiveManager get instance {
    _instance ??= HiveManager._init();
    return _instance!;
  }

  HiveManager._init();

  Future<void> hiveInit() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path;
    Hive.init(path);
    await openAllBoxes();
  }

  Future<void> openAllBoxes() async {
    await openBox(HiveBoxes.USER);
  }

  Future<void> openBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) await Hive.openBox(boxName);
  }

  Future<void> addMapToBox(String boxName, String key, dynamic value) async {
    Map hiveMap = {key: value};
    Box box = Hive.box(boxName);
    await box.putAll(hiveMap);
  }

  Future<void> addListToBox(String boxName, List<dynamic> list) async {
    Box box = Hive.box(boxName);
    await box.put(boxName, list);
  }

  dynamic getMapFromBox(String boxName, String key) {
    Box box = Hive.box(boxName);
    Map<dynamic, dynamic> map = box.toMap();
    return map[key];
  }

  List<dynamic> getListFromBox(String boxName) {
    Box box = Hive.box(boxName);
    List<dynamic> temp = box.get(boxName);
    return temp;
  }

  Future<void> clearData(String boxName) async {
    Box box = Hive.box(boxName);
    await box.clear();
  }

  Future<void> deleteBox(String boxName) async {
    Box box = Hive.box(boxName);
    await box.deleteFromDisk();
  }
}
