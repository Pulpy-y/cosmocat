import 'package:test/test.dart';
import 'package:cosmocat/count_down/countdown_helper.dart';

void main() {
  test('value should return amt of stars', () {
    expect(CountdownHelper().countStars(1), 1);
  });

  group("time to string test", () {
    var helper = CountdownHelper();
    test('value should return amt of stars', () {
      expect(helper.countStars(1), 1);
    });

    test('value should return "00:00"', () {
      expect(helper.timeString(0), '00:00');
    });

    test('value should return "01:00"', () {
      expect(helper.timeString(60), '01:00');
    });

    test('value should return "00:59"', () {
      expect(helper.timeString(59), '00:59');
    });

    test('value should return "01:00:59"', () {
      expect(helper.timeString(3659), '01:00:59');
    });
  });
}
