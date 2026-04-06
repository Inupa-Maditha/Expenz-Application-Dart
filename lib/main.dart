import 'package:expence_app/services/user_services.dart';
import 'package:expence_app/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserServices.chechUserName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          bool hasUserName = snapshot.data ?? false;
          return MaterialApp(
            title: "Expenze",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: "Inter"),
            home: Wrapper(showmainScreen: hasUserName),
          );
        }
      },
    );
  }
}
