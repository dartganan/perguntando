import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class EventBloc extends BlocBase {
  PageController pageController;
  ScrollController backgroundController;

  EventBloc(){
    pageController = PageController(viewportFraction: 0.65);
    backgroundController = ScrollController();

    pageController.addListener(() {
      var _backgroundOffset = pageController.offset *
          backgroundController.position.maxScrollExtent /
          pageController.position.maxScrollExtent;

      backgroundController.position.jumpTo(_backgroundOffset);
    });
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    pageController.dispose();
    backgroundController.dispose();
    super.dispose();
  }
}
