import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_training/model/trending.dart';
import 'package:flutter_training/providers/base_notifier.dart';
import 'package:flutter_training/providers/base_provider.dart';
import 'package:flutter_training/providers/trending_notifier.dart';
import 'package:http/http.dart' as http;

class HomePageProvider extends BaseProvider {
  TrendingNotifier _trending = TrendingNotifier(Trending());

  HomePageProvider(State<StatefulWidget> state) : super(state);

  @override
  List<BaseNotifier> initNotifiers() => [_trending];

  void getTrending() async {
    String url = 'https://gardenex.herokuapp.com/plant';
    var res = await http.get(url, headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1ZDM4NzNmMTg0Mjc0MDAwMTdkYTg5NmMiLCJpYXQiOjE2MDE5NjU3NzN9.Sk_2u5OveM1i7kMOgrWd-FI003BwLOfsRhKsrQtgk1E'
    });
    if (res.statusCode == 200) {
      _trending.value = Trending.fromJson(json.decode(res.body));
    } else {
      _trending.value = Trending();
    }
  }
}
