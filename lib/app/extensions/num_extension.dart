extension RemoveDecimalFromString on double {
  String removeTrailingZeros() {
  return toString().replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
}
}