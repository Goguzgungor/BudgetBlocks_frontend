import 'dart:html';


class LocalStorage {
  final Storage _localStorage = window.localStorage;

  Future save(String key,String value) async {
    _localStorage[key] = value;
  }

  Future<String?> getId(String key) async {
    return _localStorage[key];
  }

  Future invalidate() async {
    _localStorage.remove('selected_id');
  }
}
