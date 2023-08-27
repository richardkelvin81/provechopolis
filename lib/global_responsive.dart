import 'package:flutter/material.dart';

class GlobalResponsive {
  static double smallFont(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1200) {
      return 12.0;
    } else if (screenWidth >= 500) {
      return 14.0;
    } else if (screenWidth >= 450) {
      return 13.0;
    } else if (screenWidth >= 400) {
      return 12.0;
    } else if (screenWidth >= 350) {
      return 11.0;
    } else {
      return 10.0;
    }
  }

  static double mediumFont(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1200) {
      return 19.0;
    } else if (screenWidth >= 500) {
      return 22.0;
    } else if (screenWidth >= 450) {
      return 21.0;
    } else if (screenWidth >= 400) {
      return 20.0;
    } else if (screenWidth >= 350) {
      return 19.0;
    } else if (screenWidth >= 350) {
      return 18.0;
    } else {
      return 17.0;
    }
  }

  static double largeFont(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 500) {
      return 32.0;
    } else if (screenWidth >= 450) {
      return 30.0;
    } else if (screenWidth >= 400) {
      return 28.0;
    } else if (screenWidth >= 350) {
      return 26.0;
    } else if (screenWidth >= 300) {
      return 24.0;
    } else {
      return 24.0;
    }
  }

  static double bigDiference(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 500) {
      return 33.0;
    } else if (screenWidth >= 450) {
      return 30.0;
    } else if (screenWidth >= 400) {
      return 27.0;
    } else if (screenWidth >= 350) {
      return 24.0;
    } else if (screenWidth >= 300) {
      return 21.0;
    } else {
      return 18.0;
    }
  }

  static double paddingText(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1200) {
      return 12.0;
    } else if (screenWidth >= 500) {
      return 14.0;
    } else if (screenWidth >= 500) {
      return 13.5;
    } else if (screenWidth >= 500) {
      return 13.0;
    } else {
      return 12.5;
    }
  }
}
