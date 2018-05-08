import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());
enum SingingCharacter { lafayette, jefferson }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(title: 'Personal Profile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _colors = <String>['', 'Hindu', 'Christian', 'Muslim'];
  List<String> _countries = <String>[
    '',
    'Singapore',
    'India',
    'America',
    'Europe'
  ];
  List<String> _languages = <String>[
    '',
    'Telugu',
    'Hindi',
    'Tamil',
    'Malayalam'
  ];
  List<String> _statuses = <String>['', 'Single', 'Married', 'Divorced'];
  List<String> _fathers = <String>['', 'Employed', 'Unemployed', 'Bussiness'];
  List<String> _mothers = <String>[
    '',
    'Employed',
    'Unemployed',
    'Bussiness',
    'Home Maker'
  ];
  List<String> _states = <String>['', 'Chennai', 'Mumbai', 'Delhi'];
  List<String> _districts = <String>['', 'Tamilnadu', 'Madurai', 'Vellore'];

  String dropdownValue;
  String _color = '';
  String _language = '';
  String _country = '';
  String _status = '';
  String _father = '';
  String _mother = '';
  String _state = '';
  String _district = '';
  SingingCharacter _character = SingingCharacter.lafayette;
  int radioValue = 0;

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new SafeArea(
            top: false,
            bottom: false,
            child: new Form(
                key: _formKey,
                autovalidate: true,
                child: new ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: <Widget>[
                      new Text(
                        'Sign Up!!',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.person),
                          hintText: 'Enter your first name',
                          labelText: 'First Name',
                        ),
                      ),
                      new TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.person),
                          hintText: 'Enter your last name',
                          labelText: 'Last Name',
                        ),
                      ),
                      new ListTile(
                        leading: new Icon(Icons.wc),
                        title: new Text('Gender', textScaleFactor: 1.5),
                        dense: true,
                      ),
                      new RadioListTile<SingingCharacter>(
                        title: const Text('Male'),
                        value: SingingCharacter.lafayette,
                        groupValue: _character,
                        onChanged: (SingingCharacter value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      new RadioListTile<SingingCharacter>(
                        title: const Text('Female'),
                        value: SingingCharacter.jefferson,
                        groupValue: _character,
                        onChanged: (SingingCharacter value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      new Divider(),
                      new TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.calendar_today),
                          hintText: 'Enter your date of birth',
                          labelText: 'Date of Birth',
                        ),
                        keyboardType: TextInputType.datetime,
                      ),
                      new TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.phone),
                          hintText: 'Enter a phone number',
                          labelText: 'Phone',
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                        ],
                      ),
                      new TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.email),
                          hintText: 'Enter a email address',
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      new InputDecorator(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.add_box),
                          labelText: 'Country',
                        ),
                        isEmpty: _country == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            value: _country,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _country = newValue;
                              });
                            },
                            items: _countries.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      new InputDecorator(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.add_box),
                          labelText: 'Mother Tongue',
                        ),
                        isEmpty: _language == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            value: _language,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _language = newValue;
                              });
                            },
                            items: _languages.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      new InputDecorator(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.add_box),
                          labelText: 'Marital Status',
                        ),
                        isEmpty: _status == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            value: _status,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _status = newValue;
                              });
                            },
                            items: _statuses.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      new InputDecorator(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.color_lens),
                          labelText: 'Religion',
                        ),
                        isEmpty: _color == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            value: _color,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _color = newValue;
                              });
                            },
                            items: _colors.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      new Divider(
                        height: 50.0,
                        color: Colors.blue,
                      ),
                      new Text(
                        'Family Details!!',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.person),
                          hintText: 'Enter your fathers name',
                          labelText: 'Father Name',
                        ),
                      ),
                      new InputDecorator(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.add_box),
                          labelText: 'Father Status',
                        ),
                        isEmpty: _father == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            value: _father,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _father = newValue;
                              });
                            },
                            items: _fathers.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      new TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.person),
                          hintText: 'Enter your mothers name',
                          labelText: 'Mother Name',
                        ),
                      ),
                      new InputDecorator(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.add_box),
                          labelText: 'Mother Status',
                        ),
                        isEmpty: _mother == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            value: _mother,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _mother = newValue;
                              });
                            },
                            items: _mothers.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      new InputDecorator(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.add_box),
                          labelText: 'Country',
                        ),
                        isEmpty: _country == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            value: _country,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _country = newValue;
                              });
                            },
                            items: _countries.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      new InputDecorator(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.add_box),
                          labelText: 'State',
                        ),
                        isEmpty: _state == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            value: _state,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _state = newValue;
                              });
                            },
                            items: _states.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      new InputDecorator(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.add_box),
                          labelText: 'District',
                        ),
                        isEmpty: _district == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            value: _district,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _district = newValue;
                              });
                            },
                            items: _districts.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      new Divider(
                        height: 50.0,
                        color: Colors.blue,
                      ),
                      new Text(
                        'Contact Details!!',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.phone),
                          hintText: 'Enter a phone number',
                          labelText: 'Phone',
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                        ],
                      ),
                      new Container(
                          padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                          child: new RaisedButton(
                            child: const Text('Submit'),
                            onPressed: () => null,
                            color: Colors.red,
                          ))
                    ]))));
  }
}
