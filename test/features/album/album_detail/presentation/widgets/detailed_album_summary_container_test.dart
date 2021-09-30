import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/entities/detailed_album.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/presentation/widgets/detailed_album_summary_container.dart';
import 'package:mocktail/mocktail.dart';

import '../bloc/detailed_album_bloc_test.dart';

void main() {
  late DetailedAlbumSummaryContainer summaryContainer;
  late DetailedAlbum detailedAlbum;

  setUp(() {
    detailedAlbum = DetailedAlbumMock();
    summaryContainer = DetailedAlbumSummaryContainer(detailedAlbum);
    when(() => detailedAlbum.playCount).thenReturn(10);
    when(() => detailedAlbum.listeners).thenReturn(10);
  });

  group("initial setUp", () {
    testWidgets("should show release date when known", (widgetTester) async {
      // Arrange
      const firstPublished = "16 oct 2010";
      when(() => detailedAlbum.firstPublished).thenReturn(firstPublished);
      // Act
      await widgetTester.pumpWidget(MaterialApp(
        home: summaryContainer,
      ));

      // Assert
      expect(find.text("Release date: $firstPublished"), findsOneWidget);
    });

    testWidgets("should show expandable text when known", (widgetTester) async {
      // Arrange
      when(() => detailedAlbum.summaryContent).thenReturn("summary");
      // Act
      await widgetTester.pumpWidget(MaterialApp(
        home: summaryContainer,
      ));
      // Assert
      expect(find.byKey(const ValueKey("expandableRichText")), findsOneWidget);
    });

    testWidgets("should not show expandable text when text not known",
        (widgetTester) async {
      // Arrange
      when(() => detailedAlbum.summaryContent).thenReturn(null);
      // Act
      await widgetTester.pumpWidget(MaterialApp(
        home: summaryContainer,
      ));

      // Assert
      expect(find.byKey(const ValueKey("expandableRichText")), findsNothing);
    });
  });
}
