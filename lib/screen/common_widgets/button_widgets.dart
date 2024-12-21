import 'package:blueferns_machine_test/screen/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final String tag;
  final VoidCallback onTap;
  const PrimaryButton(
      {super.key, required this.title, required this.onTap, required this.tag});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: tag,
      onPressed: () {
        onTap();
      },
      label: TextWidget(text: title),
    );
  }
}
