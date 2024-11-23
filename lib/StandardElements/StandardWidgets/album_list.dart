import 'package:flutter/material.dart';

class AlbumList extends StatelessWidget {
  final List<Map<String, dynamic>> albums;

  const AlbumList({super.key, required this.albums});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];
          return Card(
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  album['images'][0]['url'] ?? '',
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Text(
                    album['name'] ?? 'Unknown Title',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Expanded(
                  child: Text(
                    album['artists'][0]['name'] ?? 'Unknown Artist',
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
                Expanded(
                  child: Text(
                    album['total_tracks'] == 1
                        ? 'Single • ${album['release_date']?.substring(0, 4) ?? 'Unknown Year'}'
                        : album['release_date'] != null &&
                        album['release_date'].length >= 4
                        ? album['release_date'].substring(0, 4)
                        : 'Unknown Year',
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
