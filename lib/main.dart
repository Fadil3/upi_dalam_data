import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    // button click
    SingleChildScrollView(
      child: Row(
        // center
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      SizedBox(
        width: 450,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:[
            Card(
            child:Column(
              children: [
                Image.network(
              'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
              fit: BoxFit.cover,
            ),
                ListTile(
                  title: const Text('Data Dosen'),
                  subtitle: Text('Penelitian, Pengabdian, dan Pengajaran',style: TextStyle(color: Colors.black.withOpacity(0.6)),),
                  leading: const Icon(Icons.supervisor_account_outlined),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children :[ TextButton.icon(
                    icon: const Text('Lihat'),
                    label: const Icon(Icons.arrow_forward_rounded),
                    onPressed: () {
                      /* ... */
                      },
                    ),
                  ]
                ),
              ],
            )
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
          ]
        ),
      ),
        ],
      ) 
    ),
    const Text(
      'Index 1: Contact',
      style: optionStyle,
    ),
    const Text(
      'Index 2: Setting',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal[400],
        onTap: _onItemTapped,
      ),
    );
  }
}
