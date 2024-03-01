import 'package:flutter/material.dart';

class CommonbButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const CommonbButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        minimumSize: Size(double.infinity, 50),
        textStyle: TextStyle(fontSize: 18),
      ),
      child: Text(
        text,
      ),
    );
  }
}
