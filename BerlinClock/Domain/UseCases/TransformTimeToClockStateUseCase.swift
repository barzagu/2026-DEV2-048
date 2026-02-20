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
    let isActive = { (index: Int) in index < (time.hours / 5) }
    return (0..<4).map { isActive($0) }
  }

  private func calculateOneHourBlocks(from time: Time) -> [Bool] {
    let isActive = { (index: Int) in index < (time.hours % 5) }
    return (0..<4).map { isActive($0) }
  }

  private func calculateFiveMinutesBlocks(from time: Time) -> [Bool] {
    let isActive = { (index: Int) in index < (time.minutes / 5) }
    return (0..<11).map { isActive($0) }
  }

  private func calculateOneMinuteBlocks(from time: Time) -> [Bool] {
    let isActive = { (index: Int) in index < (time.minutes % 5) }
    return (0..<4).map { isActive($0) }
  }

  private func calculateSeconds(from time: Time) -> Bool {
    time.seconds.isMultiple(of: 2)
  }
}
