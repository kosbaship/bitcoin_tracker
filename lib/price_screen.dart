import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  // الاول - بنعرف القيمه اللي هتتغير هنا
  // دي هتبق القيمه اللي هتظهر كاول عنصر تم اختياره
  String dropdownValue = 'USD';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
//            بنستخدم الاداه بتاعه المنيو
            child: DropdownButton<String>(
//              دي القيمه الافتراضيه هتظهر ف الاول
//              يعني اللي جواها هظهر كاول عنصر تم اختياره
              value: dropdownValue,
              items: [
//                لازم اول قيمه ف المنيو تتساوا مع القيمه الافتراضيه
                DropdownMenuItem(
//                  دي القيمه اللي هتتحط بعد الاختيار
                  value: 'USD',
//                  دي القيمه اللي هتتعرض علشان نختار منها
                  child: Text('USD'),
                ),
//                هتحط باقي العناصر عادي
                DropdownMenuItem(
                  value: 'POUND',
                  child: Text('POUND'),
                ),
//                دا الت عنصر
                DropdownMenuItem(
                  value: 'MOU',
                  child: Text('MOU'),
                ),
              ],
//              لما يحصل تغير استخدم القيمه اللي اتغيرت حطها في القايمه اللي بنعين منها
              onChanged: (value) {
                setState(() {
                  dropdownValue = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
