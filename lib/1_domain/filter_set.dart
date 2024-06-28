import 'package:isar/isar.dart';

import '../2_application/options/library/option_fields.dart';
part 'filter_set.g.dart';


@collection
class FilterSet {
  Id dbId = Isar.autoIncrement;
  String? value;
  @enumerated
  late OptionField optionField;

}