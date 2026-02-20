import Foundation

struct ClockState: Equatable {
  let time: Time
  let fiveHoursBlocks: [Bool]
  let oneHourBlocks: [Bool]
  let fiveMinutesBlocks: [Bool]
  let oneMinuteBlocks: [Bool]
  let seconds: Bool
}
