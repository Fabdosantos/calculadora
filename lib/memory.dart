class Memory {
  static const operations = ['%', '÷', '+', '-', 'x', '='];
  late String? _operation;
  bool _usedOperation = false;
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;

  String result = '0';

  Memory() {
    _clear();
  }

  void _clear() {
    result = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _operation = null;
    _usedOperation = false;
  }

  void applyCommand(String command) {
    if (command == 'AC') {
      _clear();
    } else if (command == '+/-') {
      reverseSignalDigit();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }
  }

  void reverseSignalDigit() {
    result = result * -1;
  }

  void _addDigit(String digit) {
    if (_usedOperation) result = '0';

    if (result.contains('.') && digit == '.') digit = '';
    if (result == '0' && digit != '.') result = '';

    result += digit;

    // adiciona a funcionalidade de usar vírgula invés de ponto
    if (result.endsWith(',')) result = result.replaceAll(',', '.');

    _buffer[_bufferIndex] = double.parse(result);
    _usedOperation = false;
  }

  void _setOperation(String operation) {
    print(_buffer);
    print('operation: $operation');
    print('_operation: $_operation');
    if (_usedOperation && operation == _operation) return;

    if (_bufferIndex == 0) {
      _bufferIndex = 1;
    } else {
      if (_buffer[1] == 0.0) {
        _operation = operation;
        return;
      }
      _buffer[0] = _calculate();
      _buffer[1] = 0.0;
    }

    _operation = operation;
    print('final: $_buffer');

    if (operation == '=') {
      _operation = null;
      _bufferIndex = 0;
    }

    print('oi');
    result = _buffer[0].toString();
    result = result.endsWith('.0') ? result.split('.')[0] : result;

    print(_bufferIndex);
    _usedOperation = true;
  }

  double _calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '÷':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      default:
        return 0.0;
    }
  }
}
