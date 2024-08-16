import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; //dependency added in pubspec.yaml

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shared Preferences Demo', // Add a meaningful title here
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shared Preferences Demo'), // Add a title to the AppBar
        ),
        body: const ElevatedButtonExample(),
      ),
    );
  }
}

class ElevatedButtonExample extends StatefulWidget {
  const ElevatedButtonExample({super.key});

  @override
  State<ElevatedButtonExample> createState() => _ElevatedButtonExampleState();
}

class _ElevatedButtonExampleState extends State<ElevatedButtonExample> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
    );

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(
            child: Text('Save Data', textAlign: TextAlign.center),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: TextField(
              maxLength: 100,
              controller: myController,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: style,
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('name', myController.text);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Navarchana University'),
                    content: Text('${myController.text} is Saved'),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Save Value'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: style,
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              final sname = prefs.getString('name') ?? 'None';
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Navarchana University'),
                    content: Text(sname),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Retrieve Value'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: style,
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.remove('name');
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Navarchana University'),
                    content: const Text('Value is Cleared'),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Clear Value'),
          ),
        ],
      ),
    );
  }
}
