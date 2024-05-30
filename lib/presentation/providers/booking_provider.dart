import 'package:fffff/domain/entities/booking.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class BookingNotifier extends StateNotifier<List<Booking>> {
  BookingNotifier() : super([]);

  void addBooking(Booking booking) {
    state = [...state, booking];
  }

  void updateBookingDate(int index, DateTime bookingDate) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) state[i].copyWith(bookingDate: bookingDate) else state[i],
    ];
  }

  void deleteBooking(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i],
    ];
  }
}

final bookingProvider = StateNotifierProvider<BookingNotifier, List<Booking>>((ref) {
  return BookingNotifier();
});
