import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  bool get mounted {
    try {
      widget;
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  void push(Widget screen) {
    Navigator.of(this).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => screen,
    ));
  }

  void pushReplacement(Widget screen) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => screen,
      ),
    );
  }

  void pop() {
    Navigator.of(this).pop();
  }
}
