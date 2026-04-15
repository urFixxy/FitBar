import 'package:flutter_test/flutter_test.dart';
import 'package:fitserve/main.dart';

void main() {
  testWidgets('FitServe app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FitServeApp());
    expect(find.text('FitServe'), findsOneWidget);
  });
}
