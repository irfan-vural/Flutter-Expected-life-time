import 'package:life_expectancy/user_data.dart';

class Hesap {
  UserData _userData;
  Hesap(this._userData);

  double hesaplama() {
    double sonuc = 90 + _userData.yapilanSpor - _userData.icilenSigara;
    sonuc = sonuc + (_userData.boy / _userData.kilo);

    _userData.seciliCinsiyet == 'kadın' ? sonuc + 10 : sonuc - 5;
    return sonuc;
  }
}
