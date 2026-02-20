import Testing

@testable import BerlinClock

struct GetClockStateUseCaseTests {

  let sut: GetClockStateUseCase!

  init() {
    sut = GetClockStateUseCase()
  }

}
