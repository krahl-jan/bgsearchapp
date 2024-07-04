import 'package:bgsearchapp/2_application/filters/filters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../2_application/filters/library/filter_types.dart';
import '../../../2_application/state_manager.dart';

class FilterSelection extends StatelessWidget {
  const FilterSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enum Button Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Select an Option',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24.0),
              Wrap(
                spacing: 20.0, // Horizontal space between buttons
                runSpacing: 20.0, // Vertical space between lines
                alignment: WrapAlignment.center,
                children: FilterEnum.values.map((FilterEnum optionField) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Theme.of(context).primaryColor, padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: !context.read<StateManager>().isOptionSelected(optionField) ? () {
                      context.read<StateManager>().addSearchOption(optionFactory(filterEnum: optionField));
                      Navigator.pop(context);
                    }  : null,
                    child: Text(
                      optionField.displayString,
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}