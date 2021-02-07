import 'package:flutter_app_ex3/model/task.dart';

class ListModel {
  ListModel(this.items);

  final List<Task> items;

  void insert(int index, Task item) {
    print('add newTast: ${item.title}');
    items.insert(index, item);
  }

  Task removeAt(int index) {
    final Task removedItem = items.removeAt(index);
    return removedItem;
  }

  int get length => items.length;

  Task operator [](int index) => items[index];

  int indexOf(Task item) => items.indexOf(item);
}
