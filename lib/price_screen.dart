import 'package:flutter/material.dart';
import 'coin_data.dart';
class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  // تعين القيمه الافتراضيه اللي هتظهر للمستخدم
  String selectedCurrency = 'USD';


  // هنعمل loop علشان نجيب كل الداتا اللي في list اللي عندنا
  // وللتذكره كل عنصر ف الداتا دي بيمثل اختيار من القايمه بتاعتنا
  List<DropdownMenuItem> getDropDownItems(){
    // دي قايمه فيها ليسته بالعناصر اللي هترجع للمستخدم
    // هبنيها فاضيه هنا واعمل الحلقه اللي هتلف علي كل العناصر وكل مره
    // هيلف لفه في اخر اللفه هيخزني قيمه جديده هنا في القايمه بتاعتي
    // لازم احط نوع الحاجه اللي بتتعرض ف الدروب داون ايتم وهنا انا بعرضها استرنج ف هتبق استرنج
    List<DropdownMenuItem <String>> dropDownItem = [];

    // دي حلقه تكراريه هتجبلي العناصر اللي هتتعرض للمستخدم
    for (String currency in currenciesList) {
      // هات القيم اللي ف الليسته اللي هتتعرض بناء علي الفهرس


       // حط القيمه النصيه في منيو ايتم  واحفظها ف متغير
        var  newItem =  DropdownMenuItem(
          child:  Text(currency),
          value: currency,
        );

        // خزن المنيو ايتم في ليسته العناصر اللي هترجع للعرض
        dropDownItem.add(newItem);
    }

    // هرجع اللسته للمستخدم
    return dropDownItem;
  }



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
            child: DropdownButton<String>(
              //   فاليو دي القيمه اللي هتظهر او ما البرنامج يفتح او يتعمله رفرش
              // كدا انا هنا بحط فيها قيمه افتراضيه بايدي
              value: selectedCurrency,
              // هيا الايتمز دي بتستقبل لسته ممكن احطها واحدا واحده
              // او استدعي داله هنا بترجع لسته جاهزه
              items: getDropDownItems(),

              // فاليو دي القيمه المختاره او ظهاره في الحال للسمتخدم
              onChanged: (value) {
                setState(() {
                  // فاليو دي القيمه المختاره او ظهاره في الحال للسمتخدم
                  selectedCurrency = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
