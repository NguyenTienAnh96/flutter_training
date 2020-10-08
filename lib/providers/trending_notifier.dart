import 'package:flutter/material.dart';
import 'package:flutter_training/providers/base_notifier.dart';
import 'package:flutter_training/model/trending.dart';
import 'package:provider/provider.dart';

class TrendingNotifier extends BaseNotifier<Trending> {
  TrendingNotifier(Trending value) : super(value);

  @override
  ListenableProvider<Listenable> provider() {
    return ChangeNotifierProvider<TrendingNotifier>(create: (context) => this);
  }
}
