import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Taskpage.dart';
import 'firebase_options.dart';

void main() async {
  // These two lines
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light()
          .copyWith(primaryColor: Colors.lightBlue,
          backgroundColor: Colors.lightBlue),
      home: Taskpage(),
    );
  }
}
