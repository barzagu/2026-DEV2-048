import Foundation

class TransformTimeToClockStateUseCase {
  let fiveHoursBlocks = (1...4)
  let oneHourBlocks = (1...4)
  let fiveMinutesBlocks = (1...11)
  let oneMinuteBlocks = (1...4)

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
    fiveHoursBlocks.map { $0 <= (time.hours / 5) }
  }

  private func calculateOneHourBlocks(from time: Time) -> [Bool] {
    oneHourBlocks.map { $0 <= (time.hours % 5) }
  }

  private func calculateFiveMinutesBlocks(from time: Time) -> [Bool] {
    fiveMinutesBlocks.map { $0 <= (time.minutes / 5) }
  }

  private func calculateOneMinuteBlocks(from time: Time) -> [Bool] {
    oneMinuteBlocks.map { $0 <= (time.minutes % 5) }
  }

  private func calculateSeconds(from time: Time) -> Bool {
    time.seconds.isMultiple(of: 2)
  }
}
