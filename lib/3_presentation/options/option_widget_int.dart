import 'package:bgsearchapp/2_application/operators.dart';
import 'package:bgsearchapp/2_application/options/options.dart';
import 'package:flutter/material.dart';

import 'option_delete.dart';

class OptionWidgetInt extends StatefulWidget {
  const OptionWidgetInt({super.key, required this.option});

  final OptionInt option;

  @override
  State<StatefulWidget> createState() => _OptionWidgetIntState();
}

class _OptionWidgetIntState extends State<OptionWidgetInt> {
  final textController = TextEditingController();
  late RangeValues _currentRangeValues;
  @override
  void initState() {
    super.initState();
    _currentRangeValues = RangeValues(widget.option.range.low, widget.option.range.high);
  }

  @override
  Widget build(BuildContext context) {
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
                      values: _currentRangeValues,
                      min: widget.option.range.low,
                      max: widget.option.range.high,
                      divisions: widget.option.range.steps,
                      labels: RangeLabels(
                        _currentRangeValues.start.round().toString(),
                        _currentRangeValues.end.round() == widget.option.range.high ? "Any" : _currentRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
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
