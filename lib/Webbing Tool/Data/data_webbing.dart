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
    // If it's an empty string or the field is not present, return null.

    double? weight ;
    double? breakingStrength ;
    //Needed because Sometimes the data is considered String, and sometimes int ...
    if (json['weight'] != null) {
      if (json['weight'] is String) {
        json['weight'] == ""? null: double.parse(json['weight']);
      } else {
        weight = json['weight'].toDouble();
      }
    }
    if(json['breakingStrength'] != null){
      if (json['breakingStrength'] is String) {
        json['breakingStrength'] == ""? null: double.parse(json['breakingStrength']);
      } else {
        breakingStrength = json['breakingStrength'].toDouble();
      }
    }

    return Webbing(
      name: json['name'] == "" ? null : json['name'] ,
      brand: json['brand'] == "" ? null : json['brand'],
      stretch: json['stretch'] == null ? null : Stretch.fromJson(json['stretch']),
      materialType : json['materialType'] == "" ? null : json['materialType'],
      weight: weight,
      breakingStrength : breakingStrength
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