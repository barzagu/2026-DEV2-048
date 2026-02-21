import Combine

class GetClockStateUseCasePreviewMock: GetClockStateUseCaseProtocol {
  private let stateSubject: CurrentValueSubject<ClockState, Never>

  init(state: ClockState = .default) {
    stateSubject = .init(state)
  }

  func getState() -> AnyPublisher<BerlinClock.ClockState, Never> {
    stateSubject.eraseToAnyPublisher()
  }
}

private extension ClockState {
  static let `default`: Self = .init(
    time: .init(hours: 12, minutes: 57, seconds: 10),
    fiveHoursBlocks: [true, true, false, false],
    oneHourBlocks: [false, false, false, false],
    fiveMinutesBlocks: [true, true, true, true, true, true, true, true, true, true, true],
    oneMinuteBlocks: [true, true, false, false],
    seconds: true
  )
}
