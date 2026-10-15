// lib/models/stock.dart
// 종목 한 개를 나타내는 데이터 클래스 (Python의 dataclass와 비슷한 역할)

class Stock {
  final String symbol; // 종목 코드 (예: 005930, AAPL)
  final String name; // 종목명
  final String market; // 'KR' 또는 'US'
  final double price; // 현재가
  final double changePct; // 등락률(%)

  const Stock({
    required this.symbol,
    required this.name,
    required this.market,
    required this.price,
    required this.changePct,
  });

  bool get isKr => market == 'KR';

  // 가격 표시: 국내는 원, 미국은 달러
  String get priceText {
    if (isKr) return '${_withComma(price.toStringAsFixed(0))}원';
    return '\$${_withComma(price.toStringAsFixed(2))}';
  }

  // 등락률 표시: +1.23% / -0.45%
  String get changeText {
    final sign = changePct > 0 ? '+' : '';
    return '$sign${changePct.toStringAsFixed(2)}%';
  }
}

// 정수부에 천 단위 쉼표를 넣는다 (소수부는 그대로)
String _withComma(String s) {
  final parts = s.split('.');
  final intPart = parts[0].replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (m) => ',',
  );
  return parts.length > 1 ? '$intPart.${parts[1]}' : intPart;
}
