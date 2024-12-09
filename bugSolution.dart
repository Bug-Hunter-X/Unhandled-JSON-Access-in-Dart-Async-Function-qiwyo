```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      // Check for empty response
      if (jsonData.isEmpty) {
        print('Empty JSON response');
        return; // or handle appropriately
      }

      // Check if the first element has the 'name' property
      final firstElement = jsonData.first;
      if (firstElement is Map && firstElement.containsKey('name')) {
        final name = firstElement['name'];
        print('Name: $name');
      } else {
        print('First element does not contain the name property.');
      }
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```