import 'package:flutter/material.dart';
import 'package:grocery_shop_app/model/card_model.dart';

// ignore: must_be_immutable
class CardCompnats extends StatelessWidget {
  CardCompnats({required this.cardModel, this.onPressed});

  CardModel cardModel;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
            color: cardModel.colorCard[200],
            borderRadius: BorderRadius.circular(15)),
        // margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(cardModel.pathImage),
              height: 70,
            ),
            Text(
              cardModel.name,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: cardModel.colorCard[900],
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              onPressed: onPressed,
              child: Text(
                '\$' + cardModel.price,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
