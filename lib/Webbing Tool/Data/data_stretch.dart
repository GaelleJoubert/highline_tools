class Stretch {
  /// The Stretch is a list of Strech Values

  List<StretchValue> curveStrech ;

  Stretch(this.curveStrech);

  factory Stretch.fromJson(List<dynamic> json) {
    List<StretchValue> curveStrech= [];
    for (var data in json) {
      curveStrech.add(StretchValue.fromJson(data));
    }
    return Stretch( curveStrech);
  }

  @override
  String toString() {
    String listOfStrechValue = "Stretch : ";
    curveStrech.forEach((value)=> listOfStrechValue += "$value, " );
    return listOfStrechValue ;
  }
}

class StretchValue {
  /// A Strech Value is a combination of a percentage of stretch, at a given pull force (in KN)
  double? pullForce ; /// in Kilo Newton
  double? stretchPercent ;

  StretchValue({required this.pullForce, required this.stretchPercent});

  factory StretchValue.fromJson(Map<String, dynamic> json) {
    return StretchValue(
      pullForce: json['kn'] == "" ? null : json['kn'] is String ? double.parse(json['kn']) : json['kn'].toDouble(),
      stretchPercent: json['percent'] == "" ? null : json['percent'] is String ? double.parse(json['percent']) : json['percent'].toDouble(),
    );
  }

  @override
  String toString() {
    return "$stretchPercent % at $pullForce kN";
  }

}