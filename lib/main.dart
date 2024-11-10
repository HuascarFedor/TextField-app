import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  String _textValue = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _textValue = _controller.text;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ejemplo TextField'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    decoration:
                        const InputDecoration(labelText: 'Ingrese texto'),
                  )),
              const SizedBox(height: 20),
              Text('Texto ingresado: $_textValue'),
            ],
          ),
        ),
      ),
    );
  }
}
