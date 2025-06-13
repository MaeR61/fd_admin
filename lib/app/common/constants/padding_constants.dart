import 'package:flutter/cupertino.dart';

class PaddingConstants {
  static PaddingConstants instance = PaddingConstants._init();
  PaddingConstants._init();

  //Her kenardan EdgeInsets.all()
  final paddingAllDort = const EdgeInsets.all(4.0);
  final paddingAllSekiz = const EdgeInsets.all(8.0);
  final paddingAllOnIki = const EdgeInsets.all(12.0);
  final paddingAllOnAlti = const EdgeInsets.all(16.0);
  final paddingAllYirmi = const EdgeInsets.all(20.0);
  final paddingAllYirmiDort = const EdgeInsets.all(24.0);
  final paddingAllYirmiSekiz = const EdgeInsets.all(28.0);
  final paddingAllOtuzIki = const EdgeInsets.all(32.0);

  //Vertical EdgeInsets.symmetric(vertical:)
  final paddingVerDort = const EdgeInsets.symmetric(vertical: 4.0);
  final paddingVerSekiz = const EdgeInsets.symmetric(vertical: 8.0);
  final paddingVerOnIki = const EdgeInsets.symmetric(vertical: 12.0);
  final paddingVerOnAlti = const EdgeInsets.symmetric(vertical: 16.0);
  final paddingVerOtuzIki = const EdgeInsets.symmetric(vertical: 32.0);

  //Horizontal EdgeInsets.symmetric(horizontal: )
  final paddingHorDort = const EdgeInsets.symmetric(horizontal: 4.0);
  final paddingHorSekiz = const EdgeInsets.symmetric(horizontal: 8.0);
  final paddingHorOnIki = const EdgeInsets.symmetric(horizontal: 12.0);
  final paddingHorOnAlti = const EdgeInsets.symmetric(horizontal: 16.0);
  final paddingHorOtuzIki = const EdgeInsets.symmetric(horizontal: 32.0);

  //Sol kenardan EdgeInsets.only(left: )
  final paddingLeftDort = const EdgeInsets.only(left: 4.0);
  final paddingLeftSekiz = const EdgeInsets.only(left: 8.0);
  final paddingLeftOnIki = const EdgeInsets.only(left: 12.0);
  final paddingLeftOnAlti = const EdgeInsets.only(left: 16.0);
  final paddingLeftOtuzIki = const EdgeInsets.only(left: 32.0);

  //Sağ kenardan EdgeInsets.only(right: )
  final paddingRightDort = const EdgeInsets.only(right: 4.0);
  final paddingRightSekiz = const EdgeInsets.only(right: 8.0);
  final paddingRightOnIki = const EdgeInsets.only(right: 12.0);
  final paddingRightOnAlti = const EdgeInsets.only(right: 16.0);
  final paddingRightOtuzIki = const EdgeInsets.only(right: 32.0);

  //Üst kenardan EdgeInsets.only(top: )
  final paddingTopDort = const EdgeInsets.only(top: 4.0);
  final paddingTopSekiz = const EdgeInsets.only(top: 8.0);
  final paddingTopOnIki = const EdgeInsets.only(top: 12.0);
  final paddingTopOnAlti = const EdgeInsets.only(top: 16.0);
  final paddingTopOtuzIki = const EdgeInsets.only(top: 32.0);

  //Alt kenardan EdgeInsets.only(bottom: )
  final paddingBottomDort = const EdgeInsets.only(bottom: 4.0);
  final paddingBottomSekiz = const EdgeInsets.only(bottom: 8.0);
  final paddingBottomOnIki = const EdgeInsets.only(bottom: 12.0);
  final paddingBottomOnAlti = const EdgeInsets.only(bottom: 16.0);
  final paddingBottomOtuzIki = const EdgeInsets.only(bottom: 32.0);
}