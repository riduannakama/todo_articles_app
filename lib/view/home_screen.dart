import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uas_flutter_home_v1/view/add.dart';
import 'package:uas_flutter_home_v1/view/data_page.dart';
import 'package:uas_flutter_home_v1/view/todo_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;
  final List<Widget> screen = [DataPage()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DataPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ToDoPage()));
        },
        backgroundColor: HexColor("#40B07A"),
        child: Icon(Icons.note_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 16,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  setState(() {
                    currentScreen = DataPage();
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    currentTab == 0
                        ? Icon(
                            Icons.home,
                            color: HexColor("#40B07A"),
                          )
                        : Icon(
                            Icons.home_outlined,
                            color: Colors.grey,
                          ),
                    Text(
                      "Home",
                      style: TextStyle(
                          color: currentTab == 0
                              ? HexColor("#40B07A")
                              : Colors.grey),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 120,
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    currentScreen = AddPage();
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    currentTab == 1
                        ? Icon(
                            Icons.book,
                            color: HexColor("#40B07A"),
                          )
                        : Icon(
                            Icons.book_outlined,
                            color: Colors.grey,
                          ),
                    // Icon(Icons.person_sharp,
                    // color: currentTab == 1 ? HexColor("#B068D0") : Colors.grey,
                    // ),
                    Text(
                      "Add",
                      style: TextStyle(
                          color: currentTab == 1
                              ? HexColor("#40B07A")
                              : Colors.grey),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
