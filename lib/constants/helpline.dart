import 'package:flutter/material.dart';

class HelpLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            "Looking for urgent help?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          SizedBox(height: 20),
          Text("Emergency Hotline: 0800 029 999",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(height: 10),
          Text("WhatsApp Support Line: 0600-123456",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
        ],
      ),
    );
  }
}
