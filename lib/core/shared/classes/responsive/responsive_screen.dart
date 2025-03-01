import 'package:flutter/material.dart';
import 'package:mazad_app/core/localization/page_strings.dart';

abstract class ResponsiveScreen<T extends PageStrings>
    extends StatelessWidget {
  final Widget Function(T strings) mobileBuilder;
  final Widget Function(T strings) webBuilder;

  final T Function(BuildContext context) strings;

  const ResponsiveScreen({
    super.key,
    required this.mobileBuilder,
    required this.webBuilder,
    required this.strings,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder:
          (context, constraints) =>
              constraints.maxWidth < 600
                  ? mobileBuilder(strings(context))
                  : webBuilder(strings(context)),
    );
  }
}
