import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Constants.dart';

void main() {
  runApp(AlAzkarPage());
}

class AlAzkarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlAzkarPage Page',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFECD8A1),
          title: Text('Al-Azkar'),
        ),
        bottomNavigationBar: navBar,
        body:
        Column(
          children: <Widget>[
            alAzkarMenu,
            Expanded(
              child: alAzkar,
            ),
          ],
        ),
      ),
    );
  }
}

final List<String> alAzkarMenuList = <String>[
  'اذكار النوم',
  'اذكار الصلاة',
  'اذكار المساء',
  'اذكار الصباح'
];
Widget alAzkarMenu = Container(
  color: mainColor,
  height: 50,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    //padding: const EdgeInsets.symmetric(: 8),
    itemCount: alAzkarMenuList.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          '${alAzkarMenuList[index]}',
          style: TextStyle(fontSize: 30),
        ),
      );
    },
  ),
);

final List<String> alAzkarList = <String>[
  'للّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ. ',
  'آمَنَ الرَّسُولُ بِمَا أُنْزِلَ إِلَيْهِ مِنْ رَبِّهِ وَالْمُؤْمِنُونَ ۚ كُلٌّ آمَنَ بِاللَّهِ وَمَلَائِكَتِهِ وَكُتُبِهِ وَرُسُلِهِ لَا نُفَرِّقُ بَيْنَ أَحَدٍ مِنْ رُسُلِهِ ۚ وَقَالُوا سَمِعْنَا وَأَطَعْنَا ۖ غُفْرَانَكَ رَبَّنَا وَإِلَيْكَ الْمَصِيرُ. لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا لَهَا مَا كَسَبَتْ وَعَلَيْهَا مَا اكْتَسَبَتْ رَبَّنَا لَا تُؤَاخِذْنَا إِنْ نَّسِينَآ أَوْ أَخْطَأْنَا رَبَّنَا وَلَا تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِنْ قَبْلِنَا رَبَّنَا وَلَا تُحَمِّلْنَا مَا لَا طَاقَةَ لَنَا بِهِ وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَا أَنْتَ مَوْلَانَا فَانْصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ',
  'gaaw',
  'C',
  'C',
  'C',
  'C'
];

Widget alAzkar = Container(
  child: ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: alAzkarList.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        margin: EdgeInsets.all(8.0),
        height: 220,
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
