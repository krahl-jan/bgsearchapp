import 'package:bgsearchapp/2_application/operators.dart';
import 'package:bgsearchapp/2_application/options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OptionWidgetAge extends StatefulWidget {
  const OptionWidgetAge({super.key});

  @override
  State<StatefulWidget> createState() => _OptionWidgetAgeState();
}

class _OptionWidgetAgeState extends State<OptionWidgetAge> {
  Option option = OptionAge(null, null);
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.cyanAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Age: "),
              DropdownButton<String>(items: [
                for (final value in Operator.values)
                  DropdownMenuItem(value: value.string, child: Text(value.string))
              ], onChanged: (String? value) {}
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: TextField(
                  controller: textController,
                ),
              ),
              const IconButton(onPressed: null, icon: Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
