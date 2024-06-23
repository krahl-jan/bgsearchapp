import 'package:bgsearchapp/2_application/options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'option_int.dart';
import 'option_string.dart';

class OptionWidgetImp extends StatefulWidget {
  const OptionWidgetImp({super.key, required this.option});

  final Option option;

  @override
  State<StatefulWidget> createState() => _OptionWidgetImpState();
}

class _OptionWidgetImpState extends State<OptionWidgetImp> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.option.getType() == 0) {
      return OptionWidgetString(option: widget.option);
    }
    if (widget.option.getType() == 1) {
      return OptionWidgetInt(option: widget.option);
    }
    else {
      return Container();
    }

  }
}
