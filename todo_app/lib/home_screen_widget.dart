import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/global_variables.dart';


class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {


  final TextEditingController controller_2 = TextEditingController();
  final border_1 = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
      color: Colors.black,
      strokeAlign: BorderSide.strokeAlignOutside,
      width: 2,
      style: BorderStyle.solid,
    ),
  );

  final TextEditingController controller_1 = TextEditingController();

  void controllerFunction() {
    if (controller_1.text.isNotEmpty && controller_2.text.isNotEmpty) {
      Provider.of<Items>(context, listen: false)
          .addTask(controller_1.text.toString());
      Provider.of<Items>(context, listen: false)
          .addDescription(controller_2.text.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Added Successfully"),
          duration: Duration(seconds: 2),
          showCloseIcon: true,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select"),
          showCloseIcon: true,
          elevation: 5,
          duration: Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                        height: 420,
                        width: 350,
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Card(
                              elevation: 50,
                              color: Colors.amber,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Enter your Tasks",
                                    style: GoogleFonts.notoSansMedefaidrin(
                                      textStyle:
                                          Theme.of(context).textTheme.bodyMedium,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: TextField(
                                      controller: controller_1,
                                      decoration: InputDecoration(
                                        focusedBorder: border_1,
                                        enabledBorder: border_1,
                                        hintText: "Your Tasks",
                                        hintStyle:
                                            Theme.of(context).textTheme.bodySmall,
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: TextField(
                                      controller: controller_2,
                                      decoration: InputDecoration(
                                          hintText: "Description",
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: border_1,
                                          enabledBorder: border_1),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: ElevatedButton(
                                      onPressed: controllerFunction,
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(100, 45),
                                      ),
                                      child: const Row(
                                        children: [
                                          Icon(Icons.add, size: 25),
                                          Text("Add Tasks"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
