import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic>? jsonData;

  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('assets/marks.json');
    var data = jsonDecode(jsonString);
    setState(() {
      jsonData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonAsset();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Loading Data'),
        ),
        body: Center(
          child: jsonData != null
              ? ListView.builder(
            itemCount: jsonData!.length,
            itemBuilder: (context, index) {
              var item = jsonData![index];
              return Card(
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: item.entries.map<Widget>((entry) {
                      return Text('${entry.key}: ${entry.value}');
                    }).toList(),
                  ),
                ),
              );
            },
          )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
