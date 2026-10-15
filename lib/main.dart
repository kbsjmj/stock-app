// lib/main.dart
import 'package:flutter/material.dart';

import 'data/dummy_stocks.dart';
import 'screens/stock_detail_screen.dart';
import 'screens/watchlist_screen.dart';

// 임시 스위치: 화면 이동은 2단계에서 만든다.
// 지금은 true로 바꾸고 핫 리스타트(R)하면 상세 화면을 볼 수 있다.
const bool kShowDetail = false;

void main() {
  runApp(const StockApp());
}

class StockApp extends StatelessWidget {
  const StockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '증시추세분석',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: kShowDetail
          ? StockDetailScreen(stock: dummyStocks.first)
          : const WatchlistScreen(),
    );
  }
}
