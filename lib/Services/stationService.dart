import 'package:flutterLearning/Widgets/Stations/station.dart';
import 'package:flutterLearning/common/stationData.dart';

class StationService {

  List<Station> fetchStations() {

    List<Station> _stationList;

   _stationList = stationsData.map((station) {
      return Station(
        id: station['id'],
        name: station['name'],
        url: station['url'],
        image: station['image']
      );
    }).toList();

    return _stationList;
  }
}
