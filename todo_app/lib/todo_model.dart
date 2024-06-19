import 'dart:convert';

class Todo {
  String? title;
  String? desc;
  Todo({
    required this.title,
    required this.desc,
  });

  get id => null;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (title != null) {
      result.addAll({'title': title});
    }
    if (desc != null) {
      result.addAll({'desc': desc});
    }

    return result;
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'],
      desc: map['desc'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));
}
