import 'package:alive_app/app/data/models/stream_model.dart';
import 'package:flutter/material.dart';

class StreamCard extends StatelessWidget {
  final StreamModel stream;
  const StreamCard({super.key, required this.stream});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(stream.imageUrl, fit: BoxFit.cover),
          Positioned(
            top: 8,
            left: 8,
            child: _pill('👁 ${stream.viewerCount}'),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Row(
              children: [
                const CircleAvatar(radius: 12, backgroundColor: Colors.white),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(stream.username,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFC6E84C),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('+ Follow',
                      style: TextStyle(fontSize: 10, color: Colors.black)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _pill(String text) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(text,
            style: const TextStyle(color: Colors.white, fontSize: 10)),
      );
}