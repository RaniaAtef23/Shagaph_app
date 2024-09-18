import 'package:flutter/material.dart';
import '../widgets/book_history_widget.dart';
class BookHistoryScreen extends StatefulWidget {
  const BookHistoryScreen({super.key});

  @override
  State<BookHistoryScreen> createState() => _BookHistoryScreenState();
}

class _BookHistoryScreenState extends State<BookHistoryScreen> {


  @override
  Widget build(BuildContext context) {


    return const Scaffold(

      body:Stack(
      children: [
        BookHistoryWidget(),
       ]
    ) ,);
  }
}
