import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    Response response =
        await get('http://worldtimeapi.org/api/timezone/America/Sao_Paulo');

    Map data = jsonDecode(response.body);
    // print(data);

    String dateTime = data['datetime'];
    String offset = data['utc_offset'];
    String offsetDirection = offset.substring(0, 1);
    print(dateTime);
    print(offset);
    print(offsetDirection);

    offset = offset.substring(1, 3);

    DateTime now = DateTime.parse(dateTime);
    // print(now);
    if (offsetDirection == '+') {
      now = now.add(new Duration(hours: int.parse(offset)));
    } else {
      now = now.subtract(new Duration(hours: int.parse(offset)));
    }
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading'),
    );
  }
}
