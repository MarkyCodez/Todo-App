import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/global_variables.dart';

class ItemsScreen extends StatelessWidget {
  final List<String> task_3;
  final List<String> description_3;
  const ItemsScreen(
      {super.key, required this.task_3, required this.description_3});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: task_3.length,
      itemBuilder: (context, index) {
        final t = task_3[index];
        final t3 = description_3[index];
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            horizontalTitleGap: 20,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            ),
            tileColor: Theme.of(context).primaryColor,
            title: Text(
              t,
              style: GoogleFonts.notoSansMedefaidrin(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              t3,
              style: const TextStyle(fontSize: 13),
            ),
            leading: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      icon: Icon(
                        Icons.delete,
                        size: 40,
                        color: Theme.of(context).primaryColor,
                      ),
                      elevation: 5,
                      content: Text(
                        "Are you sure you want to delete this?",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Provider.of<Items>(context, listen: false)
                                .removeTasks(t);
                            Provider.of<Items>(context, listen: false)
                                .removeTDescription(t3);
                            Navigator.of(context).pop();
                          },
                          child: const Text("Yes"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("No"),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                size: 30,
                color: Colors.red,
              ),
            ),
          ),
        );
      },
    );
  }
}
