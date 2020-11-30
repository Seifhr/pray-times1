import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Constants.dart';

void main() {
  runApp(Quran());
}

class Quran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   brightness: Brightness.dark,
      // ),
      title: 'AlAzkarPage Page',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text('َQuran'),
        ),
        backgroundColor: mainColor,
        bottomNavigationBar: navBar,
        body: Column(
          children: <Widget>[
            //alAzkarMenu,
            Expanded(
              child: Center(
                child: alAzkar,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<String> alAzkarList = <String>[
  'الصور',
  'الاجزاء',
];

final List<String> Photos = <String>[
  'images/Quran.png',
  'images/Parts.png',
];

Widget alAzkar = Container(
  child: ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: alAzkarList.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        margin: EdgeInsets.all(8.0),
        height: 150,
        child: Center(
          child: Text(
            '${alAzkarList[index]}',
            style: TextStyle(fontSize: 20, color: Colors.white, height: 7),
          ),
        ),
        decoration: BoxDecoration(
          color: mainColor,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('${Photos[index]}'),
            fit: BoxFit.fill,
          ),
        ),
      );
    },
  ),
);



Column _buildButtonColumnWithoutIcon(Color color, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Container(
        margin: const EdgeInsets.only(bottom: 18),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}


Container _buildAlAzkar(String label) {
  //Icon(icon, color: color),
  return Container(
    color: mainColor,
    //margin: const EdgeInsets.only(top: 8),
    margin: const EdgeInsets.all(8),
    child: Text(
      label,
      textAlign: TextAlign.right,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
  );
}
