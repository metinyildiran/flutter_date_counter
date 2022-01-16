import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import '../util/constants.dart';
import '../util/preference_utils.dart';

class CircleButton extends StatelessWidget {
  final String dayText;
  final GestureTapCallback onClicked;

  const CircleButton({Key? key, required this.onClicked, required this.dayText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onClicked,
      onLongPress: () {
        _showMyDialog(context, dayText);
      },
      elevation: 10.0,
      fillColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(dayText,
              style: const TextStyle(
                  fontSize: 30.0, fontWeight: FontWeight.bold)),
          const Text("AND ONGOING",
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal)),
        ],
      ),
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
    );
  }
}

Future<void> _showMyDialog(BuildContext context, String dayText) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Restart progression?'),
        content: const SingleChildScrollView(
            child: Text("Do you really want to reset the progress?")),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              PreferenceUtils.setString(
                  Constants.STARTING_DAY, DateTime.now().toString());
              Phoenix.rebirth(context);
            },
          )
        ],
      );
    },
  );
}

