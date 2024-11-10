import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// if width is less than 600 then it is mobile
  bool get isMobile => MediaQuery.of(this).size.width < 600;

  /// if width is greater than 600 and less than 1024 then it is tablet
  bool get isTablet =>
      MediaQuery.of(this).size.width >= 600 &&
      MediaQuery.of(this).size.width <= 1024;

  /// if width is greater than 1024 then it is desktop
  bool get isDesktop => MediaQuery.of(this).size.width > 1024;
  double get deviceWidth => MediaQuery.sizeOf(this).width;

  double get deviceHeight => MediaQuery.sizeOf(this).height;

  // Navigate to a new screen using push (non-named routes) with optional fade transition
  Future<T?> pushPage<T>(Widget page, {bool fadeTransition = false}) {
    return Navigator.of(this).push<T>(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          if (fadeTransition) {
            return FadeTransition(opacity: animation, child: child);
          }
          return child;
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  // Navigate to a named route with optional fade transition
  Future<T?> pushNamedPage<T>(String routeName,
      {Object? arguments, bool fadeTransition = false}) {
    return Navigator.of(this).pushNamed<T>(
      routeName,
      arguments: arguments,
      // Optionally add fade transition
    );
  }

  // Pop the current screen
  void popPage<T>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }

  // Pop until the specified route
  void popUntilPage(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }

  // Replace the current screen with a new screen (non-named routes) with optional fade transition
  Future<T?> replacePage<T>(Widget page, {bool fadeTransition = false}) {
    return Navigator.of(this).pushReplacement<T, T>(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          if (fadeTransition) {
            return FadeTransition(opacity: animation, child: child);
          }
          return child;
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  // Replace the current screen with a new named screen with optional fade transition
  Future<T?> replaceNamedPage<T>(String routeName,
      {Object? arguments, bool fadeTransition = false}) {
    return Navigator.of(this).pushReplacementNamed<T, T>(
      routeName,
      arguments: arguments,
    );
  }

  // Clear the stack and push a new screen (pop until root, then push) with optional fade transition
  Future<T?> pushAndRemoveUntil<T>(Widget page, {bool fadeTransition = false}) {
    return Navigator.of(this).pushAndRemoveUntil<T>(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          if (fadeTransition) {
            return FadeTransition(opacity: animation, child: child);
          }
          return child;
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
      (route) => false, // This will remove all previous routes
    );
  }

  // Clear the stack and push a new named screen (pop until root, then push) with optional fade transition
  Future<T?> pushNamedAndRemoveUntil<T>(String routeName,
      {Object? arguments, bool fadeTransition = false}) {
    return Navigator.of(this).pushNamedAndRemoveUntil<T>(
      routeName,
      (route) => false, // This will remove all previous routes
      arguments: arguments,
    );
  }
}
