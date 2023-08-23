import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onPressed: () {},
              icon: Icon(
                Icons.language,
              ))
        ],
        title: Text(
          "change_language".tr(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black.withOpacity(.03)),
              child: ListTile(
                onTap: () {
                  context.setLocale(Locale('km', 'KM'));
                  print(context.locale.toString());
                },
                leading: Image.asset(
                  "assets/logo/khmer.jpg",
                  height: 50,
                  width: 100,
                ),
                title: Text("khmer".tr()),
                trailing: context.locale.toString() == "km_KM"
                    ? Icon(Icons.check_circle)
                    : Text(""),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black.withOpacity(.03)),
              child: ListTile(
                onTap: () {
                  context.setLocale(Locale('en', 'EN'));
                  print(context.locale.toString());
                },
                leading: Image.asset(
                  "assets/logo/english.jpg",
                  height: 50,
                  width: 100,
                ),
                title: Text("english".tr()),
                trailing: context.locale.toString() == "en_EN"
                    ? Icon(Icons.check_circle)
                    : Text(""),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
