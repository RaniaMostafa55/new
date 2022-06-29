import 'package:flutter/material.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';

import 'button.dart';
import 'signin.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool check = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var email = TextEditingController();
  var pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          width: double.infinity,
          height: 300,
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
              "Register",
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
        Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5, right: 12, left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Email',
                        style: TextStyle(
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12, left: 12),
                child: TextFormField(
                  //TODO::changing the color
                  style: TextStyle(),
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (email) {
                    // if (!value.contains('@')) {
                    //   return "Please enter a valid email";
                    // } else
                    if (email!.isEmpty) {
                      return "please email";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(bottom: 5, right: 12, left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Phone Number',
                        style: TextStyle(
                          fontSize: 18,
                        )),
                  ],
                ),
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
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(bottom: 5, right: 12, left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Password',
                        style: TextStyle(
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12, left: 12),
                child: TextFormField(
                  style: TextStyle(),
                  obscureText: check,
                  controller: pass,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye, color: Colors.black),
                        onPressed: () {
                          setState(() {});
                          (check = !check);
                        }),
                  ),
                  validator: (pass) {
                    if (pass!.isEmpty) {
                      return "please password";
                    } else if (pass.length < 6) {
                      return "6 digit";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 12, left: 12),
          child: Button(val: "Register"),
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
          padding: const EdgeInsets.only(right: 12, left: 12, top: 10, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("have an account?"),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (contest) => Sign(),
                      ),
                    );
                  },
                  child: Text("Sign in here", style: TextStyle(fontSize: 14)))
            ],
          ),
        ),
        Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("By regestering your account, you are agree to our")
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextButton(onPressed: () {}, child: Text("terms and conditions", style: TextStyle(color: Colors.blue)))
            ]),
          ],
        )
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
