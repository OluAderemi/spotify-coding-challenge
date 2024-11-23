import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spotify_coding_challenge/StandardElements/StandardWidgets/custom_text.dart';
import 'package:spotify_coding_challenge/StandardElements/StandardWidgets/custom_toggle_buttons.dart';
import 'package:spotify_coding_challenge/StandardElements/constants.dart';
import 'package:spotify_coding_challenge/StandardElements/StandardWidgets/album_list.dart';
import 'package:spotify_coding_challenge/StandardElements/StandardWidgets/artist_list.dart';
import '../Services/spotify_api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  bool showList = false;
  String selectedButton = 'Albums';

  final SpotifyApiService apiService = SpotifyApiService();
  List<Map<String, dynamic>> albums = [];
  List<Map<String, dynamic>> artists = [];
  Timer? _debounce;

  @override
  void dispose() {
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      setState(() {
        searchQuery = query;
        showList = query.isNotEmpty;
      });

      if (query.isNotEmpty) {
        try {
          if (selectedButton == 'Albums') {
            albums = await apiService.searchItems(query, 'album');
          } else if (selectedButton == 'Artists') {
            artists = await apiService.searchItems(query, 'artist');
          }
          setState(() {});
        } catch (e) {
          if (kDebugMode) {
            print('Error fetching data: $e');
          }
        }
      } else {
        setState(() {
          albums.clear();
          artists.clear();
        });
      }
    });
  }

  void onToggle(String selected) {
    setState(() {
      selectedButton = selected;
    });

    if (searchQuery.isNotEmpty) {
      onSearchChanged(searchQuery);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const CustomText(
                text: "Search",
                size: 40,
                color: Color(0xFFF7F8FC),
                weight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: searchController,
                onChanged: onSearchChanged,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Artists, albums...',
                  hintStyle: TextStyle(
                      color: spotifyBlack, fontWeight: FontWeight.normal),
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    color: spotifyBlack,
                    onPressed: () => onSearchChanged(searchController.text),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              CustomToggleButtons(
                selectedButton: selectedButton,
                onToggle: onToggle,
              ),
              const SizedBox(height: 30),
              if (showList && searchQuery.isNotEmpty) ...[
                Expanded(
                  child: selectedButton == 'Albums'
                      ? AlbumList(albums: albums)
                      : ArtistList(artists: artists),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
