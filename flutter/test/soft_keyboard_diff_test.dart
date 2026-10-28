import 'package:flutter_hbb/mobile/soft_keyboard_diff.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final padding = '1' * 1024;

  test('typing with the caret inside the padding sends the typed character',
      () {
    final old = '${padding}ab';
    final typed = '${'1' * 500}x${'1' * 524}ab';
    expect(softKeyboardDiff(old, typed), (0, 'x'));
  });

  test('typing inside paired punctuation sends the typed character', () {
    expect(softKeyboardDiff('$padding()', '$padding(a)'), (0, 'a'));
  });

  test('text replaced by the IME deletes the changed part and resends it', () {
    expect(softKeyboardDiff('${padding}teh', '${padding}the '), (2, 'he '));
  });
}
