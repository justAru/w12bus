class Passenger {
  String name;
  PlaceType placeType;
  String placeNumber;
  BuyType buyType;

  Passenger({
    this.name,
    this.placeNumber,
    this.placeType,
    this.buyType,
  });
}

enum BuyType {
  offline,
  online,
  noType,
}

enum PlaceType {
  up,
  down,
}
