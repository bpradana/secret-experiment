import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostCard extends StatelessWidget {
  const PostCard(this.name, this.content, this.created);

  final String name;
  final String content;
  final String created;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF3A3A3A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16,16,16,24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 14, 
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEAEAEA) 
                      )
                    ), 
                  Text(
                    DateFormat.jm().format(DateTime.parse(created).toLocal()),
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 12, 
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEAEAEA)
                      )
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: TextStyle(fontSize: 12, color: Color(0xFFEAEAEA))
            ),
          ],
        )
      )
    );
  }
}
