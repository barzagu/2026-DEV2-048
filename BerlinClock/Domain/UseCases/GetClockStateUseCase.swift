class GetClockStateUseCase {
  private let transformUseCase: TransformTimeToClockStateUseCase
  private let timeProvider: TimeTrackingProviderProtocol

  init(
    transformUseCase: TransformTimeToClockStateUseCase,
    timeProvider: TimeTrackingProviderProtocol
  ) {
    self.transformUseCase = transformUseCase
    self.timeProvider = timeProvider
  }
}
