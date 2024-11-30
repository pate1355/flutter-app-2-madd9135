import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  ContactPageState createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name, _email, _message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter your name',
                  labelText: 'Name',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Name is required' : null,
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'Enter your email',
                  labelText: 'Email',
                ),
                validator: (value) => value!.isEmpty || !value.contains('@')
                    ? 'Invalid email'
                    : null,
                onSaved: (value) => _email = value!,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.message),
                  hintText: 'Enter your message',
                  labelText: 'Message',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Message is required' : null,
                onSaved: (value) => _message = value!,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                textInputAction: TextInputAction.done,
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Process the form
                        print('Name: $_name');
                        print('Email: $_email');
                        print('Message: $_message');

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Center(child: Text('Form submitted')),
                          ),
                        );
                      }
                    },
                    child: const Text('Submit')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
