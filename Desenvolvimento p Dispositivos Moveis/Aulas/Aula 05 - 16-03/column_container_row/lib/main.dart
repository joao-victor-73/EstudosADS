import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 84, 166, 46)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              border: Border.all(
                color: Colors.teal,
                width: 2,
              ),
            ),
            padding: const EdgeInsets.all(10),
            height: 300,
            width: 400,
            child: const Text(
              'Exemplo de Container',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )));
  }
}

/* Exemplo de Container

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              border: Border.all(
                color: Colors.teal,
                width: 2,
              ),
            ),
            padding: const EdgeInsets.all(10),
            height: 300,
            width: 400,
            child: const Text(
              'Exemplo de Container',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )));
  }
}

 */