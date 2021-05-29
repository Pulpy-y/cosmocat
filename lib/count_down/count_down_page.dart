import 'dart:async';
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

  _CountDownState(int hour, int minute) {
    _counter = hour * 3600 + minute * 60;
  }


  void _startTimer(){
    //_counter = 10;
    _timer = Timer.periodic(Duration(seconds:1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
          _actual++;
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
                '$_counter',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
              ),
              ElevatedButton(
                  onPressed: () => _startTimer(),
                  child: Text('Begin Journey!')),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                    ElevatedButton(
                        child: Text('Pause'),
                          onPressed: (){
                            _timer.cancel();
                          }),
                ElevatedButton(
                    onPressed:() {
                      _timer.cancel();
                      _stars = _countStars(_actual);
                      showDialog(context: context, builder: (_) => _taskCompletedDialog());
                      },
                    child: Text('Stop'))]

              )
            ],
          ),
        )
    );
  }

  Widget _taskCompletedDialog()  {
    return AlertDialog(
            title: const Text("YAY!"),
            content: Container(
              child: Text('You have helped Coma get $_stars stars!'),
                ));
  }
}


