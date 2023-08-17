import 'package:Catalogy/utils/routes.dart';
import 'package:Catalogy/widgets/theme.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:velocity_x/velocity_x.dart';
import 'Pages/cart_page.dart';
import 'Pages/home_page.dart';
import 'Pages/login_page.dart';
import 'core/store.dart';

void main() {
  runApp(VxState(store: MyStore(),child:const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme:MyTheme.lightTheme(context),
        darkTheme:MyTheme.darkTheme(context),
        debugShowCheckedModeBanner: false,
        initialRoute: MyRoutes.loginRoute,
        routes: {
          "/": (context) => const LoginPage(),
          MyRoutes.homeRoute: (context) => const HomePage(),
          MyRoutes.loginRoute: (context) => const LoginPage(),
          MyRoutes.cartRoute: (context) => const CartPage()
        }
        );
  }
}
