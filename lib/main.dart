import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // Function to launch URLs
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
        title: const Text("SQL Dashboard"),
        actions: [
          // Link Store Dropdown
          PopupMenuButton<String>(
            icon: const Icon(Icons.link),
            onSelected: (value) {
              // Handle link store actions
              if (value == "lazada") {
                // Open Lazada URL
                _launchURL(
                  'https://auth.lazada.com/oauth/authorize?response_type=code&force_auth=true&redirect_uri=https://vemp.onrender.com/&client_id=131151',
                );
              } else if (value == "shopee") {
                // Handle Shopee logic if needed
              } else if (value == "tiktok") {
                // Handle TikTok logic if needed
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(value: "shopee", child: Text("Shopee")),
                const PopupMenuItem(value: "lazada", child: Text("Lazada")),
                const PopupMenuItem(value: "tiktok", child: Text("TikTok")),
              ];
            },
          ),
          // User Profile Dropdown
          PopupMenuButton<String>(
            icon: const Icon(Icons.person),
            onSelected: (value) {
              // Handle user profile actions
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                    value: "profile", child: Text("Manage Profile")),
                const PopupMenuItem(
                    value: "switch_company", child: Text("Switch Company")),
                const PopupMenuItem(
                    value: "manage_company", child: Text("Manage Company")),
                const PopupMenuItem(
                    value: "help_center", child: Text("Help Center")),
                const PopupMenuItem(value: "logout", child: Text("Logout")),
              ];
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text("Sales"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SalesPage()),
                );
              },
            ),
            ListTile(
              title: const Text("Inventory"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InventoryPage()),
                );
              },
            ),
            ListTile(
              title: const Text("Order"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrderPage()),
                );
              },
            ),
            ListTile(
              title: const Text("Payment"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentPage()),
                );
              },
            ),
            ListTile(
              title: const Text("Analytics"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnalyticsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Welcome back, Username",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text("Sales"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SalesPage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Inventory"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InventoryPage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Order"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderPage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Payment"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentPage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Analytics"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnalyticsPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sales"),
      ),
      body: const Center(
        child: Text(
          "Sales Page Content",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventory"),
      ),
      body: const Center(
        child: Text(
          "Inventory Page Content",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
      ),
      body: const Center(
        child: Text(
          "Order Page Content",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
      ),
      body: const Center(
        child: Text(
          "Payment Page Content",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analytics"),
      ),
      body: const Center(
        child: Text(
          "Analytics Page Content",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
