import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_note_app/all_bindings.dart';
import 'views/Todo Screen/note_string.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AllBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart Note App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoListString(),
    );
  }
}
