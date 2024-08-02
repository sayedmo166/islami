import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

  class loadingInsicator extends StatelessWidget {
  const loadingInsicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(color: Theme.of(context).primaryColor,
      ),
    );
  }
}
