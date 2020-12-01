import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Constants.dart';

void main() {
  runApp(QuranPage());
}

class QuranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlAzkarPage Page',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFECD8A1),
          title: Text('َQuran'),
        ),
        bottomNavigationBar: navBar,
        body: Column(
          children: <Widget>[
            //alAzkarMenu,
            Expanded(
              child: alAzkar,
            ),
          ],
        ),
      ),
    );
  }
}
final List<String> alAzkarList = <String>[
  'الجزء الأول',
  'الجزء الثاني',
  'الجزء الثالث',
  'الجزء الرابع',
  'الجزء الخامس',
  'الجزء السادس',
  'الجزء السابع',
  'الجزء الثامن',
  'الجزء التاسع',
  'الجزء العاشر',
  'الجزء الحادي عشر',
  'الجزء الثاني عشر',
  'الجزء الثالث عشر',

];

Widget alAzkar = Container(
  child: ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: alAzkarList.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        margin: EdgeInsets.all(8.0),
        height: 40,
        color: mainColor,
        child: Center(child: Text('${alAzkarList[index]}')),
      );
    },
  ),
);

Column _buildButtonColumnWithoutIcon(Color color, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
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
 
