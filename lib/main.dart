import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({Key? key}) : super(key: key);

  final List<String> buttons = [
    'C', '', '', '/',
    '7', '8', '9', 'x',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', '', '', '='
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          // Natija ekrani
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(20),
              color: Colors.grey[400],
              child: const Text(
                '0',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Tugmalar
          Expanded(
            flex: 3,
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: buttons.length,
              itemBuilder: (context, index) {
                // "C" tugmasi: ikki ustun egallaydi
                if (buttons[index] == 'C') {
                  return GridTile(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        // Make the "C" button span two columns
                        fixedSize: const Size(180, 70),
                      ),
                      child: const Text(
                        'C',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                }
                // "0" tugmasi: ikki ustun egallaydi
                else if (buttons[index] == '0') {
                  return GridTile(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        '0',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                }
                // Bo'sh joylarni tashlab ketamiz
                else if (buttons[index].isEmpty) {
                  return const SizedBox.shrink();
                }
                // Oddiy tugmalar
                else {
                  return ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttons[index] == '='
                          ? Colors.green
                          : Colors.grey,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      buttons[index],
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
