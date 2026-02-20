import Combine

@testable import BerlinClock

class GetClockStateUseCaseMock: GetClockStateUseCaseProtocol {
  private let stateSubject = PassthroughSubject<ClockState, Never>()

  func send(_ state: ClockState) {
    stateSubject.send(state)
  }
}
