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
    var outputValues: [ClockState] = []
    let expectedOutputValues: [ClockState] = [
      .init(
        time: .init(hours: 0, minutes: 0, seconds: 0),
        fiveHoursBlocks: [false, false, false, false],
        oneHourBlocks: [false, false, false, false],
        fiveMinutesBlocks: [false, false, false, false, false, false, false, false, false, false, false],
        oneMinuteBlocks: [false, false, false, false],
        seconds: true
      ),
      .init(
        time: .init(hours: 10, minutes: 10, seconds: 10),
        fiveHoursBlocks: [true, true, false, false],
        oneHourBlocks: [false, false, false, false],
        fiveMinutesBlocks: [true, true, false, false, false, false, false, false, false, false, false],
        oneMinuteBlocks: [false, false, false, false],
        seconds: true
      ),
      .init(
        time: .init(hours: 23, minutes: 59, seconds: 59),
        fiveHoursBlocks: [true, true, true, true],
        oneHourBlocks: [true, true, true, false],
        fiveMinutesBlocks: [true, true, true, true, true, true, true, true, true, true, true],
        oneMinuteBlocks: [true, true, true, true],
        seconds: false
      )
    ]

    for inputValue in inputValues {
      let outputValue: ClockState = sut.transform(inputValue)
      outputValues.append(outputValue)
    }

    #expect(outputValues == expectedOutputValues)
  }

}
