import 'package:flutter/material.dart';
import 'package:flutter_app_day3/routes/route_name.dart';

class ProfileTabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: FlatButton(
          child: const Text('Go to Profile Detail'),
          onPressed: () =>
              Navigator.pushNamed(context, RouteNames.profileDetail),
        ),
      ),
    );
  }
}
