import 'package:flutter/material.dart';
import 'package:flutterLearning/Modals/appRouter.dart';
import 'package:flutterLearning/Services/stationService.dart';
import 'package:flutterLearning/Widgets/Stations/station.dart';
import 'package:flutterLearning/Widgets/Stations/stationListItem.dart';

class StationList extends StatefulWidget {

  final bool isGridView;
  StationList({this.isGridView});

  @override
  _StationListState createState() => _StationListState();
}

class _StationListState extends State<StationList> {
  List<Station> _stations = StationService().fetchStations();


  @override
  Widget build(BuildContext context) {
    return (!widget.isGridView
        ? ListView(
            children: _stations.map((station) {
              return StationListItem(
                station: station,
              );
            }).toList(),
          )
        : GridView.extent(
            maxCrossAxisExtent: 200,
            children: _stations.map((station) {
              return Container(
                child: GridTile(
                  child: GestureDetector(
                    child: Image.network(
                      station.image,
                      fit: BoxFit.fill,
                      repeat: ImageRepeat.noRepeat,
                    ),
                    onTap: () => Navigator.pushNamed(
                        context, AppRouter.stationPlayerRoute,
                        arguments: station),
                  ),
                ),
                margin: EdgeInsets.all(5),
              );
            }).toList(),
          ));
  }
}
