import Testing

@testable import BerlinClock

struct TransformTimeToClockStateUseCaseTests {

  let sut: TransformTimeToClockStateUseCase!

  init() {
    sut = TransformTimeToClockStateUseCase()
  }

  @Test
  func test_transforming_time_to_clock_states() {
    let inputValues: [Time] = [
      .init(hours: 0, minutes: 0, seconds: 0),
      .init(hours: 10, minutes: 10, seconds: 10),
      .init(hours: 23, minutes: 59, seconds: 59)
    ]
    let outputValues: [ClockState] = []
    let expectedOutputValues: [ClockState] = []
  }

}
