class GeckoCoin{
  String? id;
  String? symbol;
  String? name;
  String? image;
  String? description;
  String? currentPriceInr;

  GeckoCoin(
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.description,
    this.currentPriceInr,
  );

  GeckoCoin.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toString();
    symbol = json["symbol"]?.toString();
    name = json["name"]?.toString();
    image = json["image"]["large"]?.toString();
    description = json["description"]["en"]?.toString();
    currentPriceInr = json["market_data"]["current_price"]["inr"]?.toString();
  }

  toString(){
    return "Coin With id: "+id!;
  }
}
