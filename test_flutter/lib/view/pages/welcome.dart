import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/view/pages/custom_pet.dart';
import 'package:test_flutter/view_model/welcome_model.dart';

import '../../provider/dropdown_provider.dart';
final entity = new welcomeModel();

class WelcomePage extends StatelessWidget {
  // final arrays = new DropDownbutton().dropDownMenu["Gender"];
  final arrays = new DropDownbutton().dropDownMenu["Gender"];

  @override
  Widget build(BuildContext context) {
      var petnm;
      var age;
      var weight;
      var gender;
      // var _selectedKey;
    //ペット登録していなければ画面を表示
    return Scaffold(
      appBar: AppBar(
        title: Text("こんちわテスト"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child:
                  Text("ペット登録",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ),
              Container(
                width: 350,
                padding: const EdgeInsets.only(bottom: 8),
                // color: Colors.amber,
                child: TextField(
                  // controller: TextEditingController(text: ''),
                  decoration: InputDecoration(
                    labelText: "ペット名",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    petnm = value;
                  }
                ),
              ),
              Container(
                width: 350,
                padding: const EdgeInsets.only(bottom: 8),
                child:DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  isExpanded: true,
                  value: gender,
                  hint: Text('性別'), //プレースホルダー
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 20,
                  elevation: 16,
                  // style: TextStyle(fontSize: 20, color: Colors.black),
                  onChanged: (newValue) {
                    context.read<dropDownProvider>().GenderSelectProvider(newValue!);
                    gender = newValue;
                      // _selectedKey = newValue;
                  },
                  items: arrays!
                    .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                  }).toList(),
                ),
              ),
              Container(
                width: 350,
                padding: const EdgeInsets.only(bottom: 8),
                // color: Colors.amber,
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  // controller: TextEditingController(text: ''),
                  decoration: InputDecoration(
                    labelText: "年齢",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    age = value;
                  }
                ),
              ),
              Container(
                width: 350,
                padding: const EdgeInsets.only(bottom: 8),
                // color: Colors.amber,
                child:TextField(
                        keyboardType: TextInputType.number,
                        // controller: TextEditingController(text: ''),
                        decoration: InputDecoration(
                        labelText: "体重(kg)",
                        border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          weight = value;
                        }
                      ),
              ),
              TextButton(
                child: Text('登録'),
                onPressed: () async{ 
                  var prefs = await SharedPreferences.getInstance();
                  Map<String, dynamic> row = {
                    'userid'  : prefs.getInt("userId")!,
                    'name' : petnm,
                    'gender'  : gender.toString(),
                    'age'  : age,
                    'weight'  : weight,
                  };
                  var result =await entity.InsertPets(row);
                  if(result >= 1)
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => customPetsPage()),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}