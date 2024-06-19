import 'dart:convert';

import 'package:contact_app/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactProvider with ChangeNotifier {
  final String _key = "contacts";
  List<Contact> _contactList = [];

  Future<void> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? todosString = prefs.getString(_key);

    if (todosString != null) {
      final List<dynamic> decodedJson = jsonDecode(todosString) as List;
      var list = decodedJson.map((json) => Contact.fromMap(json)).toList();
      _contactList = list;
      notifyListeners();
    }
  }

  Future<void> saveTodos(List<Contact> notes) async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedJson =
        jsonEncode(notes.map((todo) => todo.toMap()).toList());
    await prefs.setString(_key, encodedJson);
    loadTodos();
  }

  Future<void> addTodo(Contact note) async {
    _contactList.add(note);
    await saveTodos(_contactList);
  }

  Future<void> deleteTodo(Contact todo) async {
    _contactList.remove(todo);
    await saveTodos(_contactList);
  }

  void updateTodo(Contact oldData, Contact newData) {
    var index = _contactList.indexOf(oldData);
    _contactList.removeAt(index);
    _contactList.insert(index, newData);
    saveTodos(_contactList);
  }

  List<Contact> get contactList => _contactList;
}
