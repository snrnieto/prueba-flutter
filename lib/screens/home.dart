import 'dart:convert';

import 'package:crypto_app/models/CoinModel.dart';
import 'package:crypto_app/widgets/SearchWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:crypto_app/Widgets/criptoCard.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String query = '';
  List<Coin> filteredCoins = [];

  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));
    if (response.statusCode == 200) {
      // print(response.body);
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          filteredCoins = coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  @override
  void initState() {
    fetchCoin();
    Timer.periodic(Duration(seconds: 10), (timer) => fetchCoin());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222035),
      appBar: AppBar(
        title: Text("Criptomonedas"),
        backgroundColor: Color(0xFF151421),
        centerTitle: true,
        leading: Text(""),
      ),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: buildSearch(),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Ordenar",
                  style: TextStyle(
                    color: Color(0XFF1dc9aa),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: filteredCoins.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CriptoCard(
                        name: filteredCoins[index].name,
                        symbol: filteredCoins[index].symbol,
                        imageUrl: filteredCoins[index].imageUrl,
                        price: filteredCoins[index].price.toDouble(),
                        change: filteredCoins[index].change.toDouble(),
                        changePercentage:
                            filteredCoins[index].changePercentage.toDouble(),
                        currentCoin: filteredCoins[index],
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      )
                    ],
                  );
                }),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildSearch() => SearchWidget(
      text: query, hintText: "Busca por nombre", onChanged: searchCoin);

  void searchCoin(String query) {
    final coins = coinList.where((element) {
      final name = element.name.toLowerCase();
      final lowerQuery = query.toLowerCase();

      return name.contains(lowerQuery);
    }).toList();

    setState(() {
      this.filteredCoins = coins;
      this.query = query;
    });
  }
}
