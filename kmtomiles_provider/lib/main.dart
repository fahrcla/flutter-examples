import 'package:provider/provider.dart';
import 'calculprovider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Km To Miles Provider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => CalculProvider( km: 0, miles: 0),
        child: MyHomePage(title: 'Flutter Provider'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final myController = TextEditingController();
  final myControllerMiles = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final compteurProvider = Provider.of<CalculProvider>(context);

    void milestokm() {
      try {
        compteurProvider.btn_milestokm(double.parse(myControllerMiles.text));
        myController.text = compteurProvider.km.toString();
      } catch (e) {
        myController.text = 'Error';
      }
    }

    void kmtomiles() {
      try {
        compteurProvider.btn_kmtomiles(double.parse(myController.text));
        myControllerMiles.text = compteurProvider.miles.toString();
      } catch (e) {
        myControllerMiles.text = 'Error';
      }
    }

    void efface() {
      compteurProvider.btn_milestokm(0);
        myController.text = compteurProvider.km.toString();
      compteurProvider.btn_kmtomiles(0);
      myControllerMiles.text = compteurProvider.miles.toString();
      myController.text = '';
      myControllerMiles.text = '';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 50,
                  child: Text('Km:'),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: myController,
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      if (text.isNotEmpty) {
                        myControllerMiles.text =
                            ((1 / 1.60934) * double.parse(text)).toString();
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'km',
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Text('${compteurProvider.km}'),
                ),
                ElevatedButton(onPressed: kmtomiles, child: const Text('Km to Miles')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 50,
                  child: Text('Miles:'),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: myControllerMiles,
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      if (text.isNotEmpty) {
                        myController.text =
                            (1.60934 * double.parse(text)).toString();
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Miles',
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Text('${compteurProvider.miles}'),
                ),
                ElevatedButton(onPressed: milestokm, child: const Text('Miles to Km')),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: efface,
        tooltip: 'Clear',
        child: const Icon(Icons.delete),
      ),
    );
  }
}
