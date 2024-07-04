import 'package:bgsearchapp/1_domain/filter_set.dart';
import 'package:flutter/material.dart';

class FilterDbView extends StatelessWidget {
  const FilterDbView({super.key, required this.filter});

  final FilterDB filter;

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
                Text(filter.filter.displayString),
                const SizedBox(width: 15),
                Text(filter.value2 ?? ""),
                const SizedBox(width: 15),
                Text(filter.value ?? "")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
