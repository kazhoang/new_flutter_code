import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 40)),
              const Text('Bluetooth Mouse'),
              const Padding(padding: EdgeInsets.only(top: 40)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 40)),
              ElevatedButton(onPressed: () {}, child: const Text('Check'))
            ],
          ),
        ),
      ),
    );
  }
}
