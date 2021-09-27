import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(ChartApp());
}

class ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late SfCartesianChart chart;
  late SelectionBehavior selection;

  @override
  Widget build(BuildContext context) {
    selection =
        SelectionBehavior(enable: true, selectedColor: Colors.yellowAccent);
    chart = SfCartesianChart(series: <ChartSeries<ChartData, num>>[
      ColumnSeries<ChartData, num>(
          dataSource: <ChartData>[
            ChartData(10, 17),
            ChartData(20, 34),
            ChartData(30, 25),
            ChartData(40, 10),
            ChartData(50, 28)
          ],
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          selectionBehavior: selection)
    ]);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                child: Text('Select'),
                onPressed: select,
              ),
              Container(
                child: chart,
              )
            ],
          ),
        ));
  }

  void select() {
    // In the selection method, you can pass the pointIndex and seriesIndex values of the data point to be selected.
    selection.selectDataPoints(1, 0);
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final double x;
  final double y;
}
