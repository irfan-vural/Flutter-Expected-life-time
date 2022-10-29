import 'package:flutter/material.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/hesap.dart';
import 'package:life_expectancy/user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sonuc sayfası'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, //ekranı doldurma
        children: [
          Expanded(
              flex: 8,
              child: Center(
                  child: Text(
                Hesap(_userData).hesaplama().toString(),
                style: kMetinStili,
              ))),
          Expanded(
              flex: 1,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepOrange)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Geri dön',
                  style: kMetinStili,
                ),
              ))
        ],
      ),
    );
  }
}
