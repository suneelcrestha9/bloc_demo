import 'package:demo/ui/dress.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
      BottomNavigationBarItem(
        label: "About",
        icon: Icon(Icons.portable_wifi_off_outlined),
      ),
      BottomNavigationBarItem(label: "Setting", icon: Icon(Icons.settings)),
    ];
    return Scaffold(
      body: currentIndex == 0
          ? Dress()
          : currentIndex == 1
          ? About()
          : Setting(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.red,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: items,
      ),
    );
  }
}

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Setting"));
  }
}

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("About"));
  }
}
