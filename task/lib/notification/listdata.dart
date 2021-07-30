import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final mystyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 17,
);

FlutterLocalNotificationsPlugin notifications =
    FlutterLocalNotificationsPlugin();

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  Future future() async {
    Dio dio = Dio();
    var response = await dio.get("https://jsonplaceholder.typicode.com/users");
    setState(() {
      var data = response.data;
      list = data;
      print(list);
    });
  }

  List list = [];

  @override
  void initState() {
    FlutterLocalNotificationsPlugin Notifications =
        FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = IOSInitializationSettings();
    var init = InitializationSettings(android: android, iOS: ios);
    Notifications.initialize(init);
    future();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('JSON DATA'),
      ),
      body: list.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${index + 1}.${list[index]['name']}".toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.teal),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, ix) => Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () => show(list[index]['name'],
                                      list[index]['email']),
                                  child: Text(
                                    "Email: ".toUpperCase() +
                                        list[index]['email']
                                            .toString()
                                            .toUpperCase(),
                                    style: mystyle,
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                                GestureDetector(
                                  onTap: () => show(list[index]['name'],
                                      list[index]['phone']),
                                  child: Text(
                                    "Phone: ".toUpperCase() +
                                        list[index]['phone']
                                            .toString()
                                            .toUpperCase(),
                                    style: mystyle,
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                                GestureDetector(
                                  onTap: () => show(list[index]['name'],
                                      list[index]['website']),
                                  child: Text(
                                    "WebSite: ".toUpperCase() +
                                        list[index]['website']
                                            .toString()
                                            .toUpperCase(),
                                    style: mystyle,
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ))
                  ],
                ),
              ),
              itemCount: list.length,
            ),
    );
  }
}

Future show(String firstName, email) async {
  var ios = IOSNotificationDetails();
  var android = AndroidNotificationDetails(
      'channelId', 'channelName', 'channelDescription',
      priority: Priority.high, importance: Importance.max);

  var plat = NotificationDetails(android: android, iOS: ios);
  await notifications.show(1, firstName, email, plat);
}
