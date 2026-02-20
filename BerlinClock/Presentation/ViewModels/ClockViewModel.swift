import Combine
import SwiftUI

class ClockViewModel {
  @Published var clockState: UIClockState?

  private let getStateUseCase: GetClockStateUseCaseProtocol
  private var cancellables = Set<AnyCancellable>()

  init(getStateUseCase: GetClockStateUseCaseProtocol) {
    self.getStateUseCase = getStateUseCase
  }

  func startClock() {
    getStateUseCase
      .getState()
      .sink { self.clockState = self.transform($0) }
      .store(in: &cancellables)
  }

  private func transform(_ state: ClockState) -> UIClockState {
    .init(
      time: calculateTime(from: state),
      fiveHoursBlocks: calculateFiveHoursBlocks(from: state),
      oneHourBlocks: calculateOneHourBlocks(from: state),
      fiveMinutesBlocks: calculateFiveMinutesBlocks(from: state),
      oneMinuteBlocks: calculateOneMinuteBlocks(from: state),
      seconds: calculateSeconds(from: state)
    )
  }

  private func calculateTime(from state: ClockState) -> String {
    String(format: "%02d:%02d:%02d", state.time.hours, state.time.minutes, state.time.seconds)
  }

  private func calculateFiveHoursBlocks(from state: ClockState) -> [Color] {
    state.fiveHoursBlocks.map { $0 ? .red : .clear }
  }

  private func calculateOneHourBlocks(from state: ClockState) -> [Color] {
    state.oneHourBlocks.map { $0 ? .red : .clear }
  }

  private func calculateFiveMinutesBlocks(from state: ClockState) -> [Color] {
    state.fiveMinutesBlocks.enumerated().map { (index, block) in
      block ? ((index + 1) % 3 == 0 ? .red : .yellow) : .clear
    }
  }

  private func calculateOneMinuteBlocks(from state: ClockState) -> [Color] {
    state.oneMinuteBlocks.map { $0 ? .yellow : .clear }
  }

  private func calculateSeconds(from state: ClockState) -> Color {
    state.seconds ? .yellow : .clear
  }
}
