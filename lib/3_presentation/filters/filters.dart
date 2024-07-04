import 'package:bgsearch/2_application/filters/filters.dart';
import 'package:bgsearch/3_presentation/filters/filter_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'filter_int_slider.dart';
import 'filter_string.dart';

class OptionWidgetImp extends StatefulWidget {
  const OptionWidgetImp({super.key, required this.option});

  final Filter option;

  @override
  State<StatefulWidget> createState() => _OptionWidgetImpState();
}

class _OptionWidgetImpState extends State<OptionWidgetImp> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.option is FilterString) {
      return OptionWidgetString(option: (widget.option as FilterString));
    }
    if (widget.option is FilterInt) {
      return OptionWidgetInt(option: (widget.option as FilterInt));
    }
    else {
      return OptionWidgetDropdown(option: (widget.option as OptionDropdownList));
    }

  }
}
