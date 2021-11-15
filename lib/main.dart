import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'TIG169 TODO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 25),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SecondView()));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(height: 30),
              _buildcheckbox('Read a book'),
              _divide(),
              _buildcheckbox('Do homework'),
              _divide(),
              _builddonecheckbox('Tidy room'),
              _divide(),
              _buildcheckbox('Watch Tv'),
              _divide(),
              _buildcheckbox('Nap'),
              _divide(),
              _buildcheckbox('Shop groceries'),
              _divide(),
              _buildcheckbox('Have fun'),
              _divide(),
              _buildcheckbox('Meditate'),
              _divide(),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildcheckbox(String text) {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (val) {},
        ),
        Text(text,
            style: const TextStyle(fontSize: 26), textAlign: TextAlign.left),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.clear),
        ),
      ],
    );
  }

  Widget _builddonecheckbox(String text) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (val) {},
        ),
        Text(text,
            style: const TextStyle(
                decoration: TextDecoration.lineThrough, fontSize: 26)),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.clear),
        ),
      ],
    );
  }

  Widget _divide() {
    return const Divider(
      height: 30,
      thickness: 1,
    );
  }
}

// Sida två

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TIG169 TODO',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 10,
            ),
            _textBox(),
            Container(
              height: 10,
            ),
            _addNew(),
          ],
        ),
      ),
    );
  }

  Widget _textBox() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.all(30.0),
      child: const TextField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3.0),
            ),
            labelText: "What are you going to do?"),
      ),
    );
  }

  Widget _addNew() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.add),
        Text('ADD',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
