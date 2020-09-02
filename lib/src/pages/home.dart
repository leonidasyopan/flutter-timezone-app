import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/choose_location');
                },
                icon: Icon(
                  Icons.edit_location,
                  size: 20.0,
                ),
                label: Text(
                  'edit location',
                  style: TextStyle(
                    fontSize: 18.0,
                    letterSpacing: 1.2
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Text(
              data['location'],
              style: TextStyle(
                fontSize: 30.0,
                letterSpacing: 2.0
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              data['time'],
              style: TextStyle(
                fontSize: 70.0,
              ),
            ),
            SizedBox(height: 200.0),
          ],
        ),
      ),
    );
  }
}
