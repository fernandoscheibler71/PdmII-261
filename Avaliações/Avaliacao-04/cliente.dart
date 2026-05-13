import 'dart:io';
import 'dart:math';
import 'dart:async';

void main() async {
  final socket = await Socket.connect('127.0.0.1', 4040);
  print('Conectado ao servidor');

  final random = Random();

  Timer.periodic(Duration(seconds: 10), (timer) {
    double temperatura = 20 + random.nextDouble() * 15;
    String mensagem = temperatura.toStringAsFixed(2);

    print('Enviando: $mensagem °C');
    socket.write(mensagem + '\n');
  });
}