abstract class DropdownListElement {
  String getDisplayString();
  String getLinkString();
  List<DropdownListElement> getAllValues();
  DropdownListElement factoryFromString(String s);
}