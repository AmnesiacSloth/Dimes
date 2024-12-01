import 'package:dimes/customWidgets.dart'; // my own widgets
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(24, 43, 73, 1),
        appBar: AppBar(
          title: Text(
            "Dimes",
            style: TextStyle(
                color: Colors.white, letterSpacing: 1.5, fontSize: 24),
          ),
          centerTitle: true,
          toolbarHeight: 30,
          forceMaterialTransparency: true, // Doesn't change color on scroll
        ),
        body: Center(
          child: Row(
            children: [
              ScrollablePlayerSelector(),
              GeneratedPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class GeneratedPage extends StatelessWidget {
  const GeneratedPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12), // TODO: REVISIT
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      PassRatings(),
                      SizedBox(height: 12),
                      CurrentStats(),
                      SizedBox(height: 12),
                      LifetimeStats(),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

// TODO: add control so its player numbers on portrait, names on landscape
class ScrollablePlayerSelector extends StatelessWidget {
  const ScrollablePlayerSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyling =
        Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Colors.white,
            );

    return Flexible(
      flex: 1,
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) => ListTile(
          minTileHeight: 50,
          title: Text(
            index.toString(),
            style: textStyling,
          ),
        ),
      ),
    );
  }
}
