import Foundation

class TransformTimeToClockStateUseCase {
  func transform(_ time: Time) -> ClockState {
    .init(
      time: time,
      fiveHoursBlocks: [],
      oneHourBlocks: [],
      fiveMinutesBlocks: [],
      oneMinuteBlocks: [],
      seconds: true
    )
  }
}
