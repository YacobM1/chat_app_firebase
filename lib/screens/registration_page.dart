import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  File? imageAvt;

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);

      setState(() {
        imageAvt = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Chat App',
              style: TextStyle(color: Colors.black, fontSize: 35),
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: getImage,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image:
                        imageAvt != null
                            ? FileImage(imageAvt!.absolute, scale: 0.5)
                            :  const NetworkImage(
                                'https://i.pinimg.com/280x280_RS/2e/45/66/2e4566fd829bcf9eb11ccdb5f252b02f.jpg') as ImageProvider,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'ID:2144',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  'Andrey Developer',
                  style: TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Container(
                    height: 50,
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Enter chat id',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Icon(
                          Icons.send,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


