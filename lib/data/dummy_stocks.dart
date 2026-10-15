// lib/data/dummy_stocks.dart
// 1단계용 더미 데이터. 3단계에서 서버 API 호출로 교체한다.
import 'dart:math' as math;

import '../models/stock.dart';

const List<Stock> dummyStocks = [
  Stock(symbol: '005930', name: '삼성전자', market: 'KR', price: 71200, changePct: 1.28),
  Stock(symbol: '000660', name: 'SK하이닉스', market: 'KR', price: 182500, changePct: -0.82),
  Stock(symbol: '035420', name: 'NAVER', market: 'KR', price: 214000, changePct: 0.0),
  Stock(symbol: 'AAPL', name: 'Apple', market: 'US', price: 228.35, changePct: 0.54),
  Stock(symbol: 'NVDA', name: 'NVIDIA', market: 'US', price: 131.8, changePct: -1.47),
  Stock(symbol: 'MSFT', name: 'Microsoft', market: 'US', price: 421.2, changePct: 0.19),
];

// 상세 화면 차트용 가짜 종가 흐름 (종목마다 모양이 다르게 나온다)
List<double> dummyCloses(Stock s, {int days = 60}) {
  final seed = s.symbol.codeUnits.fold<int>(0, (a, b) => a + b);
  return List.generate(days, (i) {
    final wave = math.sin((i + seed) / 6) * 0.04 + math.sin((i + seed) / 2.5) * 0.015;
    final trend = (i / (days - 1) - 1) * 0.05; // 끝으로 갈수록 현재가에 가까워짐
    return s.price * (1 + wave + trend);
  });
}
