import 'package:flutter/material.dart';
 
void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}
 
class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}
 
class _State extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
              Container(
              child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/en/8/8a/Cotton_On_logo.png', height: 100, width: 300,),
                  
                              ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Welcome to Cotton On!',
                      style: TextStyle(
                          color: Colors.pinkAccent[400],
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  width: 400,
                  child: DropDownList(),
                ),
                /*Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Container(
                      child: DropdownButton<String>(
                          hint: Text('Gender'),
                          items: <String>['male','female','prefer not to say'].map((String gender){
                            return DropdownMenuItem<String>(
                              value:gender,
                              child: Text('$gender'),
                            );
                          }).toList(),
                          onChanged: (value){
                            setState(() {
                              value = value;
                              print(value);
                            });
                          },
                        ),
                    ),
                  ),
                ),*/
                Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ElevatedButton(
                      //textColor: Colors.white,
                      //color: Colors.pink,
                      child: Text('Sign Up'),
                      onPressed: () {
                        final snackBar = SnackBar (
                          content: const Text("Congratulations! You have sign up!"),
                          action: SnackBarAction(label: 'YAY', onPressed: () {

                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        print(nameController.text);
                        print(emailController.text);
                        print(passwordController.text);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pinkAccent[400],
                    )),
                )],
            )));
  }

}

class DropDownList extends StatefulWidget {

@override
_DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
var chosenGender;

@override
Widget build(BuildContext context) {
return DropdownButton<String>(
value: chosenGender,
icon: Icon(Icons.keyboard_arrow_down_rounded),
hint: Text('Select your gender'),
items: <String>[
'Male',
'Female',
'Other',
'Rather not to say'
].map<DropdownMenuItem<String>>((String value) {
return DropdownMenuItem<String>(
value: value,
child: Text(value),
);
}).toList(),
onChanged: (String? value) {
setState(() {
chosenGender = value;
print(value);
});
},
);
}

}