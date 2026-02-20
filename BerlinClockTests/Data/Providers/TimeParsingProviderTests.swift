import Foundation
import Testing

@testable import BerlinClock

struct TimeParsingProviderTests {

  let sut: TimeParsingProvider!
  let calendar = Calendar.current

  init() {
    sut = TimeParsingProvider()
  }

  @Test
  func test_parsing_time_from_date() {
    let date = calendar.date(from: .init(hour: 23, minute: 59, second: 59))!
    let time = sut.parse(from: date)
  }

}
