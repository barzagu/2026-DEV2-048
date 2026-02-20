import Combine

@testable import BerlinClock

class TimeTrackingProviderMock: TimeTrackingProviderProtocol {
  private let timeSubject = PassthroughSubject<Time, Never>()

  func send(_ time: Time) {
    timeSubject.send(time)
  }

  func start() -> AnyPublisher<Time, Never> {
    timeSubject.eraseToAnyPublisher()
  }
}
