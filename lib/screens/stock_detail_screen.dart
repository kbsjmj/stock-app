// lib/screens/stock_detail_screen.dart
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../data/dummy_stocks.dart';
import '../models/stock.dart';
import '../utils/market_colors.dart';

class StockDetailScreen extends StatelessWidget {
  final Stock stock;
  const StockDetailScreen({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    final color = changeColor(stock.changePct);
    final closes = dummyCloses(stock);
    final spots = [
      for (var i = 0; i < closes.length; i++) FlSpot(i.toDouble(), closes[i]),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(stock.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(stock.priceText, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          Text(stock.changeText, style: TextStyle(fontSize: 16, color: color)),
          const SizedBox(height: 16),
          const Text('일봉 (최근 60일, 예시)', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          SizedBox(
            height: 260,
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: false,
                    color: color == Colors.grey ? Colors.blueGrey : color,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('지표 영역 (이동평균, RSI, MACD는 3단계에서 표시됩니다)'),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '표시된 값은 예시 데이터입니다. 투자 판단의 책임은 본인에게 있습니다.',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
