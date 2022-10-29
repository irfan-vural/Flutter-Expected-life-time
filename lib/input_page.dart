import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/constants.dart';
import 'icon_cinsiyet.dart';
import 'my_container.dart';
import 'result_page.dart';
import 'user_data.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 15;
  double yapilanSpor = 3;
  int boy = 160;
  int kilo = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Yaşam Beklentisi",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlineButton('BOY'),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlineButton('KİLO'),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Haftada Kaç Defa Spor Yapıyorsunuz',
                        style: kMetinStili),
                    Text(yapilanSpor.round().toString(), style: kMetinStili),
                    Slider(
                        value: yapilanSpor,
                        min: 0,
                        max: 7,
                        onChanged: (double newValue) {
                          setState(() {
                            yapilanSpor = newValue;
                          });
                        })
                  ],
                ),
              ),
            ),
            Expanded(
                child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Günde Kaç Sigara İçiyorsunuz', style: kMetinStili),
                  Text(icilenSigara.round().toString(), style: kMetinStili),
                  Slider(
                      min: 0,
                      max: 30,
                      value: icilenSigara,
                      onChanged: (double newValue) {
                        setState(() {
                          icilenSigara = newValue;
                        });
                      })
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: MyContainer(
                    renk:
                        seciliCinsiyet == 'KADIN' ? Colors.pink : Colors.white,
                    child: MyColomn(
                      cinsiyet: 'KADIN',
                      icon: FontAwesomeIcons.venus,
                    ),
                  )),
                  Expanded(
                      child: MyContainer(
                          renk: seciliCinsiyet == 'ERKEK'
                              ? Colors.blueAccent
                              : Colors.white,
                          child: MyColomn(
                            cinsiyet: 'ERKEK',
                            icon: FontAwesomeIcons.mars,
                          )))
                ],
              ),
            ),
            ButtonTheme(
              height: 50,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(UserData(
                              seciliCinsiyet,
                              icilenSigara,
                              yapilanSpor,
                              boy,
                              kilo))));
                },
                child: Text(
                  'HESAPLA',
                  style: kMetinStili,
                ),
              ),
            )
          ],
        ));
  }

  Row buildRowOutlineButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              label,
              style: kMetinStili,
            )),
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              label == 'BOY' ? boy.toString() : kilo.toString(),
              style: kMetinStili,
            )),
        SizedBox(width: 40),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      label == 'BOY' ? boy++ : kilo++;
                    });
                  },
                  child: Icon(
                    FontAwesomeIcons.plus,
                    size: 10,
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      label == 'KİLO' ? kilo-- : boy--;
                    });
                  },
                  child: Icon(
                    FontAwesomeIcons.minus,
                    size: 10,
                  )),
            )
          ],
        )
      ],
    );
  }
}
