import 'package:flutter/material.dart';
import 'package:w12bus/models/passenger.dart';

Widget listElement(Passenger passenger, onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Container(
            width: 130,
            child: Text(
              passenger.name,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                passenger.placeNumber,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
              passenger.placeType == PlaceType.up
                  ? Text('верхний')
                  : Text('нижний'),
            ],
          ),
          ButtonTheme(
            minWidth: 130,
            child: RaisedButton(
              child: passenger.buyType == BuyType.online
                  ? Text(
                      'ONLINE',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  : passenger.buyType == BuyType.offline
                      ? Text(
                          'OFFLINE',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          'no type',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
              onPressed: () {},
              color: passenger.buyType == BuyType.online
                  ? Colors.green
                  : passenger.buyType == BuyType.offline
                      ? Colors.grey
                      : Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
