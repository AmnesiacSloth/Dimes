
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Dimes',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var passAttempts = <int>[]; // array to track a single players passing stats

  void newAttempt(rating) {
    passAttempts.add(rating);
    notifyListeners();
  }

  // TODO: add argument to select each player
  double passRating() {
    if (passAttempts.isEmpty) {
      return -1;
    }
    return (passAttempts.reduce((a,b) => a+b).toDouble())/passAttempts.length;
  }

  // TODO: add argument to select each player
  void undoLastAttempt() {
    if (passAttempts.isEmpty) {
      return;
    } else {
      passAttempts.removeLast();
    }
    notifyListeners();
  }

}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = Placeholder();
        break;
      default:
        throw UnimplementedError("No widget for $selectedIndex");
    }
    var deviceOrientation = MediaQuery.of(context).orientation;
    return LayoutBuilder(
      builder: (context,constraints) {
        bool isExtended = deviceOrientation == Orientation.landscape;
        return Scaffold(
          body: Row(
            children: [
              SizedBox(
                width: isExtended ? 150 : 72, // Extended in landscape, collapsed in portrait
                child: SafeArea( // ensures its children are not obscured by status bar or hardware notch
                  child: NavigationRail(
                    extended: isExtended, // shows labels next to the icons
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite),
                        label: Text('Favorites'),
                      ),
                    ],
                    selectedIndex: selectedIndex, // determines which destination to go to from nav rail
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

class GeneratorPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(5,(rating) {
                return Center(
                  child: passRating(rate: rating),
                );
              }),
            ),
          ),
        ],
      )
    );
  }
}


class passRating extends StatelessWidget {
  const passRating({
    super.key,
    required this.rate,
  });

  final int rate;

  @override
  Widget build(BuildContext context) {

    var appState = context.watch<MyAppState>();
    // TODO: implement build
    final theme = Theme.of(context);
    final style = theme.textTheme.displayLarge!.copyWith(color: theme.colorScheme.secondary);

    return Card(
      color: theme.colorScheme.primary,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: () {
          appState.newAttempt(rate);
        },
        child: Text("$rate",style: style,),
        ),
        ),
    );
  }

}