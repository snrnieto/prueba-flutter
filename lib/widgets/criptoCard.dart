import 'package:crypto_app/models/CoinModel.dart';
import 'package:crypto_app/screens/coinDetail.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CriptoCard extends StatefulWidget {
  CriptoCard({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
    required this.currentCoin,
  });

  String name;
  String symbol;
  String imageUrl;
  double price;
  double change;
  double changePercentage;
  Coin currentCoin;

  @override
  _CriptoCardState createState() => _CriptoCardState();
}

class _CriptoCardState extends State<CriptoCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CoinDetail(
                  currentCoin: widget.currentCoin,
                )));
      },
      child: Container(
        height: 100,
        color: Color(0xFF222035),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  height: 50,
                  width: 50,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.network(widget.imageUrl),
                  )),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      widget.symbol,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.price.toDouble().toString(),
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.change.toDouble() < 0
                        ? widget.change.toDouble().toString()
                        : '+' + widget.change.toDouble().toString(),
                    style: TextStyle(
                      color: widget.change.toDouble() < 0
                          ? Colors.red
                          : Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.changePercentage.toDouble() < 0
                        ? widget.changePercentage.toDouble().toString() + '%'
                        : '+' +
                            widget.changePercentage.toDouble().toString() +
                            '%',
                    style: TextStyle(
                      color: widget.changePercentage.toDouble() < 0
                          ? Colors.red
                          : Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
