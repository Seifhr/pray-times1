import 'package:flutter/material.dart';
import 'package:praytimes/Qibla.dart';
import 'Al-Azkar.dart';
import 'main.dart';
import 'القران.dart';
const kBackgroundColor = Color(0xFF202020);
const kPrimaryColor = Color(0xFFECD8A1);

const mainColor = Color(0xFFECD8A1);
const elAzkarMenuColor = Color(0xFF558C40);

Widget navBar = Container(
      child: NavBar(),
);

class NavBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          textColor: Colors.black,
          color: mainColor,
          child: Text('Quran'),
          onPressed: () {
            navigateToQuran(context);
          },
        ),
        RaisedButton(
          textColor: Colors.black,
          color: mainColor,
          child: Text('Al-Azkar'),
          onPressed: () {
            navigateToAlAzkar(context);
          },
        ),
        RaisedButton(
          textColor: Colors.black,
          color: mainColor,
          child: Text('Home'),
          onPressed: () {
            navigateToHomePage(context);
          },
        ),
        RaisedButton(
          textColor: Colors.black,
          color: mainColor,
          child: Text('Qiblah'),
          onPressed: () {
            navigateToQibla(context);
          },


        ),
      ],
    );
  }

  Future navigateToQuran(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Quran()));
  }
  Future navigateToQibla(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => QiblaMecca()));
  }


  Future navigateToAlAzkar(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AlAzkarPage()));
  }
  Future navigateToHomePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
   }
}
// Widget NavBar = Container(
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       buildNavBar(Colors.black, 'الصلاة'),
//       buildNavBar(Colors.black, 'الاذكار'),
//       buildNavBar(Colors.black, 'الصفحة الرئيسية'),
//     ],
//   ),
// );

// Column buildNavBar(Color color, String label) {
//   return Column(
//     mainAxisSize: MainAxisSize.min,
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: <Widget>[
//       Container(
//         margin: const EdgeInsets.only(bottom: 10),
//         child: Text(
//           label,
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w400,
//             color: color,
//           ),
//         ),
//       ),
//     ],
//   );
// }
