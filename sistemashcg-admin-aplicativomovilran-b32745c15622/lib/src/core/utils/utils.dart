DateTime parseDate(s) =>
    DateTime.tryParse(s ?? DateTime.now().toIso8601String()) ?? DateTime.now();
