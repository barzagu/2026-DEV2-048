import Combine
import SwiftUI
import Testing

@testable import BerlinClock

struct ClockViewModelTests {

  let sut: ClockViewModel!
  let getStateUseCase: GetClockStateUseCaseMock!

  init() {
    getStateUseCase = GetClockStateUseCaseMock()
    sut = ClockViewModel(getStateUseCase: getStateUseCase)
  }

  @Test
  func test_start_clock_emits_ui_states_when_receiving_clock_states() {
    let inputs: [ClockState] = [
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
    var outputs: [UIClockState] = []
    let expectedOutputs: [UIClockState] = [
      .init(
        time: "00:00:00",
        fiveHoursBlocks: [.clear, .clear, .clear, .clear],
        oneHourBlocks: [.clear, .clear, .clear, .clear],
        fiveMinutesBlocks: [.clear, .clear, .clear, .clear, .clear, .clear, .clear, .clear, .clear, .clear, .clear],
        oneMinuteBlocks: [.clear, .clear, .clear, .clear],
        seconds: .yellow
      ),
      .init(
        time: "10:10:10",
        fiveHoursBlocks: [.red, .red, .clear, .clear],
        oneHourBlocks: [.clear, .clear, .clear, .clear],
        fiveMinutesBlocks: [.yellow, .yellow, .clear, .clear, .clear, .clear, .clear, .clear, .clear, .clear, .clear],
        oneMinuteBlocks: [.clear, .clear, .clear, .clear],
        seconds: .yellow
      ),
      .init(
        time: "23:59:59",
        fiveHoursBlocks: [.red, .red, .red, .red],
        oneHourBlocks: [.red, .red, .red, .clear],
        fiveMinutesBlocks: [.yellow, .yellow, .red, .yellow, .yellow, .red, .yellow, .yellow, .red, .yellow, .yellow],
        oneMinuteBlocks: [.yellow, .yellow, .yellow, .yellow],
        seconds: .clear
      )
    ]
    var cancellables = Set<AnyCancellable>()

    sut.startClock()

    sut.$clockState.dropFirst().sink { outputs.append($0!) }.store(in: &cancellables)
    inputs.forEach { getStateUseCase.send($0) }

    #expect(outputs == expectedOutputs)
  }

}
