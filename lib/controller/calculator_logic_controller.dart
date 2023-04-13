class DisplayController {
  String _valueClicked = '0';
  int _bufferIndex = 0;
  String? _operation;
  final _buffer = [0.0, 0.0];
  bool _clearValue = false;

  static const operations = ["+", "-", "*", "/", "%", '='];

  void handleCommand(String command) {
    switch (command) {
      case 'AC':
        _clearAll();
        break;
      case '%':
      case '/':
      case 'x':
      case '+':
      case '-':
      case '=':
        _calculateOperation(command);
        break;
      default:
        _updateValueAndBuffer(command);
    }
  }

  _clearAll() {
    _valueClicked = '0';
    _buffer.fillRange(0, 2, 0.0);
  }

  void showMessageError(String message) {
    _valueClicked = message;
  }

  _calculateOperation(String newOperation) {
    bool isEqualPressed = _isEqualPressed(newOperation);
    if (_bufferIndex == 0 && !isEqualPressed) {
      _operation = newOperation;
      _bufferIndex = 1;
      _clearValue = true;
    } else {
      if (_operation == '/' && _buffer[1] == 0) {
        showMessageError('Error');
        return;
      }
      _updateValuesAfterCalculation(newOperation);
    }
    _clearValue = true;
  }

  _operationsCalculator() {
    switch (_operation) {
      case '+':
        return _buffer[0] + _buffer[1];
      case '/':
        return _buffer[1] == 0 ? null : _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '%':
        return _buffer[0] % _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      default:
        return _buffer[0];
    }
  }

  void _updateValueAndBuffer(String value) {
    bool isDecimalPoint = value == '.';
    bool shouldClearValue = false;

    if (_valueClicked == '0' && !isDecimalPoint || _clearValue) {
      shouldClearValue = true;
    }

    if (value == '.' && _valueClicked.contains('.') && !shouldClearValue) {
      return;
    }

    if (shouldClearValue) {
      _valueClicked = isDecimalPoint ? '0.' : value;
    } else {
      _valueClicked += value;
    }

    _clearValue = false;

    _buffer[_bufferIndex] = double.tryParse(_valueClicked)!;
  }

  _updateValuesAfterCalculation(String newOperation) {
    bool isEqualPressed = _isEqualPressed(newOperation);
    _buffer[0] = _operationsCalculator();
    _buffer[1] = 0.0;
    _valueClicked = _buffer[0].toStringAsFixed(2);

    if (_valueClicked.endsWith('.00')) {
      _valueClicked = _valueClicked.substring(0, _valueClicked.length - 3);
    }

    _operation = isEqualPressed ? null : newOperation;
    _bufferIndex = isEqualPressed ? 0 : 1;
  }

  _isEqualPressed(String newOperation) {
    return newOperation == '=';
  }

  String get value {
    return _valueClicked;
  }
}
