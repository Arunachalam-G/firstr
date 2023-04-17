import 'package:flutter/material.dart';

/// This class is used to show loading indicator on screen center.
/// By default it shows android style loading. You can customise it for iOS style if needed.

class MTLoadingIndicator {
  static OverlayEntry? currentEntry;

  static OverlayEntry showLoading(BuildContext context) {
    currentEntry?.remove();
    final entry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black26,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
    currentEntry = entry;
    Overlay.of(context)?.insert(entry);
    return entry;
  }

  static void hideLoading() {
    currentEntry?.remove();
    currentEntry = null;
  }
}
