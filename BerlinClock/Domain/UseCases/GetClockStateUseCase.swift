import Combine

class GetClockStateUseCase {
  private let transformUseCase: TransformTimeToClockStateUseCase
  private let timeProvider: TimeTrackingProviderProtocol
  private let stateSubject: PassthroughSubject<ClockState, Never>

  init(
    transformUseCase: TransformTimeToClockStateUseCase,
    timeProvider: TimeTrackingProviderProtocol
  ) {
    self.transformUseCase = transformUseCase
    self.timeProvider = timeProvider
    self.stateSubject = .init()
  }

  func getState() -> AnyPublisher<ClockState, Never> {
    stateSubject.eraseToAnyPublisher()
  }
}
