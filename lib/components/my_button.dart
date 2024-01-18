import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final void Function() onTapAction;
  const MyButton(
      {super.key, required this.buttonName, required this.onTapAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapAction,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(child: Text(buttonName)),
      ),
    );
  }
}
