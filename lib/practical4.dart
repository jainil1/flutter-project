import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Working with Images'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Replace network image with local image
              Image.asset(
                'assets/nuv_logo.png', // Update with your image path
                width: 400,
                height: 200,
              ),
              Text(
                'Welcome to NUV',
                style: TextStyle(fontSize: 50.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
