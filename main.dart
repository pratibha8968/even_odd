import 'package:flutter/material.dart';

void main() => runApp(Numbers());

class Numbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text("Odd Even Switch"),
          ),
          body: Center(
              child: SwitchScreen()
          ),
        )
    );
  }
}
class SwitchScreen extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;
  Widget textValue = _evenList(items: List<String>.generate(100, (i) => 'Item $i'));

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        textValue = _evenList(items: List<String>.generate(100, (i) => 'Item $i'));
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitched = false;
        textValue = _oddList(items: List<String>.generate(100, (i) => 'Item $i' )
        );});
      print('Switch Button is OFF');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[ Transform.scale(
            scale: 2,
            child: Switch(
              onChanged: toggleSwitch,
              value: isSwitched,
              activeColor: Colors.blue,
              activeTrackColor: Colors.yellow,
              inactiveThumbColor: Colors.redAccent,
              inactiveTrackColor: Colors.orange,
            )
        ),
          // Text('$textValue', style: TextStyle(fontSize: 20),)
          Expanded(
            child: Container(
                child: textValue),
          ),

        ]);
  }
}
Widget _evenList({required List<String> items}
    ) {
  return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        if (index % 2 == 0) {
          return Container(
            child: Text('$index', style: TextStyle(fontSize: 30),),);
        }
        {
          return Text("");
        }
      }
  );
}
Widget _oddList({required List<String> items}
    ){
  return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {

        if (index % 2 != 0) {
          return Container(child: Text('$index', style: TextStyle(fontSize: 30),),);
        }{
          return Text("");}
      }
  );
}