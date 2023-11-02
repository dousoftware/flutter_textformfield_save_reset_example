import 'package:flutter/material.dart';

class TextFormFieldExample extends StatefulWidget {
  const TextFormFieldExample({super.key});

  @override
  State<TextFormFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFormFieldExample> {
  String email = '', sifre = '', kullaniciAdi = '';

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.multiline,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  hintText: 'Kullanıcı adı', border: OutlineInputBorder()),
              onSaved: (deger) {
                kullaniciAdi = deger!;
              },
              validator: (deger) {
                if (deger!.length < 4) {
                  return 'İşlem yapma';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  hintText: 'E-Mail', border: OutlineInputBorder()),
              onSaved: (deger) {
                email = deger!;
              },
              validator: (deger) {
                if (deger!.length < 4) {
                  return 'İşlem yapma';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Şifre', border: OutlineInputBorder()),
              onSaved: (deger) {
                sifre = deger!;
              },
              validator: (deger) {
                if (deger!.length < 4) {
                  return 'İşlem yapma';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                bool validate = formKey.currentState!.validate();
                if (validate) {
                  formKey.currentState!.save();

                  String result =
                      'username:$kullaniciAdi\nemail:$email\nSifre:$sifre';

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.orange.shade300,
                      content: Text(
                        result,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                  formKey.currentState!.reset();
                }
              },
              child: const Text('Onayla'),
            ),
          ],
        ),
      ),
    );
  }
}
