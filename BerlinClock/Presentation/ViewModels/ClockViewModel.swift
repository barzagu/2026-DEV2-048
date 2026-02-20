class ClockViewModel {
  private let getStateUseCase: GetClockStateUseCaseProtocol

  init(getStateUseCase: GetClockStateUseCaseProtocol) {
    self.getStateUseCase = getStateUseCase
  }
}
