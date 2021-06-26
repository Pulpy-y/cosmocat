import 'dart:async';
import 'package:cosmocat/components/background.dart';
import 'package:cosmocat/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../constant.dart';
import '../size_config.dart';

class CountDown extends StatefulWidget {
  final int hour, minute;

  const CountDown({
    required this.hour,
    required this.minute,
  });


  @override
  _CountDownState createState() => _CountDownState(hour, minute);

}


class _CountDownState extends State<CountDown> {
  int _counter = 0;
  int _set = 0;
  int _actual = 0;
  int _stars = 0;
  late Timer _timer;
  bool _isPaused = false;
  bool _begin = false;
  String _timeFormatted = '';

  _CountDownState(int hour, int minute) {
    _counter = hour * 3600 + minute * 60;
    _set = _counter;
    _timeFormatted = _timeString(_counter);


  }


  void _startTimer(){
    _begin = true;
    _timer = Timer.periodic(Duration(seconds:1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
          _actual++;
          _timeFormatted = _timeString(_counter);
        } else {
          _timer.cancel();
          showDialog(context: context, builder: (_) => _taskCompletedDialog());


        }
      });
    });
  }

  int _countStars(int second) {
    int tMinute = second ~/ 60;

    if (tMinute < 15) {
      return tMinute < 10? 0: 1;
    } else {
      return 4 * tMinute ~/ 30 + 1 * tMinute % 30 ~/ 10;
    }
  }

  String _timeString(int seconds) {
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return "$minutesStr:$secondsStr";
    }

    return "$hoursStr:$minutesStr:$secondsStr";
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.grey,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Count Down'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Background(
          child: Column(
            children: [
              SizedBox(
                height:SizeConfig.screenHeight! * 0.2
              ),
              Container(
                height: SizeConfig.screenHeight! * 0.3,
                child: _timerWidget(),
              ),
              Container(
                height: SizeConfig.screenHeight! * 0.3,
                width: SizeConfig.screenWidth! * 0.6,
                child: Image.asset('assets/image/coma_floating_trans.png')
              ),
              Container(
                height: SizeConfig.screenHeight! * 0.1,
                child: _progressBar(),
              ),
            ],
          )
        )
    );
  }
  
  Widget _timerWidget() {
    return Column(
      children: <Widget>[
        Text(
          '$_timeFormatted',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
            color: Colors.white
          ),
        ),
        SizedBox(
          height: SizeConfig.defaultSize,
        ),

        _begin? _startedButtons():
            CountDownButtons(text: 'Begin Journey!', press: () => _startTimer())
      ],
    );
  }

  Widget _startedButtons() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _isPaused?
          CountDownButtons(text: 'Resume', press: (){setState(() {
            _startTimer();
            _isPaused = false;
          });
          }) : CountDownButtons(text: 'Pause', press: (){
            setState(() {
              _timer.cancel();
              _isPaused = true;
            });
          }),
          CountDownButtons(text: 'Stop', press: () {
            _timer.cancel();
            _stars = _countStars(_actual);
            showDialog(context: context, builder: (_) => _stopTaskDialog());
          },)]);


  }
  Widget _stopTaskDialog () {
    return AlertDialog(
        title: const Text("Quit?"),
        content: Text("Are you sure?"),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _startTimer();
                        _isPaused = false;
                      });
                      Navigator.pop(context); },
                    child: Text("Cancel"),),
              ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      showDialog(context: context, builder: (_) => _taskCompletedDialog());},
                    child: Text("Yes"),),
            ],
          )
        ]);

  }
  Widget _taskCompletedDialog()  {
    _stars = _countStars(_actual);
    return AlertDialog(
            title: const Text("YAY!"),
            content:
              Container(
                  child: Text('You have helped Coma get $_stars stars!'),
                ),
              actions: [
                ElevatedButton(
                      onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomePage()));},
                      child: Text("Return to Home"),),
              ],
    );
  }
  Widget _progressBar() {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: LinearPercentIndicator(
        alignment: MainAxisAlignment.center,
        width: SizeConfig.screenWidth! - 50,
        animation: false,
        lineHeight: 20.0,
        percent: _actual / _set,
        //animationDuration: 500,
        //center: Text("80.0%"),
        linearStrokeCap: LinearStrokeCap.roundAll,
        progressColor: themeSecondaryColor,
        //fillColor: themePrimaryColor,
      ),
    );
  }

}


class CountDownButtons extends StatelessWidget {
  final String text;
  final press;
  const CountDownButtons({
    required this.text,
    required this.press,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary:themeSecondaryColor,
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 3.6), //36
              side: BorderSide(color: Colors.white))),
      onPressed: press,
      child: Text(text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          )),
    );
  }
}



