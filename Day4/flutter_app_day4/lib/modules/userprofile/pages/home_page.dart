import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_day3/modules/userprofile/pages/profile_page.dart';
import 'package:flutter_app_day3/modules/userprofile/states/user_state.dart';
import 'package:flutter_app_day3/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    final userState = Provider.of<UserState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Ex03'),
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
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   tooltip: 'Reload',
      //   child: (userState.state == ViewState.Loading)
      //       ? const CircularProgressIndicator(
      //           backgroundColor: Colors.white,
      //         )
      //       : const Icon(Icons.refresh),
      //   onPressed: () {
      //     userState.loadData();
      //   },
      // ),
      body: (userState.state == ViewState.Loading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: userState.listUser.length,
              itemBuilder: (context, index) => ListTile(
                leading: Hero(
                  tag: 'image$index',
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                        userState.listUser[index].picture.thumbnail),
                  ),
                ),
                title: Text(
                  userState.listUser[index].fullName(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(userState.listUser[index].email),
                onTap: () {
                  userState.setCurrentUser = userState.listUser[index];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(index: index),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
