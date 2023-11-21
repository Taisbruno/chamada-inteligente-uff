// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/roll/presence/presence_service.dart';
import 'package:flutter_app/utils/Toast.dart';
import 'package:flutter_app/widgets/shared/loading.dart';
import 'package:http/http.dart';

class MissedClassDialog extends StatefulWidget {
  final String registration;
  final String rollId;
  final dynamic refetch;

  const MissedClassDialog(
      {super.key,
      required this.registration,
      required this.rollId,
      this.refetch});

  @override
  State<StatefulWidget> createState() => _MissedClassDialogState();
}

class _MissedClassDialogState extends State<MissedClassDialog> {
  PlatformFile? file;
  bool fileSent = false;
  TextEditingController textEditingController = TextEditingController();
  bool isLoading = false;

  void updateLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.file_present_outlined,
            size: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Justificar falta",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          getButton(),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: TextField(
              controller: textEditingController,
              maxLines: 3,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              maxLength: 100,
              decoration: InputDecoration(
                  hintText: 'Justifique sua falta... (Opcional)',
                  hintStyle: TextStyle(fontSize: 14)),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          if (isLoading) circularLoading(),
          const SizedBox(
            height: 5,
          ),
          sendButton(context),
        ],
      ),
    );
  }

  Widget getButton() {
    if (fileSent) {
      return ElevatedButton(
          onPressed: () async {},
          style: ElevatedButton.styleFrom(minimumSize: Size(115, 30)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Text(
              'Visualizar\nAtestado',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ));
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: Size(115, 30)),
      onPressed: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg'],
            withData: true);

        if (result != null) {
          fileSent = true;
          file = result.files.first;
        }
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(
          'Anexar Atestado',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget sendButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      onPressed: () async {
        if (file != null && fileSent) {
          String base64File = base64Encode(file!.bytes!);
          updateLoading(true);

          Response response = await createPresenceWithCertificate(
              widget.registration,
              widget.rollId,
              file!.name.toLowerCase(),
              base64File,
              textEditingController.text);

          if (response.statusCode == 200) {
            showToast(context, "Justificativa encaminhada com sucesso", 'OK');
            await widget.refetch();
            Navigator.of(context).pop();
            updateLoading(false);
          } else {
            showToast(context, "Não foi possível enviar", 'OK');
            updateLoading(false);
          }
        } else {
          showToast(context, "Anexe um arquivo antes de justificar", 'OK');
        }
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Text(
          'Enviar',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
