import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          height: 25,
          width: 25,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
