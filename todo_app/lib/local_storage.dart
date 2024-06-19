import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todoList = [];

  TodoProvider() {
    loadTodos();
  }

  void addTodo(Todo newData) {
    todoList.add(newData);
    saveData();
    notifyListeners();
  }

  void deleteTodos(List<Todo> todos) {
    for (var n in todos) {
      var index = todoList.indexOf(n);
      todoList.removeAt(index);
    }
    saveData();
    notifyListeners();
  }

  void updateTodo(Todo oldData, Todo newData) {
    var index = todoList.indexOf(oldData);
    todoList.removeAt(index);
    todoList.insert(index, newData);
    saveData();
    notifyListeners();
  }

  void saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final todoListJson =
        json.encode(todoList.map((item) => item.toMap()).toList());
    prefs.setString('todolist', todoListJson);
  }

  void loadTodos() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? todoListJson = prefs.getString('todolist');
    if (todoListJson != null) {
      try {
        final List<dynamic> dataList = json.decode(todoListJson);
        var list = dataList.map((item) => Todo.fromMap(item)).toList();
        // list.sort((a, b) => a.date.compareTo(b.date));
        todoList = list;
      } catch (e) {
        log('Error loading data: $e');
      }
    }
    notifyListeners();
  }
}
