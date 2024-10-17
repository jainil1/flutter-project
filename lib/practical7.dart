import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
  String _fileContents = '';


  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    String fileText = await rootBundle.loadString('assets/data science.txt');//data science info.txt is placed under text directory of assets folder and respective changes are made in pubspec.yaml.
    setState(() {
      _fileContents = fileText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reading Data from File...'),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 10.0,left: 50.0,right: 50.0, bottom: 10.0),

            child: Text(_fileContents,textAlign:TextAlign.left,)

        ),
      ),
    );
  }
}
