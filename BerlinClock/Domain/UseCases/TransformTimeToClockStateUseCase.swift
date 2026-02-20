import Foundation

class TransformTimeToClockStateUseCase {
  func transform(_ time: Time) -> ClockState {
    .init(
      time: time,
      fiveHoursBlocks: calculateFiveHoursBlocks(from: time),
      oneHourBlocks: calculateOneHourBlocks(from: time),
      fiveMinutesBlocks: calculateFiveMinutesBlocks(from: time),
      oneMinuteBlocks: calculateOneMinuteBlocks(from: time),
      seconds: calculateSeconds(from: time)
    )
  }

  private func calculateFiveHoursBlocks(from time: Time) -> [Bool] {
    (0..<4).map { $0 < (time.hours / 5) }
  }

  private func calculateOneHourBlocks(from time: Time) -> [Bool] {
    (0..<4).map { $0 < (time.hours % 5) }
  }

  private func calculateFiveMinutesBlocks(from time: Time) -> [Bool] {
    (0..<11).map { $0 < (time.minutes / 5) }
  }

  private func calculateOneMinuteBlocks(from time: Time) -> [Bool] {
    (0..<4).map { $0 < (time.minutes % 5) }
  }

  private func calculateSeconds(from time: Time) -> Bool {
    time.seconds.isMultiple(of: 2)
  }
}
