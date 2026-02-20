import Foundation

class TimeParsingProvider {
  private let calendar = Calendar.autoupdatingCurrent

  func parse(from date: Date) -> Time {
    .init(
      hours: calendar.component(.hour, from: date),
      minutes: calendar.component(.minute, from: date),
      seconds: calendar.component(.second, from: date)
    )
  }
}
