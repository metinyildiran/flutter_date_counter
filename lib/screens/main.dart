import 'package:date_counter/util/preference_utils.dart';
import 'package:date_counter/widgets/CircleButton.dart';
import 'package:flutter/material.dart';
import 'package:date_counter/util/constants.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() => runApp(Phoenix(
    child: const MaterialApp(
        home: DateCounter(), debugShowCheckedModeBanner: false)));

class DateCounter extends StatefulWidget {
  const DateCounter({Key? key}) : super(key: key);

  @override
  _DateCounterState createState() => _DateCounterState();
}

class _DateCounterState extends State<DateCounter> {
  String dayText = "0 DAY";
  int _daysPassed = 0;

  void updateDayCounter() {
    // PreferenceUtils.setString(Constants.STARTING_DAY, DateTime.now().subtract(Duration(hours: 48)).toString());

    if (PreferenceUtils.getString(Constants.STARTING_DAY).isEmpty) {
      PreferenceUtils.setString(
          Constants.STARTING_DAY, DateTime.now().toString());
    }

    setState(() {
      _daysPassed = differenceInDays(
          DateTime.parse(PreferenceUtils.getString(Constants.STARTING_DAY)));
      if (_daysPassed < 2) {
        dayText = "$_daysPassed DAY";
      } else {
        dayText = "$_daysPassed DAYS";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                const SizedBox(
                    width: 200.0,
                    height: 200.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 10.0,
                    )),
                SizedBox(
                    width: 200.0,
                    height: 200.0,
                    child: CircleButton(
                      dayText: dayText,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    PreferenceUtils.init().whenComplete(() => {updateDayCounter()});
    super.initState();
  }
}

int differenceInDays(DateTime startingDay) {
  return DateTime.now().difference(startingDay).inHours ~/ 24;
}
