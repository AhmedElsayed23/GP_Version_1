import 'package:flutter/material.dart';
import 'package:gp_version_01/Screens/chooseCategory_screen.dart';
import 'package:gp_version_01/Screens/home_screen.dart';
import 'chat_screen.dart';
import 'formSkeleton_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;
  int pageIndex = 2;

  @override
  void initState() {
    pages = [
      {'page': ChatPage(), 'name': 'messages'},
      {'page': AddItemScreen(), 'name': 'add'},
      {'page': HomeScreen(), 'name': 'home'},
    ];
    super.initState();
  }

  void select(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 65,
        child: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Colors.orange[900],
            currentIndex: pageIndex,
            onTap: select,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: "مراسلاتي",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box_rounded),
                label: "أضف منتج",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "الصفحة الرئيسية",
              ),
            ]),
      ),
      body: pages[pageIndex]['page'],
    );
  }
}
