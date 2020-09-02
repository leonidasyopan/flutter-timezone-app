import 'package:flutter/material.dart';
import 'package:time_in_the_world/src/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading...';

  void currentTime() async {
    WorldTime instance = WorldTime(
        flag: '/london.png', location: 'Berlin', url: 'Europe/Berlin');
    await instance.getTime();
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    currentTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Text(time),
      )
    );
  }
}
