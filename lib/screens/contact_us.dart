// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cw2_941786/widgets/button_widget.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String message = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image(image: AssetImage('images/rect-light.png')),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Found a bug or have any questions?",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.teal,
                    )),
              )),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Leave us a message!",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.teal,
                    )),
              )),
              Form(
                key: formKey,
                //autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(16.0), child: buildUsername()),
                    const SizedBox(height: 16),
                    Padding(padding: EdgeInsets.all(16.0), child: buildEmail()),
                    const SizedBox(height: 32),
                    Padding(
                        padding: EdgeInsets.all(16.0),
                        child: buildMessageField()),
                    const SizedBox(height: 32),
                    buildSubmit(),
                  ],
                ),
              ),
            ]));
  }

  Widget buildUsername() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Your name',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your name';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => name = value!),
      );
  Widget buildMessageField() => TextFormField(
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          labelText: 'Your message',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your message';
          } else {
            return null;
          }
        },
        maxLength: 255,
        onSaved: (value) => setState(() => message = value!),
      );
  Widget buildEmail() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Your Email',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
          final regExp = RegExp(pattern);

          if (value!.isEmpty) {
            return 'Enter an email';
          } else if (!regExp.hasMatch(value)) {
            return 'Enter a valid email';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) => setState(() => email = value!),
      );
  Widget buildSubmit() => Builder(
        builder: (context) => ButtonWidget(
          text: 'Send us a message',
          onClicked: () {
            final isValid = formKey.currentState!.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              formKey.currentState!.save();

              final form_message =
                  'Your message has been sent! We will get back to you shortly!';
              final snackBar = SnackBar(
                content: Text(
                  form_message,
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              setState(() {
                email = "";
                name = "";
                message = "";
              });
              formKey.currentState!.reset();
            }
          },
        ),
      );
}
