import 'package:flutter/material.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';

import 'button.dart';
import 'register.dart';

class Sign extends StatefulWidget {
  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/delv3.png"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0, left: 12.0),
          child: Text("Welcome to Fashion Daily"),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 12.0, left: 12.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Sign in",
              style: TextStyle(fontSize: 40),
            ),
            Row(
              children: [
                Text("Help",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                    )),
                Icon(
                  Icons.question_mark_sharp,
                  color: Colors.blue,
                )
              ],
            ),
          ]),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(right: 12, left: 12),
          child: Text('Phone Number',
              style: TextStyle(
                fontSize: 18,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0, left: 12.0),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(title: _buildCountryPickerDropdown(sortedByIsoCode: true)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 12, left: 12),
          child: Button(val: "Sign in"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Or"),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12, left: 12),
          child: Button(val: "Sign in with google"),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12, left: 12, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Doesn't have any account?"),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (contest) => Register(),
                      ),
                    );
                  },
                  child: Text("Register here", style: TextStyle(fontSize: 14)))
            ],
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Use the application according to policy rules. Any\n kinds of violations will be subject to sanctions.")
        ])
      ]),
    );
  }

  _buildCountryPickerDropdown({bool filtered = false, bool sortedByIsoCode = false, bool hasPriorityList = false, bool hasSelectedItemBuilder = false}) {
    double dropdownButtonWidth = MediaQuery.of(context).size.width * 0.5;
    //respect dropdown button icon size
    double dropdownItemWidth = dropdownButtonWidth - 30;
    double dropdownSelectedItemWidth = dropdownButtonWidth - 30;
    return Row(
      children: <Widget>[
        SizedBox(
          width: dropdownButtonWidth,
          child: CountryPickerDropdown(
            /* underline: Container(
              height: 2,
              color: Colors.red,
            ),*/
            //show'em (the text fields) you're in charge now
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            //if you have menu items of varying size, itemHeight being null respects
            //that, IntrinsicHeight under the hood ;).
            itemHeight: null,
            //itemHeight being null and isDense being true doesn't play along
            //well together. One is trying to limit size and other is saying
            //limit is the sky, therefore conflicts.
            //false is default but still keep that in mind.
            isDense: false,
            //if you want your dropdown button's selected item UI to be different
            //than itemBuilder's(dropdown menu item UI), then provide this selectedItemBuilder.
            selectedItemBuilder: hasSelectedItemBuilder == true ? (Country country) => _buildDropdownSelectedItemBuilder(country, dropdownSelectedItemWidth) : null,
            //initialValue: 'AR',
            itemBuilder: (Country country) => hasSelectedItemBuilder == true ? _buildDropdownItemWithLongText(country, dropdownItemWidth) : _buildDropdownItem(country, dropdownItemWidth),
            initialValue: 'AR',
            itemFilter: filtered
                ? (c) => [
                      'AR',
                      'DE',
                      'GB',
                      'CN'
                    ].contains(c.isoCode)
                : null,
            //priorityList is shown at the beginning of list
            priorityList: hasPriorityList
                ? [
                    CountryPickerUtils.getCountryByIsoCode('GB'),
                    CountryPickerUtils.getCountryByIsoCode('CN'),
                  ]
                : null,
            sortComparator: sortedByIsoCode ? (Country a, Country b) => a.isoCode.compareTo(b.isoCode) : null,
            onValuePicked: (Country country) {
              print("${country.name}");
            },
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: "Phone",
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
            keyboardType: TextInputType.number,
          ),
        )
      ],
    );
  }

  Widget _buildDropdownItem(Country country, double dropdownItemWidth) => SizedBox(
        width: dropdownItemWidth,
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(
              width: 8.0,
            ),
            Expanded(child: Text("+${country.phoneCode}(${country.isoCode})")),
          ],
        ),
      );

  Widget _buildDropdownItemWithLongText(Country country, double dropdownItemWidth) => SizedBox(
        width: dropdownItemWidth,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              CountryPickerUtils.getDefaultFlagImage(country),
              SizedBox(
                width: 8.0,
              ),
              Expanded(child: Text("${country.name}")),
            ],
          ),
        ),
      );

  Widget _buildDropdownSelectedItemBuilder(Country country, double dropdownItemWidth) => SizedBox(
      width: dropdownItemWidth,
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              CountryPickerUtils.getDefaultFlagImage(country),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                  child: Text(
                '${country.name}',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )),
            ],
          )));
}
