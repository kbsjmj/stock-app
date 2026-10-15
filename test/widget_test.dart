// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:stock_app/data/dummy_stocks.dart';
import 'package:stock_app/screens/stock_detail_screen.dart';
import 'package:stock_app/screens/watchlist_screen.dart';

void main() {
  // main.dart의 임시 스위치(kShowDetail)와 무관하게 각 화면을 직접 검사한다.
  testWidgets('관심종목 화면이 표시된다', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: WatchlistScreen()));

    expect(find.text('관심종목'), findsOneWidget);
    expect(find.text('삼성전자'), findsOneWidget);
  });

  testWidgets('종목 상세 화면이 표시된다', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(home: StockDetailScreen(stock: dummyStocks.first)),
    );

    expect(find.text('삼성전자'), findsOneWidget);
    expect(find.text('71,200원'), findsOneWidget);
  });
}
