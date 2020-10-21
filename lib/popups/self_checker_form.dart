import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelfCheckerForm extends StatefulWidget {
  final List<String> symptoms = [
    "Fever or chills",
    "Cough",
    "Shortness of breath or difficulty breathing ",
    "Fatigue",
    "Muscle or body aches",
    "Headache",
    "New loss of taste or smell",
    "Sore throat",
    "Congestion or runny nose",
    "Nausea or vomiting",
    "Diarrhea",
  ];

  List hasSymptoms = [];

  SelfCheckerForm() {
    hasSymptoms = _createChecklist();
  }
  List<bool> _createChecklist() {
    return [for (int i = 0; i < symptoms.length; i++) false];
  }

  @override
  _SelfCheckerFormState createState() => _SelfCheckerFormState();
}

class _SelfCheckerFormState extends State<SelfCheckerForm> {
  bool _performedCheck = false;
  bool _isInfected = false;

  Widget checklist(String symptom, int i) {
    return InkWell(
      onTap: () =>
          setState(() => widget.hasSymptoms[i] = !widget.hasSymptoms[i]),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Text(
                symptom,
                softWrap: true,
              ),
            ),
            Expanded(
              child: Checkbox(
                  value: widget.hasSymptoms[i],
                  onChanged: (value) => setState(() {
                        widget.hasSymptoms[i] = value;
                      })),
            ),
          ],
        ),
      ),
    );
  }

  void _performCheck() {
    List numSymptoms = [
      for (bool symptom in widget.hasSymptoms)
        if (symptom) 1
    ];
    print(numSymptoms.length);
    setState(() {
      _isInfected = (numSymptoms.length / (widget.symptoms.length * 1.0) > .5);
      _performedCheck = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return _performedCheck
        ? AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: Container(
              padding: EdgeInsets.all(10),
              color: _isInfected ? Colors.amber : Colors.green[500],
              height: 200,
              width: screenSize.width * .95,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _isInfected
                        ? "You might have covid19".toUpperCase()
                        : "Things look good.".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: 1.5,
                  )
                ],
              ),
            ),
          )
        : AlertDialog(
            titlePadding: EdgeInsets.all(0),
            title: Container(
              padding: EdgeInsets.all(15),
              color: Colors.red,
              child: Text(
                "Do you have the following symptoms?",
                style: TextStyle(color: Colors.white),
              ),
            ),
            contentPadding: EdgeInsets.all(0),
            content: Container(
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < widget.symptoms.length; i++)
                      checklist(widget.symptoms[i], i),
                    SizedBox(
                      height: 5,
                    ),
                    RaisedButton(
                      onPressed: () {
                        _performCheck();
                      },
                      color: Colors.blue,
                      child: Text(
                        "submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
