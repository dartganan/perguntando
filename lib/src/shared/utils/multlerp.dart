import 'package:flutter/material.dart';

class MultiLerpColor {
  

  static Color lerp({List<Color> colors, double value}){
    if(value >= 0.0 &&  value <= colors.length ){
      int index = value.truncate();
      int index2 = index + 1;
      double valueIndex = value - index;
      return Color.lerp(colors[index], colors[index2], valueIndex);
    }

    return Colors.transparent;
  }

  static Color lerpFromCount(int count, {double value}){
    if(count <= _listColors.length){
      return lerp(colors: _listColors.getRange(0, count+1).toList(), value: value);
    }
  }

  static List<Color> _listColors = [
      Color(0xFF1565C0),
      Colors.purple,
      Colors.brown,
      Colors.red,
      Colors.indigo,
      Colors.green,
      Colors.teal,
      Colors.grey[800],
    ];
  

}