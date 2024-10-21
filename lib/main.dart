import 'package:flutter/material.dart';
import 'ui/colors.dart';
import 'logic/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'NTV Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Customer> myList = getCustomers(); // Fetch the list of customers
  int itemsPerPage = 10; // Number of items to display per page
  int currentPage = 0; // Current page index

  // Function to get the current page's items
  List<Customer> get currentItems {
    int startIndex = currentPage * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;
    return myList.sublist(startIndex, endIndex > myList.length ? myList.length : endIndex);
  }

  void _incrementPage() {
    setState(() {
      if ((currentPage + 1) * itemsPerPage < myList.length) {
        currentPage++;
      }
    });
  }

  void _decrementPage() {
    setState(() {
      if (currentPage > 0) {
        currentPage--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: currentItems.length, // Show only the current page's items
              itemBuilder: (context, index) {
                final customer = currentItems[index]; // Get each customer
                return ListTile(
                  title: Text(customer.name), // Display customer name
                  subtitle: Text('Age: ${customer.age}'), // Display customer age
                  leading: Icon(Icons.person), // Optional icon
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _decrementPage, // Load previous page
                child: const Text('Previous'),
              ),
              ElevatedButton(
                onPressed: _incrementPage, // Load next page
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}