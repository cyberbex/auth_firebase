import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
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

  Future _uploadImagem() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference pastaRaiz = storage.ref();
    Reference arquivo = pastaRaiz.child("fotos").child("fotos1.jpg");
    //fazer upload da imagem
    UploadTask task = arquivo.putFile(image!);

    /*  const path = "files/foto1";
    final file = File(image!.path);
    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('lkjlkj')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _recuperarImagem(true);
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
            ElevatedButton(
              onPressed: () {
                _uploadImagem();
              },
              child: const Text('Upload imagem fireStore'),
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
