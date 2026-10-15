// lib/utils/market_colors.dart
import 'package:flutter/material.dart';

// 국내 증시 관례: 상승 빨강, 하락 파랑
Color changeColor(double pct) {
  if (pct > 0) return Colors.red;
  if (pct < 0) return Colors.blue;
  return Colors.grey;
}
