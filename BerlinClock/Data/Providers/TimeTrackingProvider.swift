import Combine
import Foundation

class TimeTrackingProvider: TimeTrackingProviderProtocol {
  private let parsingProvider: TimeParsingProvider

  init(parsingProvider: TimeParsingProvider) {
    self.parsingProvider = parsingProvider
  }

  func start() -> AnyPublisher<Time, Never> {
    Timer
      .publish(every: 1.0, on: .main, in: .common)
      .autoconnect()
      .map { self.parsingProvider.parse(from: $0) }
      .eraseToAnyPublisher()
  }
}
