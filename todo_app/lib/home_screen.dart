import 'package:flutter/material.dart';
import 'package:todo_app/home_screen_widget.dart';
import 'package:todo_app/items_page.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
   void func() async {
    Future.delayed(const Duration(seconds: 2), () {});
    const CircularProgressIndicator.adaptive();
  }

  List<Widget> pages = const [HomeScreenWidget(), ItemsPage()];
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    func();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 30,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.abc_rounded), label: ""),
        ],
        currentIndex: currentPage,
      ),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: func,
              child: Icon(Icons.refresh),
            ),
          ),
        ],
        title: const Text("Todo App"),
      ),
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
    );
  }
}
