import Combine

protocol GetClockStateUseCaseProtocol {
  func getState() -> AnyPublisher<ClockState, Never>
}
