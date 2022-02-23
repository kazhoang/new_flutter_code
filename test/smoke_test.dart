import 'package:flutter_test/flutter_test.dart';

import 'package:new_flutter_code/main.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
  });
}
