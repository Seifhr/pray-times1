import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'data.dart';
import 'json_connection.dart';
import 'Al-Azkar.dart';
import 'القران.dart';
import 'Constants.dart';

const backGroundColor = Color(0xFFECD8A1);

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          backgroundColor: backGroundColor,
          body:
          HomePage(),
        ));
  }
}
String locale = 'ar';

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);
  @override
  _Clock createState() => _Clock();
}

class _Clock extends State<Clock> {
  double minutesAngle=0;
  double secondsAngle=0;
  double hoursAngle=0;
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      final now= DateTime.now();
      setState(() {
        secondsAngle= (pi/30)*now.second;
        minutesAngle= (pi/30)* now.minute;
        hoursAngle=(pi/6 *now.hour)+(pi/45 *minutesAngle);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Stack(
          children: <Widget>[
            Image.asset('images/Clock.png'),
            //seconds
            Transform.rotate(
              child: Container(
                child: Container(
                  height: 120,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                alignment: Alignment(0,-0.35),
              ),
              angle: secondsAngle,
            ),
            //Minutes
            Transform.rotate(
              child: Container(
                child: Container(
                  height: 80,
                  width: 5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                alignment: Alignment(0,-0.35),
              ),
              angle: minutesAngle,
            ),
            //Hours
            Transform.rotate(
              child: Container(
                child: Container(
                  height: 60,
                  width: 7,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                alignment: Alignment(0,-0.25),
              ),
              angle: hoursAngle,
            ),
          ],
        ),
        margin: EdgeInsets.all(30.0),
        width: 270,
        height: 270,
      ),
      color: backGroundColor,
      alignment: Alignment.center,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prayer Times',
      home: Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          title: const Text('Prayer Times'),
        ),
          bottomNavigationBar:navBar,
        body: Column(children: <Widget>[
          imageSection,
          prayTime,
        ]),
      ),
    );
  }
}

Widget imageSection = Column(
  children: [
    Clock(),
  ],
);

Widget prayTime = Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      PrayTimes(),
    ],
);

Widget buttonSection = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(Colors.black, Icons.call, 'الصلاة'),
      _buildButtonColumn(Colors.black, Icons.near_me, 'الاذكار'),
      _buildButtonColumn(Colors.black, Icons.share, 'الصفحة الرئيسية'),
    ],
  ),
);

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

class PrayTimes extends StatefulWidget {
  PrayTimes({Key key}) : super(key: key);

  @override
  _PrayTimesState createState() => _PrayTimesState();
}

class _PrayTimesState extends State<PrayTimes> {

  JsonConnection jsonConnection = new JsonConnection();
  Data list;

  static String city = 'Cairo';
  static String country = 'Egypt';
  static int method = 4;

  final String url =
      'http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=$method';

  Future getPTData() async {
    http.Response res = await http.get(Uri.encodeFull(url), headers: {
      "Accept":
          "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });
    final data = jsonDecode(res.body);

    list = Data.fromJson(data);

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: jsonConnection.getPTLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('Fajr',style: TextStyle(fontSize: 30),),
                          Text('Dhuhr',style: TextStyle(fontSize: 30),),
                          Text('Asr',style: TextStyle(fontSize: 30)),
                          Text('Maghrib',style: TextStyle(fontSize: 30)),
                          Text('Isha',style: TextStyle(fontSize: 30)),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(snapshot.data.data.timings.fajr,style: TextStyle(fontSize: 30)),
                          Text(snapshot.data.data.timings.dhuhr,style: TextStyle(fontSize: 30)),
                          Text(snapshot.data.data.timings.asr,style: TextStyle(fontSize: 30)),
                          Text(snapshot.data.data.timings.maghrib,style: TextStyle(fontSize: 30)),
                          Text(snapshot.data.data.timings.isha,style: TextStyle(fontSize: 30)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else  {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}


