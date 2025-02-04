import 'package:flutter_test/flutter_test.dart';
import 'package:highline_tools/Webbing%20Tool/Data/data_stretch.dart';
import 'package:highline_tools/Webbing%20Tool/Data/data_webbing.dart';

void main() {
  group('Webbing', () {
    test('fromJson should return a valid Webbing object, even with null fields', () {
      final json = {
        'name': 'Test Webbing',
        'brand': '',
        'stretch': [
          {'kn': 5.0, 'percent': 10.0},
          {'kn': 10.0, 'percent': 20.0}
        ],
        'materialType': '',
        'weight': "",
        'breakingStrength': 5
      };

      final webbing = Webbing.fromJson(json);

      expect(webbing.name, 'Test Webbing');
      expect(webbing.brand, null);
      expect(webbing.stretch!.curveStrech.length, 2);
      expect(webbing.stretch!.curveStrech[0].pullForce, 5.0);
      expect(webbing.stretch!.curveStrech[0].stretchPercent, 10.0);
      expect(webbing.stretch!.curveStrech[1].pullForce, 10.0);
      expect(webbing.stretch!.curveStrech[1].stretchPercent, 20.0);
      expect(webbing.materialType, null);
      expect(webbing.weight, null);
      expect(webbing.breakingStrength, 5);
    });

    test('fromJson should handle rounded numbers for double fields, string should handle spaces and special characters', () {
      final json = {
        'name': 'Test Webbing',
        'brand': 'Best Brand ',
        'stretch': [
          {'kn': 5.0, 'percent': 10.0},
          {'kn': 10.0, 'percent': 20.0}
        ],
        'materialType': 'rope ? ',
        'weight': 5,
        'breakingStrength': 10.52
      };

      final webbing = Webbing.fromJson(json);

      expect(webbing.name, 'Test Webbing');
      expect(webbing.brand, 'Best Brand ');
      expect(webbing.stretch!.curveStrech.length, 2);
      expect(webbing.stretch!.curveStrech[0].pullForce, 5.0);
      expect(webbing.stretch!.curveStrech[0].stretchPercent, 10.0);
      expect(webbing.stretch!.curveStrech[1].pullForce, 10.0);
      expect(webbing.stretch!.curveStrech[1].stretchPercent, 20.0);
      expect(webbing.materialType, 'rope ? ');
      expect(webbing.weight, 5.0);
      expect(webbing.breakingStrength, 10.52);
    });

    test('Should be ok if fields are missing', () {
      final json = {
        'name': 'Test Webbing',
      };

      final webbing = Webbing.fromJson(json);

      expect(webbing.name, 'Test Webbing');
      expect(webbing.brand, null);
      expect(webbing.stretch, null);
      expect(webbing.materialType, null);
      expect(webbing.weight, null);
      expect(webbing.breakingStrength, null);
    });

    test('toString should return a valid string representation', () {
      final stretchValues = [
        StretchValue(pullForce: 5.0, stretchPercent: 10.0),
        StretchValue(pullForce: 10.0, stretchPercent: 20.0)
      ];

      final stretch = Stretch(stretchValues);

      final webbing = Webbing(
        name: 'Test Webbing',
        brand: '',
        stretch: stretch,
        materialType: '',
        weight: null,
        breakingStrength: null,
      );

      final expectedString = 'Name : Test Webbing, Brand : , stretch: Stretch : 10.0 % at 5.0 kN, 20.0 % at 10.0 kN, , materialType : , weight : null, breaking strenght: null';
      expect(webbing.toString(), expectedString);
    });
  });
}