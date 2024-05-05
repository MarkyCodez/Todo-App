import 'package:flutter/material.dart';

class Items extends ChangeNotifier{
  final List<String> tasks = [];
  final List<String> description = [];
  void addTask(String newtasks){
    tasks.add(newtasks);
    notifyListeners();
  }
  void removeTasks(String newtasks){
    tasks.remove(newtasks);
    notifyListeners();
  }
  void addDescription(String newDescription){
    description.add(newDescription);
    notifyListeners();
  }
  void removeTDescription(String newDescription){
    description.remove(newDescription);
    notifyListeners();
  }
}