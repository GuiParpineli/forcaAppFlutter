import 'package:flutter/material.dart';
import 'package:forca/routes/home_route.dart';
import 'package:forca/shared_preferences/app_preferences.dart';

class WelcomeRoute extends StatefulWidget {
  const WelcomeRoute({super.key});

  @override
  _WelcomeRouteState createState() => _WelcomeRouteState();
}

class _WelcomeRouteState extends State<WelcomeRoute> {
  bool _checkBoxIsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Bem-Vindo',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Text(
                      'Marcar como lido',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Checkbox(
                      value: _checkBoxIsChecked,
                      onChanged: (status) {
                        setState(() {
                          _checkBoxIsChecked = status!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    AppPreferences.setWelcomeRead(status: _checkBoxIsChecked);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeRoute()),
                    );
                  },
                  child: const Text(
                    'Avançar',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
