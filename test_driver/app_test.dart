import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('LastFmMusicSearchApp', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.waitUntilFirstFrameRasterized();
    });

    tearDownAll(() async {
      driver.close();
    });

    test("Search for an album, view album details",
        () async {
      // Arrange - SearchScreen
      final searchBar = find.byValueKey("searchBar");
      final searchButton = find.byValueKey("searchButton");

      // Arrange - SearchResultsScreen
      final listView = find.byValueKey("albumListView");
      final thirdListTile = find.byValueKey("albumListTile3");

      // Arrange - AlbumDetailScreen
      final albumDetailBody = find.byValueKey("albumDetailBody");

      // Act - SearchScreen -> Fill out search and execute
      await driver.tap(searchBar);
      await driver.enterText("Believe");
      await driver.tap(searchButton);

      // Act - SearchResultsScreen -> tap on album
      await driver.waitFor(listView);
      await driver.tap(thirdListTile);

      // Assert
      await driver.waitFor(albumDetailBody);
    });
  });
}
