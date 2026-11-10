import 'package:flutter_test/flutter_test.dart';
import 'package:rpl_keamanan/utils/validators.dart'; // Sesuaikan nama project

void main() {
  group('Validators Test', () {
    test('isValidEmail harus validasi format email', () {
      expect(Validators.isValidEmail('test@example.com'), true);
      expect(Validators.isValidEmail('salah'), false);
    });

    test('sanitize harus membersihkan tag HTML', () {
      expect(Validators.sanitize('<script>'), '&lt;script&gt;');
    });
  });
}