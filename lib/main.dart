import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/Screens/dashboard_page.dart';
import 'package:sib_app/Screens/login_page.dart';
import 'package:sib_app/Screens/sign_up_page.dart';
import 'package:sib_app/bloc/authentication/auth_bloc.dart';
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
        home: 
        (AuthManager.readAuth().isEmpty)
            ?  LoginPage()
              
            : DashBoardPage(),
      ),
    );
  }
}
