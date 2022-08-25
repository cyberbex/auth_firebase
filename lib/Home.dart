import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  XFile? imagem;
  File? image;

  Future<void> _recuperarImagem(bool daCamera) async {
    final ImagePicker picker = ImagePicker();
    XFile? imagemSelecionada;
    if (daCamera) {
      imagemSelecionada = await picker.pickImage(source: ImageSource.camera);
    } else {
      imagemSelecionada = await picker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      if (imagemSelecionada != null) {
        image = File(imagemSelecionada.path);
      }
    });
  }

  /*  Future<void> _pickImage() async {
    if (kIsWeb) {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = XFile(image.path);
        setState(() {
          imagem = selected;
        });
      }
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('lkjlkj')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                //_recuperarImagem(true);
              },
              child: const Text('Camera'),
            ),
            ElevatedButton(
              onPressed: () {
                _recuperarImagem(false);
                //_pickImage();
              },
              child: const Text('Galeria'),
            ),
            image == null
                ? Container()
                : Image.file(
                    image!,
                    height: 200,
                    width: 200,
                  ),
          ],
        ),
      ),
    );
  }
}
