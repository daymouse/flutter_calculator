import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';
import 'package:provider/provider.dart';
import 'providerhis.dart';


class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String input = '';
  String result = '0';

  void onButtonPressed(String value) {
    setState(() {
      if (value == '=') {
         try {
            final expression = Expression.parse(input);
            final evaluator = const ExpressionEvaluator();
            var evalResult = evaluator.eval(expression, {});
            result = evalResult.toString();

            if (RegExp(r'[\+\-\*/]').hasMatch(input)) {
              Provider.of<HistoryProvider>(context, listen: false)
                  .addHistory('$input = $result');
            }
          } catch (e) {
            result = 'Error';
          }
      } else if (value == 'C') {
        input = '';
        result = '0';
      } else {
        input += value;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
  backgroundColor: const Color.fromARGB(255, 255, 254, 254),
  body: Padding(
    padding: const EdgeInsets.only(top: 16, bottom: 16),
    child: Center(
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 51, 47, 47),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Display Input & Result
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 62, 60, 212),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    input.isEmpty ? result : input,
                    style: const TextStyle(fontSize: 36, color: Colors.white),
                  ),
                  Text(
                    result,
                    style: const TextStyle(
                      fontSize: 36,
                      color: Color.fromARGB(255, 15, 214, 22),
                    ),
                  ),
                ],
              ),
            ),

            // Buttons
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.2,
                ),
                itemCount: buttons.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () => onButtonPressed(buttons[index]),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      buttons[index],
                      style: TextStyle(
                        fontSize: 24,
                        color: index >= buttons.length - 4
                            ? Colors.orange
                            : Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  ),
  );


  }
}

const List<String> buttons = [
  '7', '8', '9', '/',
  '4', '5', '6', '*',
  '1', '2', '3', '-',
  'C', '0', '=', '+',
];
