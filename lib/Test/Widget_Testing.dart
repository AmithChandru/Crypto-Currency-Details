import 'package:drt/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Currency name", (WidgetTester tester) async {
    //Finding the widgets required
    final checkText = find.byKey(ValueKey('checkCurrency'));
    final checkValues = find.byKey(ValueKey('searchCurrency'));

    //Executing the test
    await tester.pumpWidget(const MyApp());
    await tester.enterText(checkText, 'btcusd');
    await tester.tap(checkValues);
    await tester.pump();

    //Checking the outputs
    expect(find.text('btcusd'), findsOneWidget);
  });
}