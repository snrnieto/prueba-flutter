import 'package:crypto_app/models/CoinModel.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CoinDetail extends StatefulWidget {
  CoinDetail({
    required this.currentCoin,
  });
  Coin currentCoin;

  @override
  _CoinDetailState createState() => _CoinDetailState();
}

class _CoinDetailState extends State<CoinDetail> {
  @override
  void initState() {
    //ttps://api.coingecko.com/api/v3/coins/Bitcoin
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222035),
      appBar: AppBar(
        title: Text(widget.currentCoin.name),
        backgroundColor: Color(0xFF151421),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                            height: 70,
                            width: 70,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.network(widget.currentCoin.imageUrl),
                            )),
                      ),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.currentCoin.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${widget.currentCoin.price.toString()}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(
                                      widget.currentCoin.change.toDouble() < 0
                                          ? widget.currentCoin.change
                                              .toDouble()
                                              .toString()
                                          : '+' +
                                              widget.currentCoin.change
                                                  .toDouble()
                                                  .toString(),
                                      style: TextStyle(
                                        color: widget.currentCoin.change
                                                    .toDouble() <
                                                0
                                            ? Colors.red
                                            : Colors.green,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      widget.currentCoin.changePercentage
                                                  .toDouble() <
                                              0
                                          ? widget.currentCoin.changePercentage
                                                  .toDouble()
                                                  .toString() +
                                              '%'
                                          : '+' +
                                              widget
                                                  .currentCoin.changePercentage
                                                  .toDouble()
                                                  .toString() +
                                              '%',
                                      style: TextStyle(
                                        color: widget.currentCoin
                                                    .changePercentage
                                                    .toDouble() <
                                                0
                                            ? Colors.red
                                            : Colors.green,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ]),
                            ]),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    margin: EdgeInsets.all(20),
                    color: Color(0xFF282838),
                    child: Column(
                      children: [
                        Info(
                          title: "Symbol",
                          info: widget.currentCoin.symbol,
                        ),
                        Info(
                          title: "Market Cap",
                          info: widget.currentCoin.marketCap.toString(),
                        ),
                        Info(
                          title: "High in 24h",
                          info: widget.currentCoin.high_24h.toString(),
                        ),
                        Info(
                          title: "Low in 24h",
                          info: widget.currentCoin.low_24h.toString(),
                        ),
                        Info(
                          title: "Ath",
                          info: widget.currentCoin.ath.toString(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    required this.info,
    required this.title,
  });

  final String info;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                info,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
