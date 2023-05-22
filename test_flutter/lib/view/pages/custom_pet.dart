import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/view/pages/welcome.dart';
import 'package:test_flutter/view_model/custom_pet_model.dart';
import 'package:test_flutter/provider/error_provider.dart';
import 'package:test_flutter/view/componets/error.dart';

class customPetsPage extends StatelessWidget {
  final entity = new customPetModel();
  var petlist;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("こんちわテスト"),
      ),
      body: Container(
        height: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                  child: Column(
                    children:[ 
                      await entity.PetList();
                        SizedBox(
                          width: double.infinity,
                            child: TextButton(
                              child: Text('button'),
                              onPressed: () {},
                          ),
                        ),
                    ],
                  ),
                ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton.extended(
                tooltip: 'Action!',
                icon: Icon(Icons.add), //アイコンは無しでもOK
                label: Text('Add'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
