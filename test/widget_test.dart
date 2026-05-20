import 'package:flutter_test/flutter_test.dart';
import 'package:imznews/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('App should load splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    expect(find.text('IMZ NEWS'), findsOneWidget);
  });
}
