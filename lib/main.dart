import 'package:flutter/material.dart';

void main() => runApp(
    const MaterialApp(home: DateCounter(), debugShowCheckedModeBanner: false));

class DateCounter extends StatefulWidget {
  const DateCounter({Key? key}) : super(key: key);

  @override
  _DateCounterState createState() => _DateCounterState();
}

class _DateCounterState extends State<DateCounter> {
  DateTime selectedDate = DateTime.now();

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
                    child: RawMaterialButton(
                      onPressed: () {},
                      onLongPress: () {
                        _showMyDialog(context);
                      },
                      elevation: 10.0,
                      fillColor: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("0 DAYS",
                              style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.bold)),
                          Text("AND COUNTING",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal)),
                        ],
                      ),
                      padding: const EdgeInsets.all(15.0),
                      shape: const CircleBorder(),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Restart progression?'),
        content: const SingleChildScrollView(
          child: Text("Do you really want to reset the progress?")
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}
