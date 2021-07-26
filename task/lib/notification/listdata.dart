import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
    var response = await dio.get("https://reqres.in/api/users?page=2");
    setState(() {
      var data = response.data;
      list = data['data'];
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
              itemBuilder: (context, index) => ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    onTap: () {
                      show(list[index]['first_name'], list[index]['email']);
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(list[index]['avatar']),
                    ),
                    title: Text(
                        "${list[index]['first_name']}  ${list[index]['last_name']}"),
                  ),
                ),
              ),
              itemCount: 1,
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
