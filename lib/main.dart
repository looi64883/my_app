import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
  // Configure the route for handling the redirect with the 'code' parameter
  PathUrlStrategy();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lazada Authorization',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == '/callback') {
          // Extract the code from the URL query parameter and send it to the backend
          final Uri uri = Uri.parse(settings.arguments.toString());
          final String? code = uri.queryParameters['code'];

          if (code != null) {
            _sendCodeToBackend(code);
          }

          return MaterialPageRoute(
            builder: (_) => const CallbackPage(),
          );
        }

        return null;
      },
    );
  }

  // Function to send the code to the backend
  static Future<void> _sendCodeToBackend(String code) async {
    final response = await http.post(
      Uri.parse('https://your-backend.com/exchange-token'),
      body: {'code': code},
    );

    if (response.statusCode == 200) {
      // Handle success response, like storing the token
      print('Token exchange successful');
    } else {
      // Handle failure response
      print('Failed to exchange token');
    }
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Lazada Dashboard"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _launchURL(
              'https://auth.lazada.com/oauth/authorize?response_type=code&force_auth=true&redirect_uri=https://vemp.onrender.com/callback&client_id=131151',
            );
          },
          child: const Text('Login to Lazada'),
        ),
      ),
    );
  }
}

class CallbackPage extends StatelessWidget {
  const CallbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Callback"),
      ),
      body: const Center(
        child: Text('Authorization Code Captured'),
      ),
    );
  }
}
