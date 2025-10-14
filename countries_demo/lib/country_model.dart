class CountryModel {
  final String name;
  final String native;
  final String capital;
  final String emoji;
  final String currency;

  CountryModel({
    required this.name,
    required this.native,
    required this.capital,
    required this.emoji,
    required this.currency,
  });

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      name: map['name'] ?? '',
      native: map['native'] ?? '',
      capital: map['capital'] ?? '',
      emoji: map['emoji'] ?? '',
      currency: map['currency'] ?? '',
    );
  }
}