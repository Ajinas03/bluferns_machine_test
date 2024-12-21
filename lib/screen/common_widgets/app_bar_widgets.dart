import 'package:blueferns_machine_test/screen/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget primaryAppBar({required String title}) {
  return AppBar(
    titleSpacing: -10,
    leading: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: const Icon(Icons.chevron_left)),
    title: TextWidget(
      text: title,
      fontWeight: FontWeight.bold,
    ),
    actions: const [],
  );
}
