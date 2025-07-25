import 'package:flutter/material.dart';

void main() {
  runApp(const SavedApp());
}

// Entry Point
class SavedApp extends StatelessWidget {
  const SavedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SavedScreen()
    );
  }
}

// Saved Screen
class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  List<SavedItem> _savedItems = [
    SavedItem(
      id: 1, 
      title: 'What is Ovulation?', 
      type: 'Video',
      isViewed: false,
      dateSaved: '2 days ago',
    ),
    SavedItem(
      id: 2, 
      title: 'What is PCOD?', 
      type: 'Video',
      isViewed: false,
      dateSaved: '1 week ago',
    ),
    SavedItem(
      id: 3, 
      title: 'Menstrual Hygiene Tips', 
      type: 'Article',
      isViewed: true,
      dateSaved: '3 days ago',
    ),
    SavedItem(
      id: 4, 
      title: 'Understanding Consent', 
      type: 'Video',
      isViewed: false,
      dateSaved: 'Yesterday',
    ),
    SavedItem(
      id: 5, 
      title: 'Mental Health Guide', 
      type: 'Article',
      isViewed: true,
      dateSaved: '2 weeks ago',
    ),
  ];

  // Mark item as viewed/unviewed
  void _toggleViewedStatus(int id) {
    setState(() {
      _savedItems = _savedItems.map((item) {
        if (item.id == id) {
          return item.copyWith(isViewed: !item.isViewed);
        }
        return item;
      }).toList();
    });
  }

  // Delete saved item
  void _deleteSavedItem(int id) {
    setState(() {
      _savedItems.removeWhere((item) => item.id == id);
    });
  }

  // Clear all saved items
  void _clearAllSavedItems() {
    setState(() {
      _savedItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: _clearAllSavedItems,
            tooltip: 'Clear All',
          ),
        ],
      ),
      body: _savedItems.isEmpty
          ? const Center(
              child: Text(
                'No saved items yet.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: _savedItems.length,
              itemBuilder: (context, index) {
                final item = _savedItems[index];
                return SavedItemTile(
                  item: item,
                  onToggleViewed: _toggleViewedStatus,
                  onDelete: _deleteSavedItem,
                );
              },
            ),
    );
  }
}

// Saved Item Model
class SavedItem {
  final int id;
  final String title;
  final String type;
  final bool isViewed;
  final String dateSaved;

  SavedItem({
    required this.id,
    required this.title,
    required this.type,
    required this.isViewed,
    required this.dateSaved,
  });

  SavedItem copyWith({
    int? id,
    String? title,
    String? type,
    bool? isViewed,
    String? dateSaved,
  }) {
    return SavedItem(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      isViewed: isViewed ?? this.isViewed,
      dateSaved: dateSaved ?? this.dateSaved,
    );
  }
}

// Saved Item Tile Widget
class SavedItemTile extends StatelessWidget {
  final SavedItem item;
  final Function(int) onToggleViewed;
  final Function(int) onDelete;

  const SavedItemTile({
    super.key,
    required this.item,
    required this.onToggleViewed,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: Icon(
          item.type == 'Video' ? Icons.video_library : Icons.article,
          color: item.isViewed ? Colors.grey : Colors.blue,
        ),
        title: Text(
          item.title,
          style: TextStyle(
            fontWeight: item.isViewed ? FontWeight.normal : FontWeight.bold,
            color: item.isViewed ? Colors.grey : Colors.black,
          ),
        ),
        subtitle: Text(
          '${item.type} • Saved ${item.dateSaved}',
          style: TextStyle(
            color: item.isViewed ? Colors.grey : Colors.grey[600],
          ),
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'Mark as Viewed/Unviewed') {
              onToggleViewed(item.id);
            } else if (value == 'Delete') {
              onDelete(item.id);
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'Mark as Viewed/Unviewed',
              child: Text(item.isViewed ? 'Mark as Unviewed' : 'Mark as Viewed'),
            ),
            const PopupMenuItem(
              value: 'Delete',
              child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}