import SnapshotTesting
import SwiftUI
import Testing

@testable import BerlinClock

@MainActor
struct ClockViewTests {
  let sut: ClockView!
  let viewModel: ClockViewModel!
  let getStateUseCase: GetClockStateUseCaseMock!
  let inputs: [UIClockState] = [
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

  init() {
    getStateUseCase = GetClockStateUseCaseMock()
    viewModel = ClockViewModel(getStateUseCase: getStateUseCase)
    sut = ClockView(viewModel: viewModel)
  }

  @Test
  func test_view_correctly_reflects_clock_state() {
    inputs.forEach {
      viewModel.clockState = $0
      assertSnapshot(of: sut, as: .image(layout: .device(config: .iPhoneX)), named: $0.time)
    }
  }
}
