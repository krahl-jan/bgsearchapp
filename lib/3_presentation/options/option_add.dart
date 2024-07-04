import 'package:flutter/material.dart';

import '../pages/filter_selection.dart';

class OptionWidgetAddOption extends StatefulWidget {
  const OptionWidgetAddOption({super.key});

  @override
  State<StatefulWidget> createState() => _OptionWidgetAddOptionState();

}

class _OptionWidgetAddOptionState extends State<OptionWidgetAddOption> {

  _showFullModal(context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false, // should dialog be dismissed when tapped outside
        barrierLabel: "Add Option", // label for barrier
        transitionDuration: const Duration(milliseconds: 300), // how long it takes to popup dialog after button click
    pageBuilder: (_, __, ___) {
          return const FilterSelection();
    },);
  }

    @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () { _showFullModal(context);}, icon:  const Icon(Icons.add));
  }
}


