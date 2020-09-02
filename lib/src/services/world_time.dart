import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');

      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'];
      String offsetDirection = offset.substring(0, 1);

      offset = offset.substring(1, 3);

      DateTime now = DateTime.parse(dateTime);
      if (offsetDirection == '+') {
        now = now.add(new Duration(hours: int.parse(offset)));
      } else {
        now = now.subtract(new Duration(hours: int.parse(offset)));
      }

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (error) {
      print('error caught: $error');
      time = 'An error occurred. Please, try again!';
    }
  }
}
