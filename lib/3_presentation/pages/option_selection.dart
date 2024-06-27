import 'package:bgsearchapp/2_application/options/options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../2_application/options/library/option_fields.dart';
import '../../2_application/state_manager.dart';

class OptionSelection extends StatelessWidget {
  const OptionSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enum Button Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: OptionField.values.map((OptionField value) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical:8.0),
              child: ElevatedButton(
                onPressed: () {
                  context.read<StateManager>().addSearchOption(optionFactory(value));
                  // Handle button press
                  Navigator.pop(context);

                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(content: Text('Pressed: ${value.string}')),
                  //
                  // );
                },
                child: Text(value.displayString),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}