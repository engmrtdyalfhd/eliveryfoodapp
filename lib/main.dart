import 'package:deliveryfoodapp/onbording.dart';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://hkgxymekxumcnxskuues.supabase.co',
    anonKey: 'sb_publishable_BK9pQwDRIhsN1NlOT4bEhQ_T8QDUscp',

    // anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IjdiN3hmdzljcmNyOXVzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ0MjQ0NjAsImV4cCI6MTk3MzU4ODA2MH0.7Z4/XFW9crCR9uS',
  );
  runApp(const MyApp());
}

// 7Z4/XFW9crCR9uS
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Onbording(),
    );
  }
}
