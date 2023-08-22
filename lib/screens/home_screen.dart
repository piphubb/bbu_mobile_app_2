import 'package:bbu_mobile_app/screens/change_language_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.indigo,
        child: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(80),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Student ID : PP47707",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Poen Piphub",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "0885133717",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "poen_piphub@pp.bbu.edu.kh",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.9),
              height: 0.6,
            ),
            ListTile(
              onTap: (){},
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                "For Enrollment",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              title: Text(
                "Manage Enrollment",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(
                Icons.event,
                color: Colors.white,
              ),
              title: Text(
                "Event",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(
                Icons.calendar_month,
                color: Colors.white,
              ),
              title: Text(
                "Calendar",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(
                Icons.phone_android,
                color: Colors.white,
              ),
              title: Text(
                "Contact",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(
                Icons.comment,
                color: Colors.white,
              ),
              title: Text(
                "Compus",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(
                Icons.apartment,
                color: Colors.white,
              ),
              title: Text(
                "Apply",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChangeLanguageScreen()),
                );
              },
              icon: Icon(
                Icons.language,
              ))
        ],
        title: Text("Build Bright University"),
      ),
    );
  }
}
