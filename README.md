# spotify-coding-challenge
Searching Albums and Artists using Spotify API

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Suggestions and future work
Optimize Search Performance
Current Approach: The real-time search for albums and artists currently fetches data from the Spotify API on every keystroke.
Future Improvement: Introduce debouncing to limit the number of requests sent to the API. This would reduce unnecessary API calls and improve performance, especially when users type quickly.
Implementation Idea: Implement a debounce function in Flutter to only trigger the API call after a pause in typing (e.g., 300ms delay), which can help minimize API load and enhance user experience.
