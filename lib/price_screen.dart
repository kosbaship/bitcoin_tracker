import 'package:flutter/material.dart';
// هنستدعي المكتبه اللي فيها ادوات تخص الايفون بس
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {


  String selectedCurrency = 'USD';

  List<DropdownMenuItem> getDropDownItems(){
    // ملحوظه تخص الليسته والماب علي الاقل عرفها حتي ولو فاضيه
    List<DropdownMenuItem <String>> dropDownItem = [];
    for (String currency in currenciesList) {
        var  newItem =  DropdownMenuItem(
          child:  Text(currency),
          value: currency,
        );

        dropDownItem.add(newItem);
    }
    return dropDownItem;
  }

  // الاداه بتاعه الاي او اس بتستقبل ليسته من widget عاديه وانا عاوز اعرض فيها
  // ليسته من ادا Text جواها نصوص فا انا هنا هعمل الداله بتعتي بترجه اللي انا عاوزه
  List<Text> getPickerItems(){
    // ملحوظه تخص الليسته والماب علي الاقل عرفها حتي ولو فاضيه
    List<Text> pickerItem = [];
    for (String currency in currenciesList) {
      var  newItem =  Text(currency);
      pickerItem.add(newItem);
    }
    return pickerItem;
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
            child: CupertinoPicker(
              backgroundColor: Colors.lightBlue,
              // دي العناصر اللي هتتعرض
              children: getPickerItems(),
              // طول العنصر قد ايه
              itemExtent: 32.0,
              // اللي هيحصل واحنا بنبل بين العناصر ونقف عند عنصر معين
              onSelectedItemChanged: (selectedIndex){
                print(currenciesList[selectedIndex] );
              },
            ),
          ),
        ],
      ),
    );
  }
}


//DropdownButton<String>(
//value: selectedCurrency,
//items: getDropDownItems(),
//
//onChanged: (value) {
//setState(() {
//selectedCurrency = value;
//});
//},
//)
