import 'package:flutter_test/flutter_test.dart';
import 'package:highline_tools/Webbing%20Tool/Data/data_stretch.dart';

void main() {
  group('Stretch', () {
    test('fromJson should return a valid Stretch object', () {
      final json = [
        {'kn': 5.0, 'percent': 10.0},
        {'kn': 10.0, 'percent': 20.0},
        {'kn': "", 'percent': ""},
        {'kn': 5, 'percent': 0},
        {'kn': "", 'percent': 2},
        {'kn': 4.57, 'percent': ""},
      ];

      final stretch = Stretch.fromJson(json);

      expect(stretch.curveStrech.length, 6);
      expect(stretch.curveStrech[0].pullForce, 5.0);
      expect(stretch.curveStrech[0].stretchPercent, 10.0);
      expect(stretch.curveStrech[1].pullForce, 10.0);
      expect(stretch.curveStrech[1].stretchPercent, 20.0);
      expect(stretch.curveStrech[2].pullForce, null);
      expect(stretch.curveStrech[2].stretchPercent, null);
      expect(stretch.curveStrech[3].pullForce, 5);
      expect(stretch.curveStrech[3].stretchPercent, 0);
      expect(stretch.curveStrech[4].pullForce, null);
      expect(stretch.curveStrech[4].stretchPercent, 2);
      expect(stretch.curveStrech[5].pullForce, 4.57);
      expect(stretch.curveStrech[5].stretchPercent, null);


    });

    test('toString should return a valid string representation', () {
      final stretchValues = [
        StretchValue(pullForce: 5.0, stretchPercent: 10.0),
        StretchValue(pullForce: 10.0, stretchPercent: 20.0)
      ];

      final stretch = Stretch(stretchValues);

      final expectedString = 'Stretch : 10.0 % at 5.0 kN, 20.0 % at 10.0 kN, ';
      expect(stretch.toString(), expectedString);
    });
  });
}