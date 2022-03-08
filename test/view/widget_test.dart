import 'package:chef_upp/features/widgets/field/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_screen.dart';

void main() {
  testWidgets('Search Field Test', (WidgetTester tester) async {
    final _searchField = find.byKey(const ValueKey('searchField'));

    await tester.pumpWidget(const MaterialApp(
        home: TestScreen(
      testBody: SearchField(),
    )));

    await tester.enterText(_searchField, 'burger');
    expect(find.text('burger'), findsOneWidget);
  });
}
