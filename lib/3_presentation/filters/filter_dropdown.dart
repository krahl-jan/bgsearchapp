import 'package:bgsearchapp/2_application/filters/filters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../2_application/state_manager.dart';
import 'filter_delete.dart';

class OptionWidgetDropdown extends StatefulWidget {
  const OptionWidgetDropdown({super.key, required this.option});

  final OptionDropdownList option;

  @override
  State<StatefulWidget> createState() => _OptionWidgetDropdownState();
}

class _OptionWidgetDropdownState extends State<OptionWidgetDropdown> {
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
                Text(widget.option.filterType.displayString),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(items: [
                    for (final value in widget.option.value.getAllValues())
                      DropdownMenuItem(value: value.getLinkString(), child: Text(value.getDisplayString()))
                  ],
                    onChanged: (String? value) {
                      context.read<StateManager>().hasNewFilters = true;
                      if (value != null) {
                        setState(() {
                          widget.option.value = widget.option.value.factoryFromString(value);
                        });
                      }
                    }, value: widget.option.value.getLinkString(),
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