import Combine
import Testing

@testable import BerlinClock

struct GetClockStateUseCaseTests {

  let sut: GetClockStateUseCase!
  let transformUseCase: TransformTimeToClockStateUseCase!
  let timeProvider: TimeTrackingProviderMock!

  init() {
    transformUseCase = TransformTimeToClockStateUseCase()
    timeProvider = TimeTrackingProviderMock()
    sut = GetClockStateUseCase(
      transformUseCase: transformUseCase,
      timeProvider: timeProvider
    )
  }

  @Test
  func test_get_state_emits_states_when_receiving_times() {
    let inputs: [Time] = (1...4).map { _ in
        .init(hours: 23, minutes: 59, seconds: 59)
    }
    let outputs: [ClockState] = []
    let expectedOutputs: [ClockState] = (1...4).map { _ in
      .init(
        time: .init(hours: 23, minutes: 59, seconds: 59),
        fiveHoursBlocks: [true, true, true, true],
        oneHourBlocks: [true, true, true, false],
        fiveMinutesBlocks: [true, true, true, true, true, true, true, true, true, true, true],
        oneMinuteBlocks: [true, true, true, true],
        seconds: false
      )
    }

    let cancellable = sut.getState().sink { _ in }
  }

}
