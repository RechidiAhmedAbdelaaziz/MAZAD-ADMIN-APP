import 'package:flutter/material.dart';
import 'package:mazad_app/core/localization/page_strings.dart';

abstract class ResponsiveWidget<T extends PageStrings>
    extends StatelessWidget {
  final T? _strings;

  final double? _height;
  final double? _width;

  const ResponsiveWidget({
    super.key,
    T? strings,
    double? height,
    double? width,
  }) : _strings = strings,
       _height = height,
       _width = width;

  T get strings => _strings!;
  double get height => _height!;
  double get width => _width!;
}
