import 'package:flutter/material.dart';
import 'package:time_in_the_world/src/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading...';

  void setupSpecificCityTime() async {
    WorldTime instance = WorldTime(
        flag: '/london.png', location: 'Berlin', url: 'America/Sao_Paulo');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time
    });
  }

  @override
  void initState() {
    super.initState();
    setupSpecificCityTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(40.0),
      child: Text('loading...'),
    ));
  }
}
