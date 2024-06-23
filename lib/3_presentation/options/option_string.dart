import 'package:bgsearchapp/2_application/options.dart';
import 'package:flutter/material.dart';

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
                Expanded(
                  child: TextFormField(
                    onChanged: (name) {
                      widget.option.value = name;
                    },
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
