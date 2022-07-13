import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/nohfibu.dart';

class BookNotifier extends StateNotifier<Book>
{
  BookNotifier({Book? book}) : super(book ?? Book());
}
