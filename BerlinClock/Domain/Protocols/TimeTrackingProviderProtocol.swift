import Combine

protocol TimeTrackingProviderProtocol {
  func start() -> AnyPublisher<Time, Never>
}
