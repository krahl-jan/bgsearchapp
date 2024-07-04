import 'package:bgsearchapp/1_domain/filter_set.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../../2_application/state_manager.dart';

class FilterSetSelection extends StatefulWidget {
  const FilterSetSelection({super.key});

  @override
  State<FilterSetSelection> createState() => _FilterSetSelectionState();
}

class _FilterSetSelectionState extends State<FilterSetSelection> {
  List<FilterSet>? filterSets;

  void loadFilterSets(BuildContext context) async {
    Isar isar = context.read<StateManager>().isar;
    List<FilterSet> list = await isar.filterSets.where().findAll();
    setState(() {
      filterSets = list;
    });
  }

  void setFilterSet(BuildContext context, FilterSet set) {
    context.read<StateManager>().setSearchOptions(toOptionList(set));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    loadFilterSets(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('FilterSet Selection'),
      ),
      body: filterSets != null
          ? ListView.builder(
              itemCount: filterSets!.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Center(
                    child: Text(filterSets![i].name),
                  ),
                  onTap: () => setFilterSet(context, filterSets![i]),
                );
              })
          : Center(
              heightFactor: 7,
              child: LoadingAnimationWidget.inkDrop(
                  color: Colors.blueAccent, size: 30)),
    );
  }
}
