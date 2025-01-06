import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Km To Miles',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Km to miles converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double _counter = 0;
  final myController = TextEditingController();
  final myControllerMiles = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    myControllerMiles.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //  myController.addListener(() {btn_kmTomiles();});
    //  myControllerMiles.addListener(() {btn2();});
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      // _counter = 2 * double.parse(myController.text);
      //myControllerMiles.text = _counter.toString();
      myController.clear();
      myControllerMiles.clear();
    });
  }

  void btn_kmtomiles() {
    setState(() {
      //   myController.removeListener(() {btn2();});
      //
      myControllerMiles.text =
          (1.60934 * double.parse(myController.text)).toString();
      //  myControllerMiles.addListener(() {btn2();});
    });
  }

  void btn2() {
    setState(() {
      myController.text =
          ((1 / 1.60934) * double.parse(myControllerMiles.text)).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //  Container(
            //
            // child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 50,
                  child: Text(
                    'Km:',
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: myController,
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      btn_kmtomiles();
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'km',
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: btn_kmtomiles, child: const Text('KmtoMiles')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 50,
                  child: Text(
                    'Miles:',
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: myControllerMiles,
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      btn2();
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Miles',
                    ),
                  ),
                ),
                ElevatedButton(onPressed: btn2, child: const Text('MilestoKm')),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.delete),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
