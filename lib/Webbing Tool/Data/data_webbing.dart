import 'data_stretch.dart';


class Webbing {

  final String name ;
  final String? brand ;
  final Stretch? stretch ;
  final String? materialType ;
  final double? weight ;
  final double? breakingStrength ;


  Webbing({required this.brand, required this.name, required this.stretch, required this.materialType, required this.weight, required this.breakingStrength});

  factory Webbing.fromJson(Map<String, dynamic> json) {
    return Webbing(
      name: json['name'] as String,
      brand: json['brand'] as String,
      stretch: Stretch.fromJson(json['stretch']),
      materialType : json['materialType'] as String,
      weight: json['weight'] == "" ? (null) : (json['weight'] is String ? double.parse(json['weight']) : json['weight'].toDouble() ), //Needed because Sometimes the data is considered String, and sometimes int ...
      breakingStrength : json['breakingStrength'] == "" ? (null) : (json['breakingStrength'] is String ? double.parse(json['breakingStrength']) : json['breakingStrength'].toDouble()),
    );

  }

  Map<String, dynamic> toJson() =>  <String, dynamic>{
    'name': name,
    'brand': brand,
  };

  @override
  String toString() {
    String webbingDescription = "Name : $name, Brand : $brand, stretch: $stretch, materialType : $materialType, weight : $weight, breaking strenght: $breakingStrength";
    return webbingDescription;
  }


}