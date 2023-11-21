import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

Widget MissedClass(BuildContext context, bool fileSent) {
  return Column(mainAxisSize: MainAxisSize.min,
    children: [getOption(fileSent),
    TextField(
        maxLines: 3,
        keyboardType: TextInputType.multiline,
        maxLength: 100,
        decoration: InputDecoration(
          hintText: 'Justifique sua falta...',
        ),
      ),
      sendButton(context, fileSent),
    ],
  );
}

Widget getOption(bool fileSent) {
  if (fileSent) {
    return ElevatedButton(
      onPressed: () async {
        //fazer a logica para puxar e visualizar o arquivo do BD
      },
      style: ElevatedButton.styleFrom(minimumSize: Size(115, 30)),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Text(
          'Visualizar\nAtestado',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      )
    );   
  }

  return ElevatedButton(
    style: ElevatedButton.styleFrom(minimumSize: Size(115, 30)),
    onPressed: () async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf','png', 'jpg', 'jpeg'],
      );

      if(result != null) {
        fileSent = true;
        //fazer a logica para enviar o arquivo para o BD

        PlatformFile file = result.files.first;
        print(file.name);
        print(file.bytes);
        print(file.size);
        print(file.extension);
      } else {
        //Caso o usuario feche a aba de selecionar arquivos
      }
    },
    child: const Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Text(
        'Anexar\nAtestado',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget sendButton(BuildContext context, bool fileSent) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(minimumSize: Size(115, 30)),
    onPressed: () async {
      //fazer a logica para enviar o arquivo para o BD
    },
    child: const Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Text(
        'Enviar',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    ),
  );
}