import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';
import 'package:stacked_chart/stacked_chart.dart';
import 'dart:math';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Row(
          children: [
            Text('Dashboard Charts'),
            SizedBox(width: 900),
            MyTime(),
          ],
        )),
        body: MyLayout(),
      ),
    );
  }
}

class MyLayout extends StatelessWidget {
  List<ChartData> chartData = [
    ChartData(label: 'Nilai A', value: 30, color: Colors.blue),
    ChartData(label: 'Nilai B', value: 10, color: Colors.green),
    ChartData(label: 'Nilai C', value: 20, color: Colors.red),
    ChartData(label: 'Nilai D', value: 10, color: Colors.orange),
    ChartData(label: 'Nilai E', value: 10, color: Colors.blueGrey),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          color: Color.fromARGB(255, 228, 223, 223),
          child: Drawer(
            child: ListView(
              children: [
                Container(
                  color: Colors.blueAccent,
                  padding: EdgeInsets.all(20),
                  child: Column(children: [
                    Image.network('https://picsum.photos/200/300')
                  ]),
                ),
                InkWell(
                  onTap: () {
                    // Tambahkan logika navigasi ke halaman form
                    print('Navigasi ke Dashboard');
                  },
                  child: ListTile(
                    leading: Icon(Icons.home_filled),
                    title: Text('Dashboard'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Tambahkan logika navigasi ke halaman form
                    print('Navigasi ke Chart');
                  },
                  child: ListTile(
                    leading: Icon(Icons.signal_cellular_alt),
                    title: Text('Chart'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Tambahkan logika navigasi ke halaman form
                    print('Navigasi ke Form');
                  },
                  child: ListTile(
                    leading: Icon(Icons.forum),
                    title: Text('Form'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Tambahkan logika navigasi ke halaman form
                    print('Navigasi ke Email');
                  },
                  child: ListTile(
                    leading: Icon(Icons.mark_email_read),
                    title: Text('Email'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Tambahkan logika navigasi ke halaman form
                    print('Navigasi ke Account');
                  },
                  child: ListTile(
                    leading: Icon(Icons.person_pin),
                    title: Text('Account'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Tambahkan logika navigasi ke halaman form
                    print('Navigasi ke Setting');
                  },
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Setting'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Tambahkan logika navigasi ke halaman form
                    print('Navigasi ke Sign Out');
                  },
                  child: ListTile(
                    leading: Icon(Icons.logout_outlined),
                    title: Text('Sign Out'),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white, // Warna bayangan
                      spreadRadius: 2, // Jarak penyebaran bayangan
                      blurRadius: 5, // Besarnya blur bayangan
                      offset: Offset(2, 3), // Posisi offset bayangan (x, y)
                    ),
                  ],
                ),
                height: 50,
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      hintText: 'Pencarian',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: LineChartSample(),
                ),
              ),
              SizedBox(height: 0.5),
              SizedBox(
                height: 150,
                child: ListView(scrollDirection: Axis.horizontal, children: []),
              ),
              SizedBox(
                height: 300,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  SizedBox(
                    width: 300,
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: DonutChartWidget(data: chartData),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: TimeSeriesChart(),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 100,
                    child:Padding(
                      padding: EdgeInsets.all(5),
                      child: BarChartSample.withSampleData(),
                    ), 
                  ),
                  SizedBox(
                    width: 300,
                    height: 100,
                    child:Padding(
                      padding: EdgeInsets.all(5),
                      child: BarChartSample.withSampleData(),
                    ), 
                  ),
                ]),
              ),
              SizedBox(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 100,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: HorizontalBarChartSample.withSampleData(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 0,
          child: Row(
            children: [
              Container(
                width: 250,
                color: Colors.white,
                child: Drawer(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 300,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ClipRRect(
                              child: Image.network('https://picsum.photos/38/38'),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            
                            // SizedBox(
                            //   width: 300,
                            //   height: 100,
                            //   child: Padding(
                            //     padding: EdgeInsets.all(5),
                            //     child: BarChart(
                            //       BarChartData(
                            //         titlesData: FlTitlesData(
                            //             // leftTitles: SideTitles(showTitles: true),
                            //             // bottomTitles: SideTitles(showTitles: true),
                            //             ),
                            //         borderData: FlBorderData(show: true),
                            //         barGroups: [
                            //           BarChartGroupData(
                            //             x: 0,
                            //             barRods: [
                            //               BarChartRodData(
                            //                   toY: 3,
                            //                   width: 16,
                            //                   color: Colors.blue),
                            //               BarChartRodData(
                            //                 toY: 5,
                            //                 width: 16,
                            //                 color: Colors.red,
                            //               ),
                            //             ],
                            //             showingTooltipIndicators: [0, 1],
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BarChartSample extends StatelessWidget {
  final List<charts.Series<OrdinalSales, String>> seriesList;
  final bool animate;

  BarChartSample(this.seriesList, {required this.animate});

  factory BarChartSample.withSampleData() {
    return BarChartSample(
      _createSampleData(),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      OrdinalSales('2014', 5),
      OrdinalSales('2015', 25),
      OrdinalSales('2016', 100),
      OrdinalSales('2017', 75),
      OrdinalSales('2018', 100),
      OrdinalSales('2019', 75),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

class TimeSeriesChart extends StatelessWidget {
  final List<TimeSeriesSales> data = [
    TimeSeriesSales(DateTime(2023, 8, 1), 2),
    TimeSeriesSales(DateTime(2023, 8, 2), 14),
    TimeSeriesSales(DateTime(2023, 8, 3), 8),
    TimeSeriesSales(DateTime(2023, 8, 4), 30),
    TimeSeriesSales(DateTime(2023, 8, 5), 29),
  ];

  @override
  Widget build(BuildContext context) {
    var series = [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];

    var chart = charts.TimeSeriesChart(
      series,
      animate: true,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );

    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Container(
        width: 200,
        padding: EdgeInsets.all(10),
        child: chart,
      ),
    );
  }
}

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}


// class DonutChartWidget extends StatelessWidget {
//   final List<ChartData> data;

//   DonutChartWidget({required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 0.5,
//       child: PieChart(
//         PieChartData(
//           sections: _generateSections(data),
//           centerSpaceRadius: 40,
//         ),
//       ),
//     );
//   }

//   List<PieChartSectionData> _generateSections(List<ChartData> data) {
//     return data.map((item) {
//       return PieChartSectionData(
//         value: item.value.toDouble(),
//         title: '${item.label}\n${item.value}',
//         color: item.color,
//         radius: 100,
//       );
//     }).toList();
//   }
// }

class ChartData {
  final String label;
  final int value;
  final Color color;

  ChartData({required this.label, required this.value, required this.color});
}

class PieChartSample extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  PieChartSample(this.seriesList, {required this.animate});

  factory PieChartSample.withSampleData() {
    return new PieChartSample(
      _createSampleData(),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(
      seriesList,
      animate: animate,
    );
  }

  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
      )
    ];
  }
}



class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

//==============================================================================================


class MyRingPage extends StatelessWidget {
  final List<charts.Series<LinearSales, int>> seriesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ring Chart Example'),
      ),
      body: Center(
        child: Container(
          height: 300,
          padding: EdgeInsets.all(16),
          child: charts.PieChart(
            seriesList,
            animate: true,
            defaultRenderer: charts.ArcRendererConfig(
              arcRendererDecorators: [
                charts.ArcLabelDecorator(
                  labelPosition: charts.ArcLabelPosition.auto,
                ),
              ],
            ),
            behaviors: [
              charts.DatumLegend(
                position: charts.BehaviorPosition.end,
                outsideJustification: charts.OutsideJustification.endDrawArea,
                horizontalFirst: false,
                desiredMaxColumns: 2,
                cellPadding: EdgeInsets.only(right: 4.0, bottom: 4.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LineChartSample extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 6,
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          horizontalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 3),
              FlSpot(2.6, 2),
              FlSpot(3, 5),
              FlSpot(4.9, 2.5),
              FlSpot(6.8, 4),
              FlSpot(9.5, 3),
              FlSpot(11, 4),
            ],
            isCurved: true,
            color: Colors.blueAccent,
            barWidth: 5,
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}

//==============================================================================================

class HorizontalBarChartSample extends StatelessWidget {
  final List<charts.Series<OrdinalSales, String>> seriesList;
  final bool animate;

  HorizontalBarChartSample(this.seriesList, {required this.animate});

  factory HorizontalBarChartSample.withSampleData() {
    return HorizontalBarChartSample(
      _createSampleData(),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      vertical: false, // Mengatur grafik menjadi horizontal
      barRendererDecorator:
          charts.BarLabelDecorator<String>(), // Menambahkan label pada bar
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      OrdinalSales('2014', 5),
      OrdinalSales('2015', 25),
      OrdinalSales('2016', 100),
      OrdinalSales('2017', 75),
      OrdinalSales('2018', 100),
      OrdinalSales('2019', 75),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
        colorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(Colors.blue), // Mengatur warna bar
      )
    ];
  }
}

//==============================================================================================

class MyTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE, MMM d, y').format(now);
    String formattedTime = DateFormat('HH:mm:ss').format(now);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tanggal: $formattedDate',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            'Waktu: $formattedTime',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

//==============================================================================================

// class DoughnutChartWidget extends StatelessWidget {
//   final List<ChartData> data;

//   DoughnutChartWidget({required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(15),
//     side: BorderSide(color: Colors.blueGrey, width: 0.5),
//   ),
//   child: Container(
//     height: MediaQuery.of(context).size.height * 0.65,
//     width: MediaQuery.of(context).size.width * 0.80,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             "Genel Durum",
//             style: TextStyle(
//               fontSize: 20,
//               color: Colors.black,
//               letterSpacing: 0.3,
//             ),
//           ),
//         ),
//         Divider(
//           color: Colors.grey,
//           thickness: 0.3,
//           endIndent: 10,
//           indent: 10,
//         ),
        
//       ],
//     ),
//   ),
// );
//   }
// }

class DonutChartWidget extends StatelessWidget {
  final List<ChartData> data;

  DonutChartWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.5,
      child: PieChart(
        PieChartData(
          sections: _generateSections(data),
          centerSpaceRadius: 40,
        ),
      ),
    );
  }

  List<PieChartSectionData> _generateSections(List<ChartData> data) {
    return data.map((item) {
      return PieChartSectionData(
        value: item.value.toDouble(),
        title: '${item.label}\n${item.value}',
        color: item.color,
        radius: 100,
      );
    }).toList();
  }
}


//==============================================================================================

