import Testing

@testable import BerlinClock

struct ClockViewTests {
  let sut: ClockView!
  let viewModel: ClockViewModel!
  let getStateUseCase: GetClockStateUseCaseMock!

  init() {
    getStateUseCase = GetClockStateUseCaseMock()
    viewModel = ClockViewModel(getStateUseCase: getStateUseCase)
    sut = ClockView(viewModel: viewModel)
  }
}
