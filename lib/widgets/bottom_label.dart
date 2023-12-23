import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomLabel extends StatelessWidget {
  const BottomLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchUrl(Uri.parse('https://www.google.com.br/'), context);
      },
      child: const Text(
        'Política de privacidade',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

Future<void> _launchUrl(Uri url, context) async {
  if (!await launchUrl(url)) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Não foi possível abrir a URL')),
    );
    throw Exception('Não foi possível abrir a URL: $url');
  }
}
