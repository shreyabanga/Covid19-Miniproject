import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../user_data.dart';

class SymptomSurvey extends StatefulWidget {
  @override
  _SymptomSurveyState createState() => new _SymptomSurveyState();
}

class _SymptomSurveyState extends State<SymptomSurvey> {
  double _coughSlider = 0;
  double _soreThroatSlider = 0;
  double _feverSlider = 0;
  double _diarrheaSlider = 0;
  double _nauseaSlider = 0;
  double _headacheSlider = 0;
  double _fatigueSlider = 0;
  double _tasteSlider = 0;
  double _smellSlider = 0;
  double _chestPainSlider = 0;

  bool alreadySubmitted = false;

  Map symptoms = {};

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    var temp = await checkSubmission();
    setState(() {
      alreadySubmitted = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        title: Text(
          "Daily Symptoms Survey",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: Text(
                        "Are you experiencing any of the following symptoms? If so, please rate from a scale of 0-100",
                        style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    child: Text(
                      "1. Coughing",
                      style: TextStyle(
                          color: Colors.deepOrange[500],
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Slider(
                  value: _coughSlider,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: _coughSlider.round().toString(),
                  activeColor: Colors.deepOrange[300],
                  inactiveColor: Colors.deepOrange[100],
                  onChanged: (double value) {
                    setState(
                      () {
                        _coughSlider = value;
                        if (value != 0)
                          symptoms['cough'] = value;
                        else
                          symptoms.remove('cough');
                      },
                    );
                  },
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: Text(
                        "2. Sore Throat",
                        style: TextStyle(
                            color: Colors.deepOrange[500],
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Slider(
                  value: _soreThroatSlider,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: _soreThroatSlider.round().toString(),
                  activeColor: Colors.deepOrange[300],
                  inactiveColor: Colors.deepOrange[100],
                  onChanged: (double value) {
                    setState(
                      () {
                        _soreThroatSlider = value;
                        if (value != 0)
                          symptoms['soreThroat'] = value;
                        else
                          symptoms.remove('soreThroat');
                      },
                    );
                  },
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: Text(
                        "3. Fever",
                        style: TextStyle(
                            color: Colors.deepOrange[500],
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Slider(
                  value: _feverSlider,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: _feverSlider.round().toString(),
                  activeColor: Colors.deepOrange[300],
                  inactiveColor: Colors.deepOrange[100],
                  onChanged: (double value) {
                    setState(
                      () {
                        _feverSlider = value;
                        if (value != 0)
                          symptoms['fever'] = value;
                        else
                          symptoms.remove('fever');
                      },
                    );
                  },
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: Text(
                        "4. Diarrhea",
                        style: TextStyle(
                            color: Colors.deepOrange[500],
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Slider(
                  value: _diarrheaSlider,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: _diarrheaSlider.round().toString(),
                  activeColor: Colors.deepOrange[300],
                  inactiveColor: Colors.deepOrange[100],
                  onChanged: (double value) {
                    setState(
                      () {
                        _diarrheaSlider = value;
                        if (value != 0)
                          symptoms['diarrhea'] = value;
                        else
                          symptoms.remove('diarrhea');
                      },
                    );
                  },
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: Text(
                        "5. Nausea",
                        style: TextStyle(
                            color: Colors.deepOrange[500],
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Slider(
                  value: _nauseaSlider,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: _nauseaSlider.round().toString(),
                  activeColor: Colors.deepOrange[300],
                  inactiveColor: Colors.deepOrange[100],
                  onChanged: (double value) {
                    setState(
                      () {
                        _nauseaSlider = value;
                        if (value != 0)
                          symptoms['nausea'] = value;
                        else
                          symptoms.remove('nausea');
                      },
                    );
                  },
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: Text(
                        "6. Headache",
                        style: TextStyle(
                            color: Colors.deepOrange[500],
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Slider(
                  value: _headacheSlider,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: _headacheSlider.round().toString(),
                  activeColor: Colors.deepOrange[300],
                  inactiveColor: Colors.deepOrange[100],
                  onChanged: (double value) {
                    setState(
                      () {
                        _headacheSlider = value;
                        if (value != 0)
                          symptoms['headache'] = value;
                        else
                          symptoms.remove('headache');
                      },
                    );
                  },
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: Text(
                        "7. Fatigue",
                        style: TextStyle(
                            color: Colors.deepOrange[500],
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Slider(
                  value: _fatigueSlider,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: _fatigueSlider.round().toString(),
                  activeColor: Colors.deepOrange[300],
                  inactiveColor: Colors.deepOrange[100],
                  onChanged: (double value) {
                    setState(
                      () {
                        _fatigueSlider = value;
                        if (value != 0)
                          symptoms['fatigue'] = value;
                        else
                          symptoms.remove('fatigue');
                      },
                    );
                  },
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: Text(
                        "8. Loss of taste",
                        style: TextStyle(
                            color: Colors.deepOrange[500],
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Slider(
                  value: _tasteSlider,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: _tasteSlider.round().toString(),
                  activeColor: Colors.deepOrange[300],
                  inactiveColor: Colors.deepOrange[100],
                  onChanged: (double value) {
                    setState(
                      () {
                        _tasteSlider = value;
                        if (value != 0)
                          symptoms['taste'] = value;
                        else
                          symptoms.remove('taste');
                      },
                    );
                  },
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: Text(
                        "9. Loss of smell",
                        style: TextStyle(
                            color: Colors.deepOrange[500],
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Slider(
                  value: _smellSlider,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: _smellSlider.round().toString(),
                  activeColor: Colors.deepOrange[300],
                  inactiveColor: Colors.deepOrange[100],
                  onChanged: (double value) {
                    setState(
                      () {
                        _smellSlider = value;
                        if (value != 0)
                          symptoms['smell'] = value;
                        else
                          symptoms.remove('smell');
                      },
                    );
                  },
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: Text(
                        "10. Chest pain",
                        style: TextStyle(
                            color: Colors.deepOrange[500],
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Slider(
                  value: _chestPainSlider,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: _chestPainSlider.round().toString(),
                  activeColor: Colors.deepOrange[300],
                  inactiveColor: Colors.deepOrange[100],
                  onChanged: (double value) {
                    setState(
                      () {
                        _chestPainSlider = value;
                        if (value != 0)
                          symptoms['chestPain'] = value;
                        else
                          symptoms.remove('chestPain');
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.deepOrange[300],
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          //print(symptoms);
                          if (alreadySubmitted) {
                            showCupertinoDialog(
                                context: context,
                                builder: (_) => CupertinoAlertDialog(
                                      title: Text("Oops"),
                                      content: Text(
                                          "Already submitted form for today"),
                                      actions: [
                                        CupertinoDialogAction(
                                          //child: FlatButton(
                                          child: Text("Dismiss"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    ));
                          } else {
                            showCupertinoDialog(
                                context: context,
                                builder: (_) => CupertinoAlertDialog(
                                      title: Text("Confirm?"),
                                      content: Text(
                                          "Are you sure you want to submit the form?"),
                                      actions: [
                                        CupertinoDialogAction(
                                          //child: FlatButton(
                                          child: Text("Yes"),
                                          onPressed: () async {
                                            await submitForm(symptoms);
                                            Navigator.of(context).pop();
                                            showCupertinoDialog(
                                                context: context,
                                                builder: (_) =>
                                                    CupertinoAlertDialog(
                                                      title: Text("Success!"),
                                                      content: Text(
                                                          "Form submitted"),
                                                      actions: [
                                                        CupertinoDialogAction(
                                                          //child: FlatButton(
                                                          child:
                                                              Text("Dismiss"),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        )
                                                      ],
                                                    ));
                                          },
                                        ),
                                        CupertinoDialogAction(
                                          //child: FlatButton(
                                          child: Text("No"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    ));
                          }

                          setState(() {
                            alreadySubmitted = true;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(100.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
