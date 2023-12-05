import 'package:bbu_mobile_app/auth/screens/login_screen.dart';
import 'package:bbu_mobile_app/screens/home_screen.dart';
import 'package:bbu_mobile_app/screens/product_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final LocalStorage storage = LocalStorage('user_login_key');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder(
          future: storage.ready,
          builder: (BuildContext context, snapshot){
            var username = storage.getItem("accessToken");
            if(username != null){
              return HomeScreen();
            }
            return LoginScreen();
          }
      ),
    );
  }
}