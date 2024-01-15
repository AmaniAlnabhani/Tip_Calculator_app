import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final controller = TextEditingController();
   List<bool> _selection = [true, false, false];
  var   tip;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            if(tip != null)
               Padding(padding: const EdgeInsets.all(20),
               child: Text(
                tip,
                style: const TextStyle(fontSize: 30),
               ),),
             const Text('Total Amaount'),
            SizedBox(
              width: 70,
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(hintText: '\$100.00'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ToggleButtons(
                // ignore: sort_child_properties_last
                children: const [Text('10%'), Text('15%'), Text('20%')],
                isSelected: _selection,
                onPressed: updateSelection,
              ),
            ),
            TextButton(onPressed: CalculateTip,
             // ignore: sort_child_properties_last
             child:   Text('Calculate Tip'),
              style: TextButton.styleFrom(
                    foregroundColor: Colors.green,
                  ),
           )
          ]),
        ),
      ),
    );
  }

  void updateSelection(int selectionIndex) {
    setState(() {
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = selectionIndex == i;
      }
    });
  }
  void CalculateTip(){
    final totalAmount = double.parse(controller.text);
    final selectedIndex =_selection.indexWhere((element) => element);
    final tipPercentage =[0.1,0.15,0.2][selectedIndex];
    final tipTotal =(totalAmount * tipPercentage).toStringAsFixed(2);

   setState(() {
     tip ='\$ $tipTotal';
   });
  }
}
