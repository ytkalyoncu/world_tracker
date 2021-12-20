import 'dart:convert';

class Country {
  String code;
  String name;
  bool been;
  bool want;
  bool fav;
  // Upcoming features
  // String info;
  // String notes;
  // Map date {'beenLog': {}, 'wantLog':{}}

  Country({
    required this.code,
    required this.name,
    required this.been,
    required this.want,
    required this.fav,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'been': been,
      'want': want,
      'fav': fav,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      code: map['code'] ?? '',
      name: map['name'] ?? '',
      been: map['been'] ?? false,
      want: map['want'] ?? false,
      fav: map['fav'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source));
}
