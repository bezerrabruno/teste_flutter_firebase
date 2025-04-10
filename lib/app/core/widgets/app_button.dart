import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final double? height;
  final double? width;

  final String textButton;
  final void Function() onTap;

  final bool enabled;
  final bool loading;

  const AppButton({
    super.key,
    this.height = 48,
    this.width = double.maxFinite,
    required this.textButton,
    required this.onTap,
    this.enabled = true,
    this.loading = false,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(24),
      color: widget.enabled ? Colors.blueAccent : Colors.grey.shade400,
      child: InkWell(
        onTap: !widget.enabled || widget.loading ? null : widget.onTap,
        borderRadius: BorderRadius.circular(24),
        splashColor: Colors.blueAccent.shade200,
        child: Container(
          height: widget.height,
          width: widget.width,
          child: Stack(
            children: [
              Visibility(
                visible: widget.loading,
                child: SizedBox(
                  height: widget.height,
                  width: widget.width,
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.blueAccent,
                    backgroundColor: Colors.blueAccent.shade200,
                  ),
                ),
              ),
              Center(
                child: Text(
                  widget.textButton,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
