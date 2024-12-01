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
    // consider breakng this whole build function up
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    // create text theme for the rating labels
    final TextStyle textStyling =
        Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            );
    return Expanded(
      flex: 3,
      child: LayoutBuilder(builder: (context, constraints) {
        final double itemHeight = constraints.maxHeight /
            (isLandscape
                ? 1
                : 2); // / 1 becaue 1 row in landscape, 2 in portrait
        final double itemWidth = constraints.maxWidth /
            (isLandscape
                ? 4
                : 2); // divide by 4 since 4 in a row (landscape) or 2 in a row (portrait)
        final double childAspectRatio = itemWidth /
            itemHeight; // Defines the width to height ratio of the grid items per device sizing, no hardcoding

        return GridView.count(
          padding: EdgeInsets.symmetric(horizontal: 12),
          childAspectRatio: childAspectRatio,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: isLandscape ? 4 : 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: List.generate(4, (index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: Center(
                child: Text("$index", style: textStyling),
              ),
            );
          }),
        );
      }),
    );
  }
}

class LifetimeStats extends StatelessWidget {
  const LifetimeStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // create text theme for the rating labels
    final TextStyle textStyling =
        Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            );
    return Expanded(
      flex: 2,
      child: Container(
        //padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.blue,
        ),
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text(
            "Lifetime Stats: 200/ 315 -- idk this fraction",
            style: textStyling,
          ),
        ),
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
    // create text theme for the rating labels
    final TextStyle textStyling =
        Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            );
    return Expanded(
      flex: 2,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            "Current Stats: 15/20 -- 2.5",
            style: textStyling,
          ),
        ),
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
