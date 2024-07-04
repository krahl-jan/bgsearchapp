import 'dart:math';

import 'package:bgsearchapp/2_application/options/filters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../2_application/state_manager.dart';
import 'option_delete.dart';

class OptionWidgetInt extends StatefulWidget {
  const OptionWidgetInt({super.key, required this.option});

  final FilterInt option;

  @override
  State<StatefulWidget> createState() => _OptionWidgetIntState();
}

class _OptionWidgetIntState extends State<OptionWidgetInt> {


  @override
  Widget build(BuildContext context) {
    var lowValue = max(widget.option.lowValue.toDouble(), widget.option.range.low.toDouble());
    var highValue = min(widget.option.highValue.toDouble(), widget.option.range.high.toDouble());
    var currentRangeValues = RangeValues(lowValue, highValue);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Center(
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: RangeSlider(
                      values: currentRangeValues,
                      min: widget.option.range.low.toDouble(),
                      max: widget.option.range.high.toDouble(),
                      divisions: widget.option.range.steps,
                      labels: RangeLabels(
                        currentRangeValues.start.round().toString(),
                        currentRangeValues.end.round() == widget.option.range.high ? "Any" : currentRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        context.read<StateManager>().hasNewFilters = true;
                        setState(() {
                          currentRangeValues = values;
                          widget.option.lowValue = values.start.round().toInt();
                          widget.option.highValue = values.end.round().toInt();
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
