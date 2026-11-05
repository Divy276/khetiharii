import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    super.key,
    this.buttonText,
    this.onTap,
    this.color,
    this.textColor,
  });

  final String? buttonText;
  final Widget? onTap;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.transparent,
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(50)),
      child: InkWell(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50)),
        onTap: onTap == null
            ? null
            : () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => onTap!),
                ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Text(
            buttonText ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor ?? Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
