import 'package:bgsearchapp/2_application/filters/filters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../2_application/state_manager.dart';
import 'filter_delete.dart';

class OptionWidgetString extends StatefulWidget {
  const OptionWidgetString({super.key, required this.option});

  final FilterString option;

  @override
  State<StatefulWidget> createState() => _OptionWidgetStringState();
}

class _OptionWidgetStringState extends State<OptionWidgetString> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    myController.addListener(() {context.read<StateManager>().hasNewFilters = true;
    widget.option.value = myController.text;});
  }

  @override
  Widget build(BuildContext context) {
    myController.text = widget.option.value ?? "";
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).focusColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.option.filterType.displayString),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: myController,
                  ),
                ),
                OptionWidgetDeleteOption(option: widget.option),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
