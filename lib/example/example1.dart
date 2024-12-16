import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web-App Like Dashboard',
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

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NavigationContainer(),
    );
  }
}

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({super.key});

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const SalesPage(),
    const InventoryPage(),
    const OrderPage(),
    const PaymentPage(),
    const AnalyticsPage(),
  ];

  final List<String> _pageTitles = [
    "Sales",
    "Inventory",
    "Order",
    "Payment",
    "Analytics",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Side Navigation Bar
        NavigationRail(
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          labelType: NavigationRailLabelType.all,
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.bar_chart),
              label: Text('Sales'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.inventory),
              label: Text('Inventory'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.shopping_cart),
              label: Text('Order'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.payment),
              label: Text('Payment'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.analytics),
              label: Text('Analytics'),
            ),
          ],
        ),
        // Main Page Content
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              title: Text(_pageTitles[_selectedIndex]),
              actions: [
                // Link Store Dropdown
                PopupMenuButton<String>(
                  icon: const Icon(Icons.store),
                  onSelected: (value) {
                    // Handle link store actions
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem(
                          value: "tiktok", child: Text("Tik Tok")),
                      const PopupMenuItem(
                          value: "lazada", child: Text("Lazada")),
                      const PopupMenuItem(
                          value: "shopee", child: Text("Shopee")),
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
                          value: "switch_company",
                          child: Text("Switch Company")),
                      const PopupMenuItem(
                          value: "manage_company",
                          child: Text("Manage Company")),
                      const PopupMenuItem(
                          value: "help_center", child: Text("Help Center")),
                      const PopupMenuItem(
                          value: "logout", child: Text("Logout")),
                    ];
                  },
                ),
              ],
            ),
            body: _pages[_selectedIndex],
          ),
        ),
      ],
    );
  }
}

// Pages for each tab
class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Sales Page Content",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Inventory Page Content",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Order Page Content",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Payment Page Content",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Analytics Page Content",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
