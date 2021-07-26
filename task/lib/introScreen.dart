import 'package:flutter/material.dart';
import 'package:task/map/map.dart';
import 'package:task/notification/listdata.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('INTRODUCTION SCREEN'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SimpleMap(),
                      )),
                  icon: Icon(Icons.map),
                  label: Text('GOOGLE MAP')),
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyList(),
                      )),
                  icon: Icon(Icons.notification_important),
                  label: Text('PUSH NOTIFICATION'))
            ],
          ),
        ),
      ),
    );
  }
}
