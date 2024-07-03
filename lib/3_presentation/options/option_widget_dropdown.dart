import 'package:bgsearchapp/2_application/options/options.dart';
import 'package:flutter/material.dart';
import 'option_delete.dart';

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
            color: Colors.cyanAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.option.optionField.displayString),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(items: [
                    for (final value in widget.option.value.getAllValues())
                      DropdownMenuItem(value: value.getLinkString(), child: Text(value.getDisplayString()))
                  ],
                    onChanged: (String? value) {
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
