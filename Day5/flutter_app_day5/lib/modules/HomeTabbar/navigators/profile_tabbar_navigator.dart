import 'package:flutter/material.dart';
import 'package:flutter_app_day3/modules/HomeTabbar/pages/profile_detail_tabbar.dart';
import 'package:flutter_app_day3/modules/HomeTabbar/pages/profile_tabbar.dart';
import 'package:flutter_app_day3/routes/route_name.dart';

class ProfileTabbarNavigator extends StatefulWidget {
  @override
  _ProfileTabbarState createState() => _ProfileTabbarState();
}

GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>();

class _ProfileTabbarState extends State<ProfileTabbarNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _homeNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            // ignore: missing_return
            builder: (BuildContext context) {
              switch (settings.name) {
                case RouteNames.profile:
                  return ProfileTabbar();
                case RouteNames.profileDetail:
                  return ProfileDetailTabbar();
              }
            });
      },
    );
  }
}
