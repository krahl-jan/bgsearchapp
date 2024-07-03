import 'package:bgsearchapp/2_application/options/options.dart';
import 'package:bgsearchapp/2_application/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'option_delete.dart';

class OptionWidgetInt extends StatefulWidget {
  const OptionWidgetInt({super.key, required this.option});

  final OptionInt option;

  @override
  State<StatefulWidget> createState() => _OptionWidgetIntState();
}

class _OptionWidgetIntState extends State<OptionWidgetInt> {


  @override
  Widget build(BuildContext context) {
    var watch = context.watch<StateManager>().searchOptions;
    var currentRangeValues = RangeValues(widget.option.lowValue.toDouble(), widget.option.highValue.toDouble());
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Center(
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: RangeSlider(
                      values: currentRangeValues,
                      min: widget.option.range.low,
                      max: widget.option.range.high,
                      divisions: widget.option.range.steps,
                      labels: RangeLabels(
                        currentRangeValues.start.round().toString(),
                        currentRangeValues.end.round() == widget.option.range.high ? "Any" : currentRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          currentRangeValues = values;
                          widget.option.lowValue = values.start.round();
                          widget.option.highValue = values.end.round();
                          if (widget.option.highValue == widget.option.range.high) {
                            widget.option.highValue = 10000;
                          }
                        });
                      },
                    )
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
