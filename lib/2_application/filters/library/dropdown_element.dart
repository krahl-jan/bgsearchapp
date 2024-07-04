abstract class DropdownListElement {
  String getDisplayString();
  String getLinkString();
  String getName();
  List<DropdownListElement> getAllValues();
  DropdownListElement factoryFromString(String s);
}