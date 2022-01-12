import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:topratepppp/constant.dart';

class Spiner extends StatelessWidget {
  const Spiner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitWave(
        color: ksecondaryAPPthemecolor,
        size: 55.0,
      ),
    );
  }
}