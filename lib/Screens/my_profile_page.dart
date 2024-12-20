import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sib_app/Screens/dashboard_page.dart';
import 'package:sib_app/Screens/login_page.dart';
import 'package:sib_app/bloc/authentication/auth_bloc.dart';
import 'package:sib_app/bloc/authentication/auth_state.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/main.dart';
import 'package:sib_app/utils/5auth_manager.dart';
import 'package:sib_app/widgets/list_tile_items.dart';
import 'package:sib_app/widgets/my_app_bar.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.homePageBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(
                appBarTitle: 'حساب کاربری',
                mainAxisAlignment: MainAxisAlignment.center,
                leftIcon: 'assets/images/back.png',
                showLeftIcon: false,
                fontFamily: 'shbold',
                textPadding: EdgeInsets.only(right: 0),
                rightIcon: 'assets/images/search.png',
                showRightIcon: false,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: ListTile(
                  tileColor: Colors.transparent,
                  trailing: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Image.asset(
                      'assets/images/pencil.png',
                      height: 21,
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      'آراد آذرپناه',
                    ),
                  ),
                  subtitleTextStyle: TextStyle(
                      fontFamily: 'shmid',
                      fontSize: 13,
                      color: LightColors.listTilePhoneNumber),
                  titleTextStyle: TextStyle(fontFamily: 'shbold', fontSize: 16),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('09337109366'),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  AuthManager.logout();

                  globalNavigatorKey.currentState
                      ?.pushReplacement(MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
                },
                child: Text('خروج'),
              ),
              ListTileItems(),
              Divider(
                color: LightColors.dividerColor,
                endIndent: 24,
                indent: 24,
              ),
              ListTileItems(),
              Divider(
                color: LightColors.dividerColor,
                endIndent: 24,
                indent: 24,
              ),
              ListTileItems(),
              Divider(
                color: LightColors.dividerColor,
                endIndent: 24,
                indent: 24,
              ),
              ListTileItems(),
              Divider(
                color: LightColors.dividerColor,
                endIndent: 24,
                indent: 24,
              ),
              ListTileItems(),
              Divider(
                color: LightColors.dividerColor,
                endIndent: 24,
                indent: 24,
              ),
              ListTileItems(),
              Divider(
                color: LightColors.dividerColor,
                endIndent: 24,
                indent: 24,
              ),
              ListTileItems(),
              Divider(
                color: LightColors.dividerColor,
                endIndent: 24,
                indent: 24,
              ),
              ListTileItems(),
              Divider(
                color: LightColors.dividerColor,
                endIndent: 24,
                indent: 24,
              ),
              ListTileItems(),
              Divider(
                color: LightColors.dividerColor,
                endIndent: 24,
                indent: 24,
              ),
              ListTileItems(),
              Divider(
                color: LightColors.dividerColor,
                endIndent: 24,
                indent: 24,
              ),
              Text(
                'ساخته شده توسط آراد آذرپناه',
                style: TextStyle(
                    fontFamily: 'shbold',
                    fontSize: 10,
                    color: LightColors.seeAllText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
