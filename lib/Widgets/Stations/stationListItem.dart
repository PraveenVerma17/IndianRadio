import 'package:flutter/material.dart';
import 'package:flutterLearning/Modals/appRouter.dart';
//import 'package:flutterLearning/Widgets/Movies/movies.dart';
import 'package:flutterLearning/Widgets/Stations/station.dart';

class StationListItem extends StatelessWidget {
  final Station station;
  StationListItem({this.station});

  void handleOnStationTap(context){

    //Movie _movie = Movie(id: station.id, name: station.name, url: station.url, imgUrl: station.image);
    Navigator.pushNamed(context, AppRouter.stationPlayerRoute, arguments: station);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              width: 0.3, style: BorderStyle.solid, color: Colors.grey),
        ),
      ),
      padding: EdgeInsets.all(10),
      child: ListTile(
        title: Text(
          station.name,
          style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
        ),
        leading: Image.network(
          station.image,
          width: 40,
          height: double.maxFinite,
        ),
        trailing: Icon(
          Icons.arrow_right,
          color: Theme.of(context).textSelectionColor,
        ),
        onTap: () => handleOnStationTap(context),
      ),
    );
  }
}
