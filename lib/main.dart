import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/Screens/basket_shop_page.dart';
import 'package:sib_app/Screens/category_page.dart';
import 'package:sib_app/Screens/dashboard_screen.dart';
import 'package:sib_app/Screens/home_page.dart';
import 'package:sib_app/Screens/login_page.dart';
import 'package:sib_app/Screens/most_sell_page.dart';
import 'package:sib_app/Screens/my_profile_page.dart';
import 'package:sib_app/Screens/product_details_page.dart';
import 'package:sib_app/bloc/authentication/auth_bloc.dart';
import 'package:sib_app/bloc/banner/home/home_bloc.dart';
import 'package:sib_app/bloc/banner/home/home_event.dart';
import 'package:sib_app/bloc/basket/bloc/basket_bloc.dart';
import 'package:sib_app/bloc/basket/bloc/basket_event.dart';
import 'package:sib_app/bloc/category/bloc/category_bloc.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/data/model/card_item.dart';
import 'package:sib_app/di/2di.dart';
import 'package:sib_app/utils/5auth_manager.dart';


GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BasketItemAdapter());
  await Hive.openBox<BasketItem>('CardBox');
  await getItInit();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MaterialApp(
        navigatorKey: globalNavigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Sib App',
          home: (AuthManager.readAuth().isEmpty) ?
          BlocProvider(
            create: (context) => AuthBloc(),
            child: LoginPage(),
          ): DashBoardPage()
          ),
    );
  }
}
