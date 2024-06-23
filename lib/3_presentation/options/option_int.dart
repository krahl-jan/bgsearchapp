import 'package:bgsearchapp/2_application/operators.dart';
import 'package:bgsearchapp/2_application/options.dart';
import 'package:flutter/material.dart';

class OptionWidgetInt extends StatefulWidget {
  const OptionWidgetInt({super.key, required this.option});

  final Option option;

  @override
  State<StatefulWidget> createState() => _OptionWidgetIntState();
}

class _OptionWidgetIntState extends State<OptionWidgetInt> {
  final textController = TextEditingController();

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
                Text(widget.option.getName()),
                DropdownButton<String>(items: [
                  for (final value in Operator.values)
                    DropdownMenuItem(value: value.string, child: Text(value.string))
                ], onChanged: (String? value) {}
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      controller: textController,
                    ),
                  ),
                ),
                const IconButton(onPressed: null, icon: Icon(Icons.delete)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}