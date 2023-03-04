
extension StringExtension on String? {


  String? maskSurname() {
    if (this == null) return null;
    try {
      final trimmedName = this!.trim();
      final indexOfLastSpace = trimmedName.lastIndexOf(' ');
      return this!.replaceRange(indexOfLastSpace + 2, this!.length, '.');
    } catch (e) {
      return this;
    }
  }
}


extension DiacriticsAwareString on String {
  static const diacritics = 'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏİìíîïÙÚÛÜùúûüÑñŠšŸÿýŽžıŞşĞğ';
  static const nonDiacritics =
      'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiiUUUUuuuuNnSsYyyZziSsGg';

  String get withoutDiacriticalMarks => this.splitMapJoin('',
      onNonMatch: (char) => char.isNotEmpty && diacritics.contains(char)
          ? nonDiacritics[diacritics.indexOf(char)]
          : char);
}
