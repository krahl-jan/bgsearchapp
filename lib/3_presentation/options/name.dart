import 'package:bgsearchapp/2_application/options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OptionWidgetName extends StatefulWidget {
  const OptionWidgetName({super.key});

  @override
  State<StatefulWidget> createState() => _OptionWidgetNameState();
}

class _OptionWidgetNameState extends State<OptionWidgetName> {
  Option option = OptionName("");
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Name: "),
          SizedBox(
            width: 500,
            height: 50,
            child: TextField(
              controller: textController,
            ),
          )
        ],
      ),
    );
  }
}
