class GeckoCoin{
  String? id;
  String? symbol;
  String? name;
  String? image;
  String? description;

  GeckoCoin(
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.description,
  );

  GeckoCoin.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toString();
    symbol = json["symbol"]?.toString();
    name = json["name"]?.toString();
    image = json["image"]["thumb"]?.toString();
    description = json["description"]["en"]?.toString();
  }
}
