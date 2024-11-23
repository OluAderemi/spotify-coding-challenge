import 'package:flutter/material.dart';

class ArtistList extends StatelessWidget {
  final List<Map<String, dynamic>> artists;

  const ArtistList({super.key, required this.artists});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: artists.length,
        itemBuilder: (context, index) {
          final artist = artists[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(
                    artist['images'].isNotEmpty
                        ? artist['images'][0]['url']
                        : 'https://via.placeholder.com/150',
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  artist['name'] ?? 'Unknown Artist',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
