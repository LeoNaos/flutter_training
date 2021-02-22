import 'package:flutter/material.dart';
import 'package:flutter_app_day3/modules/HomeTabbar/pages/home_detail_tabbar.dart';
import 'package:flutter_app_day3/modules/HomeTabbar/pages/home_tabbar.dart';
import 'package:flutter_app_day3/routes/route_name.dart';

class HomeTabbarNavigator extends StatefulWidget {
  @override
  _HomeTabbarState createState() => _HomeTabbarState();
}

GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>();

class _HomeTabbarState extends State<HomeTabbarNavigator> {
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
                case RouteNames.home:
                  return HomeTabbar();
                case RouteNames.homeDetail:
                  return HomeDetailTabbar();
              }
            });
      },
    );
  }
}
