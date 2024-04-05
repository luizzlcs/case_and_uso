import 'package:case_and_uso/counter.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final counter = Counter();
  bool element = true;

  void listen() {
    effect(() {
      untracked(() => setState(() {
            if (counter.number.value >= 10) {
              element = false;
            } else {
              element = true;
            }
            print(element);
          }));
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    counter.updateLastName('Carlo');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Watch(
              (context) => Text('${counter.number}'),
            ),
            const SizedBox(
              width: 10,
            ),
            Watch((context) => Text(counter.fullName().toString())),
            const SizedBox(
              height: 32,
            ),
            Watch(
              (context) => Visibility(
                visible: element,
                replacement: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(22)),
                ),
                child: const Text('Não há nada para ser visto aqui!'),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              counter.clearCounter();
              listen();
            },
            child: const Icon(
              Icons.clear_outlined,
              color: Colors.red,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              counter.increment();
              listen();
            },
            child: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
    );
  }
}
