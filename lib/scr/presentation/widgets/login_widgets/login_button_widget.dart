import 'package:flutter/material.dart';
import 'package:movies_app/scr/presentation/features/home/home_screen.dart';

class LoginButtonWidget extends StatefulWidget {
  const LoginButtonWidget({Key? key}) : super(key: key);

  @override
  State<LoginButtonWidget> createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ElevatedButton.styleFrom(fixedSize: const Size(120, 40), ),
      child: const Text(
        'Login',
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () {
        Navigator.push(
          //потом изменю на pushNamed как сделаю Home
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
    );
  }
}
