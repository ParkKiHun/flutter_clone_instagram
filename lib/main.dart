import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/app.dart';
import 'package:flutter_clone_instagram/src/viewmodel/bottom_nav_viewmodel.dart';
import 'package:flutter_clone_instagram/src/pages/error.dart';
import 'package:flutter_clone_instagram/src/pages/upload.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _route = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => App(),
      ),
      GoRoute(
        name: 'upload',
        path: '/upload',
        builder: (context, state) => const Upload(),
      ),
    ],
    errorBuilder: (context, state) {
      return CustomError(errorDetails: state.error.toString());
    },
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavViewModel>(
          create: (_) => BottomNavViewModel(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Colors.blue,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(color: Colors.black),
            )),
        routerConfig: _route,
      ),
    );
  }
}
