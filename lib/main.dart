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
    '7', '8', '9', 'x',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
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
          const SizedBox(height: 10),
          // "C" tugmasi uchun maxsus qator
          Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                flex: 3, // "C" tugmasi uch ustun egallaydi
                child: Container(
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      'C',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10), // Tugmalar orasida bo'sh joy
              Expanded(
                flex: 1, // "/" tugmasi uchun bitta ustun
                child: Container(
                  height: 100,
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
                      '/',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          // Qolgan tugmalar GridView ichida
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
                // Bo'sh joylarni tashlab ketamiz
                if (buttons[index].isEmpty) {
                  return const SizedBox.shrink();
                }
                // Oddiy tugmalar
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
              },
            ),
          ),
          // "0" tugmasi uchun maxsus qator (GridView tagida joylashgan)
          Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                flex: 3, // "0" tugmasi uch ustun egallaydi
                child: Container(
                  height: 100,
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
                ),
              ),
              const SizedBox(width: 10), // Tugmalar orasida bo'sh joy
              Expanded(
                flex: 1, // "=" tugmasi uchun bitta ustun
                child: Container(
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      '=',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],

          ),
          const SizedBox(height: 300),
        ],
      ),
    );
  }
}