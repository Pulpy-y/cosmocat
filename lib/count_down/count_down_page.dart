import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:cosmocat/components/background.dart';
import 'package:cosmocat/database.dart';
import 'package:cosmocat/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'countdown_helper.dart';
import '../constant.dart';
import '../size_config.dart';

class CountDown extends StatefulWidget {
  final int hour, minute;
  final String tag;

  const CountDown({
    required this.hour,
    required this.minute,
    required this.tag,
  });

  @override
  _CountDownState createState() => _CountDownState(hour, minute, tag);
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
  String? _tag = '';
  var helper = CountdownHelper();

  //DateTime date = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  _CountDownState(int hour, int minute, String tag) {
    _counter = hour * 3600 + minute * 60;
    _set = _counter;
    _timeFormatted = helper.timeString(_counter);
    _tag = tag;
  }

  void _startTimer() {
    _begin = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
          _actual++;
          _timeFormatted = helper.timeString(_counter);
        } else {
          _timer.cancel();
          showDialog(context: context, builder: (_) => _taskCompletedDialog());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.grey,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Count Down'),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Background(
            child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight! * 0.2),
            Container(
              height: SizeConfig.screenHeight! * 0.3,
              child: _timerWidget(),
            ),
            Bounce(
              infinite: true,
              child: Container(
                  height: SizeConfig.screenHeight! * 0.3,
                  width: SizeConfig.screenWidth! * 0.6,
                  child: Image.asset('assets/image/coma_floating_trans.png')),
            ),
            Container(
              height: SizeConfig.screenHeight! * 0.1,
              child: _progressBar(),
            ),
          ],
        )));
  }

  Widget _timerWidget() {
    return Column(
      children: <Widget>[
        Text(
          '$_timeFormatted',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 50, color: Colors.white),
        ),
        SizedBox(
          height: SizeConfig.defaultSize,
        ),
        _begin
            ? _startedButtons()
            : CountDownButtons(
                text: 'Begin Journey!', press: () => _startTimer())
      ],
    );
  }

  Widget _startedButtons() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _isPaused
              ? CountDownButtons(
                  text: 'Resume',
                  press: () {
                    setState(() {
                      _startTimer();
                      _isPaused = false;
                    });
                  })
              : CountDownButtons(
                  text: 'Pause',
                  press: () {
                    setState(() {
                      _timer.cancel();
                      _isPaused = true;
                    });
                  }),
          CountDownButtons(
            text: 'Stop',
            press: () {
              _timer.cancel();
              _stars = helper.countStars(_actual);
              showDialog(context: context, builder: (_) => _stopTaskDialog());
            },
          )
        ]);
  }

  Widget _stopTaskDialog() {
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
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context, builder: (_) => _taskCompletedDialog());
                },
                child: Text("Yes"),
              ),
            ],
          )
        ]);
  }

  Widget _taskCompletedDialog() {
    _stars = helper.countStars(_actual);
    return AlertDialog(
      title: const Text("YAY!"),
      content: Container(
        child: Text('You have helped Coma get $_stars stars!'),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            DatabaseService().saveFocusTime(_tag!, _actual, date);
            DatabaseService().updateStars(_stars);
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomePage()));
          },
          child: Text("Return to Home"),
        ),
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
          primary: themeSecondaryColor,
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(SizeConfig.defaultSize! * 3.6), //36
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
