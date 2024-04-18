import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

Uint8List? imagenuit;

class IngresoFirma extends StatelessWidget {
  IngresoFirma({super.key});
  final keySignaturePad = GlobalKey<SfSignaturePadState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text("Ingreso de Firma"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SfSignaturePad(
                key: keySignaturePad,
                backgroundColor: Colors.yellow.withOpacity(0.2),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () => onSubmit(context),
                      child: const Text('guardar')),
                  SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                      onPressed: () => onClear(), child: Text('borrar'))
                ],
              ),
              SizedBox(height: 50),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () => context.pop(),
                  child: Text("Volver")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () => context.push('/red'),
                  child: Text("Ir a la pagina roja")),
            ],
          ),
        ));
  }

  void onClear() {
    keySignaturePad.currentState?.clear(); // Borrar la firma actual
    // Restablecer la variable imageSignature a null si es necesario
  }

  Future<void> onSubmit(BuildContext context) async {
    try {
      final image = await keySignaturePad.currentState?.toImage();
      final imageSignature =
          await image!.toByteData(format: ImageByteFormat.png);

      // Process the image data as needed (e.g., save it, send it to a server, etc.)

      if (imageSignature != null) {
        Uint8List imagenuit = imageSignature.buffer.asUint8List();
        Image.memory(imagenuit);
        // Ahora 'uint8List' contiene los bytes de la imagen

        // Puedes usarlo según tus necesidades
      } else {
        // Maneja el caso en que 'byteData' sea nulo
        print("La variable ByteData es nula.");
      }

      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('¡Firma guardada correctamente!'),
          duration:
              Duration(seconds: 1), // Ajusta la duración según tu preferencia
        ),
      ); // Close the dialog
    } catch (error) {
      // Handle any errors that occur during the asynchronous operations
      print('Error: $error');
      // Optionally show an error message to the user
    }
  }
}
