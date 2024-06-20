import 'package:flutter/material.dart';

/// A type representing the various available data points
enum DataPoint {
  casesTotal('Total Cases', 'assets/count.png', Color(0xFFFFF492)),
  casesActive('Active Cases', 'assets/fever.png', Color(0xFFE99600)),
  deaths('Deaths', 'assets/death.png', Color(0xFFE40000)),
  recovered('Recovered', 'assets/patient.png', Color(0xFF70A901));

  const DataPoint(this.name, this.assetPath, this.color);
  final String name;
  final String assetPath;
  final Color color;
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('COVID-19 Tracker'),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          // Use Center as layout has unconstrained width (loose constraints),
          // together with SizedBox to specify the max width (tight constraints)
          // See this thread for more info:
          // https://twitter.com/biz84/status/1445400059894542337
          child: Center(
            child: SizedBox(
              width: 500, // max allowed width
              child: Dashboard(),
            ),
          ),
        ),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Some random values
    final values = [
      9231249,
      123214,
      51245,
      7452340,
    ];

    return Column(
      children: [
        StatCard(
          iconPath: DataPoint.casesTotal.assetPath,
          title: DataPoint.casesTotal.name,
          count: values[0].toString(),
          color: DataPoint.casesTotal.color,
        ),
        SizedBox(height: 16),
        StatCard(
          iconPath: DataPoint.casesActive.assetPath,
          title: DataPoint.casesActive.name,
          count: values[1].toString(),
          color: DataPoint.casesActive.color,
        ),
        SizedBox(height: 16),
        StatCard(
          iconPath: DataPoint.deaths.assetPath,
          title: DataPoint.deaths.name,
          count: values[2].toString(),
          color: DataPoint.deaths.color,
        ),
        SizedBox(height: 16),
        StatCard(
          iconPath: DataPoint.recovered.assetPath,
          title: DataPoint.recovered.name,
          count: values[3].toString(),
          color: DataPoint.recovered.color,
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String count;
  final Color color;

  const StatCard({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.count,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            color: color,
            width: 40.0,
            height: 40.0,
          ),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                count,
                style: TextStyle(
                  color: color,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
