import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
// هنستدعي الباكدش اللي بتسمحلنا نعرف احنا علي انهو Platform
// وبس انا هجيب الكلاس اللي اسمه بلاتفورم
// شو انك تجيب كلاس واحد من الباكدج
// هايد انك تخفي واحد ميظهرش ف النشروع
// از كانت اننا نغير اسمه ف الاستخدام هنا
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

//  هنعمل الدله اللي بتجيب الاداه اللي بتشتغلي علي اندرويد
  DropdownButton<String> getAndroidDropDown() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: getDropDownItems(),
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  List<DropdownMenuItem> getDropDownItems() {
    List<DropdownMenuItem<String>> dropDownItem = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );

      dropDownItem.add(newItem);
    }
    return dropDownItem;
  }
  //  هنعمل الدله اللي بتجيب الاداه اللي بتشتغلي علي IOS
  CupertinoPicker getIOSPicker(){
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      children: getPickerItems(),
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(currenciesList[selectedIndex]);
      },
    );
  }

  List<Text> getPickerItems() {
    List<Text> pickerItem = [];
    for (String currency in currenciesList) {
      var newItem = Text(currency);
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
            // لو هو اندرويد اعرض كذا لو اي حاجه تانيه اعرض بنظام ابل
            // انا هنا استخدمت ال Ternary operator بدل ما اعملها داله لوحدها
            child: (Platform.isAndroid) ? getAndroidDropDown() : getIOSPicker(),
          ),
        ],
      ),
    );
  }
}
