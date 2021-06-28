class CountdownHelper {
  int countStars(int second) {
    /*
    int tMinute = second ~/ 60;

    if (tMinute < 15) {
      return tMinute < 10? 0: 1;
    } else {
      return 4 * tMinute ~/ 30 + 1 * tMinute % 30 ~/ 10;
    }*/

    //for testing:
    return second;
  }

  String timeString(int seconds) {
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
}
