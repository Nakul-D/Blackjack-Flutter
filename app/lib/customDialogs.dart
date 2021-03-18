import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:app/bloc/adState.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'customWidgets.dart';
import 'bloc/gameEvents.dart';
import 'bloc/gameController.dart';
import 'screens/rulesScreen.dart';
import 'screens/aboutScreen.dart';

class BetDialog extends StatefulWidget {
  final double width;
  final double height;
  final int bank;
  final GameControllerBloc dataBloc;
  BetDialog({Key key, this.width, this.height, this.bank, this.dataBloc}) : super(key: key);

  @override
  _BetDialogState createState() => _BetDialogState();
}

class _BetDialogState extends State<BetDialog> {
  int bet = 0;
  void increaseBet(int value) {
    if (bet + value <= widget.bank) {
      setState(() {
        bet += value;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.8,
      height: widget.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Place your bet',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: widget.width * 0.06
            ),
          ),
          Container(
            child: chip(widget.width, bet),
          ),
          Container(
            width: widget.width * 0.75,
            height: widget.width * 0.25,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30)
            ),
            child: Center(
              child: Container(
                width: widget.width * 0.72,
                height: widget.width * 0.22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: chip(widget.width, 10),
                      onTap: () => increaseBet(10),
                    ),
                    InkWell(
                      child: chip(widget.width, 50),
                      onTap: () => increaseBet(50),
                    ),
                    InkWell(
                        child: chip(widget.width, 100),
                        onTap: () => increaseBet(100)
                    ),
                    InkWell(
                      child: chip(widget.width, 500),
                      onTap: () => increaseBet(500),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(23)
                ),
              ),
            ),
          ),
          MaterialButton(
            child: Container(
              width: widget.width * 0.2,
              height: widget.width * 0.1,
              child: Center(
                child: Text(
                  'Done',
                  style: TextStyle(
                      fontSize: widget.width * 0.045,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(100)
              ),
            ),
            onPressed: () {
              final BetEvent _event = BetEvent();
              _event.bet = bet;
              widget.dataBloc.add(_event);
            },
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}

class StartDialog extends StatelessWidget {

  final double width;
  final double height;
  final GameControllerBloc dataBloc;

  StartDialog({Key key, this.width, this.height, this.dataBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.8,
      height: width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MaterialButton(
            child: Container(
              width: width * 0.4,
              height: width * 0.13,
              child: Center(
                child: Text(
                  'Play',
                  style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.lightGreen[500],
                  borderRadius: BorderRadius.circular(100)
              ),
            ),
            onPressed: () {
              GameEvents _event = PlayEvent();
              dataBloc.add(_event);
            },
          ),
          MaterialButton(
            child: Container(
              width: width * 0.4,
              height: width * 0.13,
              child: Center(
                child: Text(
                  'Rules',
                  style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.amber[600],
                  borderRadius: BorderRadius.circular(100)
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => RulesScreen()
              ));
            },
          ),
          MaterialButton(
            child: Container(
              width: width * 0.4,
              height: width * 0.13,
              child: Center(
                child: Text(
                  'About',
                  style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(100)
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => AboutScreen()
              ));
            },
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}

class PlayerTurnDialog extends StatelessWidget {

  final double width;
  final double height;
  final GameControllerBloc dataBloc;

  PlayerTurnDialog({Key key, this.width, this.height, this.dataBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.8,
      height: width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Your turn',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: width * 0.08
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: width * 0.025),
              Column(
                children: [
                  InkWell(
                    child: playerButton(width, Icon(Icons.add, size: width * 0.1), kHitButtonYellow),
                    onTap: () {
                      GameEvents _event = HitEvent();
                      dataBloc.add(_event);
                    },
                  ),
                  SizedBox(height: width * 0.05),
                  Text(
                    'Hit',
                    style: TextStyle(
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(width: width * 0.02),
              Column(
                children: [
                  InkWell(
                    child: playerButton(width, Icon(Icons.stop, size: width * 0.1), kStayButtonGreen),
                    onTap: () {
                      GameEvents _event = StayEvent();
                      dataBloc.add(_event);
                    },
                  ),
                  SizedBox(height: width * 0.05),
                  Text(
                    'Stay',
                    style: TextStyle(
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    child: playerButton(width, Icon(Icons.flag, size: width * 0.1), Colors.white),
                    onTap: () {
                      GameEvents _event = SurrenderEvent();
                      dataBloc.add(_event);
                    },
                  ),
                  SizedBox(height: width * 0.05),
                  Text(
                    'Surrender',
                    style: TextStyle(
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}

class ResultDialog extends StatefulWidget {

  final double width;
  final double height;
  final String result;
  final int playerReturn;
  final GameControllerBloc dataBloc;
  final AdState adState;

  ResultDialog({Key key, this.width, this.height, this.result, this.playerReturn,this.dataBloc, this.adState}) : super(key: key);

  @override
  _ResultDialogState createState() => _ResultDialogState();
}

class _ResultDialogState extends State<ResultDialog> {

  RewardedAd rewardedAd;
  String adButtonText = 'Watch Ad';
  bool showAd = false;
  bool rewardEarned = false;

  void adClosed() {
    if (rewardEarned) {
      GameEvents _event = AdWatchedEvent();
      widget.dataBloc.add(_event);
    } else {
      // do nothing
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.adState.initialization.then((status) {
      setState(() {
        rewardedAd = RewardedAd(
          adUnitId: widget.adState.rewardAdUnitId,
          request: AdRequest(),
          listener: AdListener(
              onAdLoaded: (ad) {
                print("Ad loaded: ${ad.adUnitId}.");
                if (showAd) {
                  rewardedAd.show();
                }
              },
              onAdClosed: (ad) {
                print("Ad closed: ${ad.adUnitId}.");
                adClosed();
              },
              onAdFailedToLoad: (ad, error) => print("Ad failed to load: ${ad.adUnitId}, $error."),
              onAdOpened: (ad) => print("Ad opened: ${ad.adUnitId}."),
              onAppEvent: (ad, name, data) => print("Ad loaded: ${ad.adUnitId}, $name, $data."),
              onApplicationExit: (ad) => print("App exit: ${ad.adUnitId}."),
              onNativeAdClicked: (nativeAd) => print("Native ad clicked: ${nativeAd.adUnitId}."),
              onNativeAdImpression: (nativeAd) => print("Native ad impression: ${nativeAd.adUnitId}."),
              onRewardedAdUserEarnedReward: (ad, reward) {
                print("UserRewarded: ${ad.adUnitId}, ${reward.amount}, ${reward.type}.");
                rewardEarned = true;
              }
          ),
        )..load();
      });
    });
  }

  String displayText() {
    if (widget.result == kDealerBust || widget.result == kPlayerWon) {
      return 'You win';
    } else if (widget.result == kPlayerBust || widget.result == kDealerWon) {
      return 'You lost';
    } else if (widget.result == kTie) {
      return 'Tie';
    } else {
      return 'Surrender';
    }
  }

  Widget displayPlayerReturn() {
    if (widget.playerReturn.isNegative) {
      return Text(
        '${widget.playerReturn}',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: widget.width * 0.06,
            color: kRed
        ),
      );
    } else {
      return Text(
        '+${widget.playerReturn}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: widget.width * 0.06,
          color: kStayButtonGreen
        ),
      );
    }
  }

  Widget adStatement() {
    if (widget.playerReturn.isNegative) {
      return Text(
        'Recover your bet',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: widget.width * 0.06,
            color: Colors.black
        ),
      );
    } else {
      return Text(
        'Double your profit',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: widget.width * 0.06,
            color: Colors.black
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.playerReturn);
    return Container(
      width: widget.width * 0.8,
      height: widget.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${displayText()}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: widget.width * 0.06
            ),
          ),
          displayPlayerReturn(),
          adStatement(),
          MaterialButton(
              child: Container(
                width: widget.width * 0.4,
                height: widget.width * 0.13,
                child: Center(
                  child: Text(
                    '$adButtonText',
                    style: TextStyle(
                        fontSize: widget.width * 0.045,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: kHitButtonYellow,
                    borderRadius: BorderRadius.circular(100)
                ),
              ),
              onPressed: () {
                showAd = true;
                setState(() {
                  adButtonText = "Loading";
                });
                rewardedAd.show();
              }
          ),
          MaterialButton(
              child: Container(
                width: widget.width * 0.4,
                height: widget.width * 0.13,
                child: Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        fontSize: widget.width * 0.045,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: kDoneBlueButton,
                    borderRadius: BorderRadius.circular(100)
                ),
              ),
              onPressed: () {
                GameEvents _event = ContinueEvent();
                widget.dataBloc.add(_event);
              }
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}