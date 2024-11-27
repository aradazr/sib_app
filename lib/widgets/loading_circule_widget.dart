import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingCirculeWidget extends StatelessWidget {
  const LoadingCirculeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SpinKitFadingCircle(
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ],
    );
  }
}