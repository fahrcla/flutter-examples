import 'package:provider/provider.dart';
import 'calculProvider.dart';
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
        title: 'Km To Miles Provider',
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
        home: ChangeNotifierProvider(
          create: (_) => CalculProvider(compteur: 0, km: 0, miles: 0),
          child: MyHomePage(title: 'Flutter Provider'),
        )
        // home: const MyHomePage(title: 'Km to miles converter'),
        );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final myController = TextEditingController();
  final myControllerMiles = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final compteurProvider = Provider.of<CalculProvider>(context);
    void milestokm() {
      compteurProvider.btn_milestokm(double.parse(myControllerMiles.text));
      myController.text = compteurProvider.km.toString();
    }

    void kmtomiles() {
      compteurProvider.btn_kmTomiles(double.parse(myController.text));
      myControllerMiles.text = compteurProvider.miles.toString();
      //     _compteurProvider.btn_kmTomiles(double.parse(myController.text));
    }

    void efface() {
      myController.text = '';
      myControllerMiles.text = '';
    }

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
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
                       myControllerMiles.text =
                          ((1 / 1.60934) * double.parse(text)).toString();
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'km',
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    '${compteurProvider.km}',
                  ),
                ),
                ElevatedButton(onPressed: kmtomiles, child: const Text('KmtoMiles')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 50,
                  child: Text(
                    'Miles:' ,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: myControllerMiles,
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      /*fct()*/ myController.text =
                          (1.60934 * double.parse(text)).toString();
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Miles',
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    '${compteurProvider.miles}',
                  ),
                ),
                ElevatedButton(onPressed: milestokm, child: const Text('MilestoKm')),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: efface,
        tooltip: 'Increment',
        child: const Icon(Icons.delete),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
