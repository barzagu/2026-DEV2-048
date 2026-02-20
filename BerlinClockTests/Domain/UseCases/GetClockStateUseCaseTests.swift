import Testing

@testable import BerlinClock

struct GetClockStateUseCaseTests {

  let sut: GetClockStateUseCase!
  let transformUseCase: TransformTimeToClockStateUseCase!
  let timeProvider: TimeTrackingProviderMock!

  init() {
    transformUseCase = TransformTimeToClockStateUseCase()
    timeProvider = TimeTrackingProviderMock()
    sut = GetClockStateUseCase()
  }

}
