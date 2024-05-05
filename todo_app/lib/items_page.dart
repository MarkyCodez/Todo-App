import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/items_screen_widget.dart';
import 'package:todo_app/pages/global_variables.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<Items>(context).tasks;
    final description = Provider.of<Items>(context).description;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ItemsScreen(
          task_3: task,
          description_3: description,
        ),
      ),
    );
  }
}
