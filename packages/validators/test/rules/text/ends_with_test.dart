import 'package:flutter_test/flutter_test.dart';
import 'package:queen_validators/queen_validators.dart';

void main() {
  group(
    'EndsWith rule',
    () {
      test('trims the string before checking', () {
        expect(EndsWith('n').isValid('    queen    '), isTrue);
      });

      test('returns true when text starts with pattern', () {
        expect(EndsWith('en').isValid('queen'), isTrue);
      });

      test('returns false when text does not starts with pattern', () {
        expect(EndsWith('king').isValid('queen'), isFalse);
      });
    },
  );
}
