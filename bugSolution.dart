```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final List<dynamic>? jsonData = jsonDecode(response.body);
      // Safe access to JSON data
      if (jsonData != null && jsonData.isNotEmpty) {
        final firstItem = jsonData[0];
        print(firstItem['name']);
      } else {
        print('API returned an empty or null response.');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```