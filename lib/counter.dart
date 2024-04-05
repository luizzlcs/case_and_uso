import 'package:case_and_uso/person.dart';
import 'package:signals/signals.dart';

class Counter {
  final Signal _lastName = signal('');

  Signal get lastName => _lastName;
  final Signal _number = signal<int>(0);

  Signal get number => _number;

  void increment() {
    _number.value++;
  }

  void clearCounter() => _number.value = 0;

  var person = Person(name: 'Luiz', lastName: 'Silva');

  updateLastName(String lastName) {
    final name = lastName;
    _lastName.value = name;
  }

  fullName() => computed(() {
        var stringName = _lastName.value == '' ? person.lastName : _lastName;
        return '${person.name} $stringName';
      });
}
