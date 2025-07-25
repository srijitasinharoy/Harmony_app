import 'package:flutter/material.dart';

void main() {
  runApp(const NotificationApp());
}

// Entry Point
class NotificationApp extends StatelessWidget {
  const NotificationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationScreen()
    );
  }
}

// Notification Screen
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationItem> _notifications = [
    NotificationItem(id: 1, title: 'New Message', content: 'You have a new message.', isRead: false),
    NotificationItem(id: 2, title: 'New Message', content: 'You have a new message.', isRead: false),
    NotificationItem(id: 3, title: 'App Update', content: 'A new version of the app is available.', isRead: false),
    NotificationItem(id: 4, title: 'Someone just posted!', content: 'Check this out.', isRead: false),
    NotificationItem(id: 5, title: 'Your Date has been updated', content: 'Click here to manage your dates.', isRead: false),
  ];

  // Mark notification as read/unread
  void _toggleReadStatus(int id) {
    setState(() {
      _notifications = _notifications.map((notification) {
        if (notification.id == id) {
          return notification.copyWith(isRead: !notification.isRead);
        }
        return notification;
      }).toList();
    });
  }

  // Delete notification
  void _deleteNotification(int id) {
    setState(() {
      _notifications.removeWhere((notification) => notification.id == id);
    });
  }

  // Clear all notifications
  void _clearAllNotifications() {
    setState(() {
      _notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: _clearAllNotifications,
            tooltip: 'Clear All',
          ),
        ],
      ),
      body: _notifications.isEmpty
          ? const Center(
              child: Text(
                'No notifications available.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return NotificationTile(
                  notification: notification,
                  onToggleRead: _toggleReadStatus,
                  onDelete: _deleteNotification,
                );
              },
            ),
    );
  }
}

// Notification Model
class NotificationItem {
  final int id;
  final String title;
  final String content;
  final bool isRead;

  NotificationItem({
    required this.id,
    required this.title,
    required this.content,
    required this.isRead,
  });

  // Create a copy of the notification with updated fields
  NotificationItem copyWith({
    int? id,
    String? title,
    String? content,
    bool? isRead,
  }) {
    return NotificationItem(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      isRead: isRead ?? this.isRead,
    );
  }
}

// Notification Tile Widget
class NotificationTile extends StatelessWidget {
  final NotificationItem notification;
  final Function(int) onToggleRead;
  final Function(int) onDelete;

  const NotificationTile({
    super.key,
    required this.notification,
    required this.onToggleRead,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: Icon(
          notification.isRead ? Icons.notifications_none : Icons.notifications_active,
          color: notification.isRead ? Colors.grey : Colors.blue,
        ),
        title: Text(
          notification.title,
          style: TextStyle(
            fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        subtitle: Text(notification.content),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'Mark as Read/Unread') {
              onToggleRead(notification.id);
            } else if (value == 'Delete') {
              onDelete(notification.id);
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'Mark as Read/Unread',
              child: Text('Mark as Read/Unread'),
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