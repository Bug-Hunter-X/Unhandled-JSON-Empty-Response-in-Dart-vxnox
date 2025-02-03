```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming the API returns a JSON list
      final List<dynamic> jsonData = jsonDecode(response.body);
      // Accessing data directly may cause an error if jsonData is null or empty
      final firstItem = jsonData[0]; //Error prone: Index out of range or null
      print(firstItem['name']);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```