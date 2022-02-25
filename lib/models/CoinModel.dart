class Coin {
  Coin({
    required this.id,
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
    required this.marketCap,
    required this.high_24h,
    required this.low_24h,
    required this.ath,
  });

  String id;
  String name;
  String symbol;
  String imageUrl;
  num price;
  num change;
  num changePercentage;
  num marketCap;
  num high_24h;
  num low_24h;
  num ath;

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
        id: json['id'],
        name: json['name'],
        symbol: json['symbol'],
        imageUrl: json['image'],
        price: json['current_price'],
        change: json['price_change_24h'],
        changePercentage: json['price_change_percentage_24h'],
        marketCap: json['market_cap'],
        high_24h: json['high_24h'],
        low_24h: json['low_24h'],
        ath: json['ath']);
  }
}

List<Coin> coinList = [];
