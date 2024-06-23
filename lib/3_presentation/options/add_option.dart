import 'package:flutter/material.dart';

class OptionWidgetAddOption extends StatefulWidget {
  const OptionWidgetAddOption({super.key});

  static const int priority = 1000;

  @override
  State<StatefulWidget> createState() => _OptionWidgetAddOptionState();

}

class _OptionWidgetAddOptionState extends State<OptionWidgetAddOption> {

  @override
  Widget build(BuildContext context) {
    return const IconButton(onPressed: null, icon:  Icon(Icons.add));
  }
}
