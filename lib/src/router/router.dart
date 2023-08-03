import 'package:flutter_clone_instagram/src/app.dart';
import 'package:flutter_clone_instagram/src/pages/error.dart';
import 'package:flutter_clone_instagram/src/pages/upload.dart';
import 'package:go_router/go_router.dart';

final GoRouter route = GoRouter(
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
