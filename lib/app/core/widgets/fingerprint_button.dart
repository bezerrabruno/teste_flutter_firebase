import 'package:flutter/material.dart';

class FingerprintButton extends StatelessWidget {
  final Function() onTap;

  const FingerprintButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white,
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Icon(
                    Icons.fingerprint,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Entrar com Biometria',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
