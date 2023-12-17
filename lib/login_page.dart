import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _validateFields() {
    if (_formKey.currentState!.validate()) {
      // Navegar para a próxima tela
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, confira os campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 28, 78, 98),
            Color.fromARGB(255, 44, 150, 143),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _formLabel("Usuário"),
                    _formField(Icons.person, _loginController),
                    const SizedBox(height: 16),
                    _formLabel("Senha"),
                    _formField(Icons.lock, _passwordController,
                        isObscure: true),
                    const SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () => _validateFields(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 68, 189, 110),
                          fixedSize: const Size(150, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text('Entrar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  _launchUrl(Uri.parse('https://www.google.com.br/'));
                },
                child: const Text(
                  'Política de privacidade',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Não foi possível abrir a URL: $url');
  }
}

Widget _formLabel(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, bottom: 5),
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w100,
        fontSize: 15,
      ),
    ),
  );
}

Widget _formField(IconData icon, TextEditingController controller,
    {isObscure = false}) {
  return TextFormField(
    controller: controller,
    obscureText: isObscure,
    decoration: InputDecoration(
      errorStyle: const TextStyle(color: Colors.yellow),
      filled: true,
      fillColor: Colors.white,
      border: UnderlineInputBorder(borderRadius: BorderRadius.circular(5)),
      prefixIcon: Icon(icon),
      prefixIconColor: Colors.black,
    ),
    validator: (value) {
      if (!isObscure) {
        return usernameValidator(value!);
      } else {
        return passwordValidator(value!);
      }
    },
  );
}

usernameValidator(String username) {
  if (username.isEmpty) {
    return 'Campo vazio';
  } else if (username.length >= 20) {
    return 'Nome de usuário muito longo';
  } else if (username.endsWith(' ')) {
    return 'Espaço extra no final';
  }

  return null;
}

passwordValidator(String password) {
  if (password.isEmpty) {
    return 'Campo vazio';
  } else if (password.length >= 20) {
    return 'Senha muito longa';
  } else if (password.endsWith(' ')) {
    return 'Espaço extra no final';
  } else if (password.length < 2) {
    return 'A senha deve ter mais que 1 caractere';
  } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(password)) {
    return 'A senha não deve conter caracteres especiais';
  }
  return null;
}
