import 'package:flutter/material.dart';
import 'constants.dart';

class FaceDownCard extends StatelessWidget {
  const FaceDownCard({this.width, this.height});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: width * 0.2 - 20,
      height: width * 0.3 - 20,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Center(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [kPinkGradient, kBlueGradient]
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

Map<String, List> suitInfo = {
  'Clubs': ['images/clubs.png', Colors.black],
  'Spades': ['images/spades.png', Colors.black],
  'Hearts': ['images/hearts.png', Colors.red],
  'Diamonds': ['images/diamonds.png', Colors.red]
};

Map<String, String> ranks = {
  'Ace': 'A', 'Two': '2', 'Three': '3', 'Four': '4', 'Five': '5', 'Six': '6', 'Seven': '7',
  'Eight': '8', 'Nine': '9', 'Ten': '10', 'King': 'K', 'Queen': 'Q', 'Jack': 'J'
};

class FaceUpCard extends StatelessWidget {
  const FaceUpCard({this.width, this.height, this.suit, this.rank});
  final double width;
  final double height;
  final String suit;
  final String rank;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: width * 0.2 - 20,
      height: width * 0.3 - 20,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        children: [
          Text(
            '${ranks[rank]}   ',
            style: TextStyle(
                fontSize: width * 0.08,
                fontWeight: FontWeight.bold,
                color: suitInfo[suit][1]
            ),
          ),
          Image.asset('${suitInfo[suit][0]}')
        ],
      ),
    );
  }
}

Widget chip(double width, int value) {
  Color chipColor(int chipValue) {
    if (chipValue < 50) {
      return kChipYellow;
    } else if (chipValue < 100) {
      return kChipAmber;
    } else if (chipValue < 500) {
      return kChipOrange;
    } else {
      return kChipDeepOrange;
    }
  }
  return Container(
    width: width * 0.15,
    height: width * 0.15,
    decoration: BoxDecoration(
      color: Colors.black,
      shape: BoxShape.circle,
    ),
    child: Center(
      child: Container(
        width: width* 0.13,
        height:width * 0.13,
        decoration: BoxDecoration(
          color: chipColor(value),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: width* 0.1,
            height:width * 0.1,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                width: width * 0.08,
                height: width * 0.08,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                ),
                child: Center(
                  child: Text(
                    '$value',
                    style: TextStyle(
                        fontSize: width * 0.033,
                        fontWeight: FontWeight.w900
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget playerButton(double width, Icon displayIcon, Color color) {
  return Container(
    width: width * 0.2,
    height: width * 0.2,
    child: Center(
      child: Container(
        width: width * 0.17,
        height: width * 0.17,
        child: Center(
          child: displayIcon,
        ),
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
        ),
      ),
    ),
    decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle
    ),
  );
}
