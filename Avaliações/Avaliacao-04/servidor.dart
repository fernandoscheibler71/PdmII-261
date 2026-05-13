import 'dart:io';
import 'dart:convert';

void main() async {
  final server = await ServerSocket.bind(InternetAddress.anyIPv4, 4040);
  print('Servidor iniciado em ${server.address.address}:${server.port}');

  await for (Socket client in server) {
    print('Cliente conectado: ${client.remoteAddress.address}:${client.remotePort}');

    client.cast<List<int>>().transform(utf8.decoder).listen(
      (data) {
        print('Temperatura recebida: $data');
      },
      onDone: () {
        print('Cliente desconectado');
        client.close();
      },
      onError: (error) {
        print('Erro: $error');
        client.close();
      },
    );
  }
}