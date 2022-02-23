import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_flutter_code/pages/home_page.dart';

void main() {
  group('Home page', () {
    Finder checkBtn() => find.text('Check');
    Finder nextBtn() => find.text('Next');
    Finder priceInput() => find.byKey(const Key('priceInput'));

    testWidgets('Change product name after each click',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      expect(find.text(products[0].name), findsOneWidget);

      for (var i = 1; i < 5; i++) {
        await tester.tap(checkBtn());
        await tester.enterText(priceInput(), '0');
        await tester.pump();
        await tester.tap(nextBtn());
        await tester.pump();
        expect(find.text(products[i].name), findsOneWidget);
      }

      await tester.tap(checkBtn());
      await tester.pump();
      await tester.tap(nextBtn());
      await tester.pump();
      expect(find.text(products[4].name), findsOneWidget);
    });

    testWidgets('Show reuslt & next product', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      expect(
        nextBtn(),
        findsNothing,
      );
      expect(find.byKey(const Key('result')), findsNothing);

      await tester.enterText(priceInput(), '3');
      await tester.tap(checkBtn());
      await tester.pump();
      expect(nextBtn(), findsOneWidget);
      expect(find.byKey(const Key('result')), findsOneWidget);
      expect(find.text('pass'), findsOneWidget);
      await tester.tap(nextBtn());
      await tester.pump();

      expect(nextBtn(), findsNothing);
      expect(find.byKey(const Key('result')), findsNothing);
      await tester.enterText(priceInput(), '4');
      await tester.tap(checkBtn());
      await tester.pump();

      expect(nextBtn(), findsOneWidget);
      expect(find.byKey(const Key('result')), findsOneWidget);
      expect(find.text('fail'), findsOneWidget);
      await tester.enterText(priceInput(), '5');
      await tester.tap(checkBtn());
      await tester.pump();
      expect(find.text('pass'), findsOneWidget);
    });
  });
}
