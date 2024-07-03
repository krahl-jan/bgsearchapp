import 'package:bgsearchapp/2_application/options/options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../2_application/state_manager.dart';
import 'option_delete.dart';

class OptionWidgetString extends StatefulWidget {
  const OptionWidgetString({super.key, required this.option});

  final OptionString option;

  @override
  State<StatefulWidget> createState() => _OptionWidgetStringState();
}

class _OptionWidgetStringState extends State<OptionWidgetString> {
  @override
  Widget build(BuildContext context) {
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
                Text(widget.option.optionField.displayString),
                SizedBox(width: 10,),
                Expanded(
                  child: TextFormField(
                    initialValue: widget.option.value,
                    onChanged: (name) {
                      context.read<StateManager>().hasNewFilters = true;
                      widget.option.value = name;
                    },
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
