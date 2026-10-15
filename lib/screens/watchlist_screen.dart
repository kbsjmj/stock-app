// lib/screens/watchlist_screen.dart
import 'package:flutter/material.dart';

import '../data/dummy_stocks.dart';
import '../models/stock.dart';
import '../utils/market_colors.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('관심종목')),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: dummyStocks.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) => _StockTile(stock: dummyStocks[index]),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              '표시된 값은 예시 데이터입니다. 실제 시세는 15분 지연 또는 일봉 기준이 됩니다.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _StockTile extends StatelessWidget {
  final Stock stock;
  const _StockTile({required this.stock});

  @override
  Widget build(BuildContext context) {
    final color = changeColor(stock.changePct);
    return ListTile(
      title: Text(stock.name),
      subtitle: Text('${stock.symbol} · ${stock.isKr ? '국내' : '미국'}'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(stock.priceText, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(stock.changeText, style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
