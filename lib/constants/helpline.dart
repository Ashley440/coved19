import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpLine extends StatelessWidget {
  Widget roundButton(
      Icon icon, String text, Color color, double width, String number) {
    return InkWell(
      onTap: () async => _makePhoneCall('tel:$number'),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7),
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Color textColor = Colors.white;
    return Container(
      padding: EdgeInsets.all(15),
      height: screenSize.height * .33,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "COVID-19",
            style: TextStyle(
                fontSize: 28, color: textColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Are you feeling sick?",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: textColor),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "If you feel sick with any COVID-19 symptoms, please call or text us immediately for help",
            style: TextStyle(color: textColor, fontSize: 18),
          ),
          SizedBox(height: 25),
          Row(
            children: [
              roundButton(
                  Icon(
                    Icons.phone,
                    color: textColor,
                  ),
                  "Call us",
                  Colors.blue,
                  screenSize.width * .3,
                  "0800 029 999"),
              SizedBox(width: screenSize.width * .15),
              roundButton(
                  Icon(
                    Icons.message,
                    color: textColor,
                  ),
                  "Send whatsapp",
                  Colors.green,
                  screenSize.width * .45,
                  "0600-123456"),
            ],
          )
        ],
      ),
    );
  }
}
