import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'networking.dart';

import 'dart:io' show Platform;
const apiKey = '5D9FC9A1-A5D5-462E-925E-B3ABD7E9A083';



class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}


class _PriceScreenState extends State<PriceScreen> {

  String selectedCurrency = 'AUD';
  String priceString = '?';

  @override
  void initState() {
    super.initState();
    getDataThrowHelper();
  }

  Future getDataThrowHelper() async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=$apiKey');

    var decodedData = await networkHelper.getDataFromNet();
    updateUI(decodedData);
  }

  void updateUI(dynamic fullData) async{
      double rate = fullData['rate'];
      int price = rate.toInt();
      priceString = price.toString();
  }


  DropdownButton<String> getAndroidDropDown() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: getDropDownItems(),
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getDataThrowHelper();
        });
      },
    );
  }

  List<DropdownMenuItem> getDropDownItems() {
    List<DropdownMenuItem<String>> dropDownItem = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency,
          style: TextStyle(
              color: Colors.white,
              fontSize: 26.0
          ),
        ),
        value: currency,
      );

      dropDownItem.add(newItem);
    }
    return dropDownItem;
  }
  CupertinoTheme getIOSPicker(){
    return CupertinoTheme(
      data: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          pickerTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 26.0
          ),
        ),
      ),
      child: CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        children: getPickerItems(),
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          print(currenciesList[selectedIndex]);
        },
      ),
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
                  '1 BTC = $priceString $selectedCurrency',
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
            child: (Platform.isAndroid) ? getAndroidDropDown() : getIOSPicker(),
          ),
        ],
      ),
    );
  }
}
