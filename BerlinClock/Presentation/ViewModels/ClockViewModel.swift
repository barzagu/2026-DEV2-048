import Combine

class ClockViewModel {
  @Published var clockState: UIClockState?

  private let getStateUseCase: GetClockStateUseCaseProtocol

  init(getStateUseCase: GetClockStateUseCaseProtocol) {
    self.getStateUseCase = getStateUseCase
  }
}
