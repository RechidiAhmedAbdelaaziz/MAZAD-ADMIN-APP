import 'package:flutter/material.dart';
import 'package:mazad_app/core/localization/page_strings.dart';

abstract class DeviceScreen<T extends PageStrings>
    extends StatelessWidget {
  final T strings;

  const DeviceScreen({super.key, required this.strings});
}
