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
      time: String(format: "%02d:%02d:%02d", state.time.hours, state.time.minutes, state.time.seconds),
      fiveHoursBlocks: state.fiveHoursBlocks.map { $0 ? .red : .clear },
      oneHourBlocks: state.oneHourBlocks.map { $0 ? .red : .clear },
      fiveMinutesBlocks: state.fiveMinutesBlocks.enumerated().map { (index, block) in
        block ? ((index + 1) % 3 == 0 ? .red : .yellow) : .clear
      },
      oneMinuteBlocks: state.oneMinuteBlocks.map { $0 ? .yellow : .clear },
      seconds: state.seconds ? .yellow : .clear
    )
  }
}
