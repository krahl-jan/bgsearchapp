import 'package:bgsearch/2_application/filters/filters.dart';
import 'package:bgsearch/2_application/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionWidgetDeleteOption extends StatefulWidget {
  const OptionWidgetDeleteOption({super.key, required this.option});

  final Filter option;

  @override
  State<StatefulWidget> createState() => _OptionWidgetDeleteOptionState();

}

class _OptionWidgetDeleteOptionState extends State<OptionWidgetDeleteOption> {

  _deleteOption(BuildContext context) {
    context.read<StateManager>().removeSearchOption(widget.option);
  }

    @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () { _deleteOption(context);}, icon:  const Icon(Icons.delete));
  }
}


