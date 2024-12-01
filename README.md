# dimes

A Flutter project designed for stat tracking during volleyball training.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        appBar: AppBar(
          title: Text("Dimes"),
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
        flex: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PassRatings(),
                    CurrentStats(),
                    LifetimeStats(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class PassRatings extends StatelessWidget {
  const PassRatings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Expanded(
      flex: 3,
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: isLandscape ? 4 : 2,
        children: List.generate(4, (index) {
          int rating = 3 - index;
          return Container(
            color: Colors.green,
            child: Center(
              child: Text("Boi"),
            ),
          );
        }),
      ),
    );
  }
}

class LifetimeStats extends StatelessWidget {
  const LifetimeStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue,
        child: Text("Lifetime Stats"),
      ),
    );
  }
}

class CurrentStats extends StatelessWidget {
  const CurrentStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text("Current Stats"),
      ),
    );
  }
}

class ScrollablePlayerSelector extends StatelessWidget {
  const ScrollablePlayerSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
          title: Text(index.toString()),
        ),
      ),
    );
  }
}
