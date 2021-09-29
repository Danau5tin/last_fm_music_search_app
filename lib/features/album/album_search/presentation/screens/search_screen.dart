import 'package:flutter/material.dart';
import 'package:last_fm_music_search_app/core/navigation/routes.dart';
import 'package:last_fm_music_search_app/features/album/album_search/presentation/screens/search_results_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: _buildBody(context),
      ),
    );
  }

  Column _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/speaker.png",
          height: MediaQuery.of(context).size.height * .25,
        ),
        const SizedBox(height: 40),
        TextField(
          controller: _controller,
          onSubmitted: (_) => _submitAlbumSearch(),
          decoration: InputDecoration(
              hintText: "Type album name here...",
              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.all(8),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
        ),
        ElevatedButton(
          onPressed: _submitAlbumSearch,
          child: const Text("Search"),
        )
      ],
    );
  }

  void _submitAlbumSearch() {
    Navigator.pushNamed(context, Routes.searchResults,
        arguments: SearchResultsScreenArgs(_controller.text));
    _controller.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
