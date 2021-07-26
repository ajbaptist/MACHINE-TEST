import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  onTap: () {
                    print([index]);
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(list[index]['avatar']),
                  ),
                  title: Text(
                      "${list[index]['first_name']}  ${list[index]['last_name']}"),
                ),
              ),
              itemCount: list.length,
            ),
    );
  }
}
