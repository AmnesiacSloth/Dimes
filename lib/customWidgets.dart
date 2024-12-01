import 'package:flutter/material.dart';

List<int> passRatings = <int>[];

void appendAttempt(int rating) {
  passRatings.add(rating);
  print(rating);
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
          //padding: EdgeInsets.symmetric(horizontal: 12),
          childAspectRatio: childAspectRatio,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: isLandscape ? 4 : 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: List.generate(4, (index) {
            return GestureDetector(
              onTap: () => appendAttempt(index),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey[500],
                ),
                child: Center(
                  child: Text("$index", style: textStyling),
                ),
              ),
            );
          }),
        );
      }),
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
          color: const Color.fromRGBO(0, 98, 155, 1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            "Current Stats: 15/20 -- 2.5",
            style: textStyling,
            textAlign: TextAlign.center,
          ),
        ),
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
    // create text theme for the rating labels
    final TextStyle textStyling =
        Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            );
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color.fromRGBO(198, 146, 20, 1),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text(
            "Lifetime Stats: 200/ 315 -- idk this fraction",
            style: textStyling,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
