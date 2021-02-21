import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_day3/modules/userprofile/states/user_state.dart';
import 'package:flutter_app_day3/providers/theme_provider.dart';
import 'package:flutter_app_day3/utils/uidata.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final int index;

  const ProfilePage({this.index});

  @override
  Widget build(BuildContext context) {
    final double responsive = MediaQuery.of(context).size.height;
    final theme = Provider.of<ThemeProvider>(context);
    final userState = Provider.of<UserState>(context);

    return Scaffold(
      appBar: AppBar(
          title: Text(userState.currentUser.fullName()),
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,
              ),
              onPressed: () {
                if (theme.currentTheme == ThemeState.light) {
                  theme.setTheme = ThemeState.dark;
                } else {
                  theme.setTheme = ThemeState.light;
                }
              },
            )
          ]),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(0.0),
                height: responsive * 0.2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      userState.currentUser.picture.large),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  repeat: ImageRepeat.noRepeat,
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  padding: EdgeInsets.only(top: responsive * 0.15),
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: responsive * 0.15, bottom: responsive * 0.05),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              userState.currentUser.fullName(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 40.0),
                            ),
                          ),
                          _spacing(context),
                          Text(
                            userState.currentUser.email,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          _spacing(context),
                          Text(userState.currentUser.phone),
                          _spacing(context),
                          // Text(
                          //   userState.currentUser.dob.split("T")[0],
                          // ),
                          _spacing(context),
                          _spacing(context),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image.asset(
                                    UIData.icFb,
                                    width: 30.0,
                                  ),
                                ),
                                onTap: () {},
                              ),
                              InkWell(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image.asset(
                                    UIData.icInstagram,
                                    width: 30.0,
                                  ),
                                ),
                                onTap: () {
                                  print("Instagram");
                                },
                              ),
                              InkWell(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image.asset(
                                    UIData.icWebsite,
                                    width: 30.0,
                                  ),
                                ),
                                onTap: () {},
                              ),
                              InkWell(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image.asset(
                                    UIData.icLinkedin,
                                    width: 30.0,
                                  ),
                                ),
                                onTap: () {},
                              ),
                              InkWell(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image.asset(
                                    UIData.icTwitter,
                                    width: 30.0,
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    elevation: 5.0,
                  ),
                ),
              ),
              Card(
                elevation: 10.0,
                shape: const CircleBorder(),
                color: Colors.transparent,
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: responsive * 0.02),
                  child: Center(
                    child: Hero(
                      tag: 'image$index',
                      child: CircleAvatar(
                        radius: 100.0,
                        backgroundImage: CachedNetworkImageProvider(
                            userState.currentUser.picture.large),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _spacing(BuildContext context) {
    final responsive = MediaQuery.of(context).size.height;
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: responsive * 0.01,
            width: 500.0,
          ),
        )
      ],
    );
  }
}
