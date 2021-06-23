import 'dart:async';
import 'package:cosmocat/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  int _actual = 0;
  int _stars = 0;
  late Timer _timer;
  bool _isPaused = false;
  bool _begin = false;
  String _timeFormatted = '';

  _CountDownState(int hour, int minute) {
    _counter = hour * 3600 + minute * 60;
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
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                '$_timeFormatted',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
              ),
              if (!_begin) ElevatedButton(
                  onPressed: () => _startTimer(),
                  child: Text('Begin Journey!')),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                 _isPaused?
                    ElevatedButton(
                        child: Text('Resume'),
                          onPressed: (){
                          setState(() {
                            _startTimer();
                            _isPaused = false;
                          });
                          })
                    : ElevatedButton(child: Text('Pause'),
                     onPressed: (){
                      setState(() {
                        _timer.cancel();
                        _isPaused = true;
                      });
                     }),
                ElevatedButton(
                    onPressed:() {
                      _timer.cancel();
                      _stars = _countStars(_actual);
                      showDialog(context: context, builder: (_) => _stopTaskDialog());
                      },
                    child: Text('Stop'))]

              )
            ],
          ),
        )
    );
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
}


