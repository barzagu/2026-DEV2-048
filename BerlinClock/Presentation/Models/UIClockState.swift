import SwiftUI

struct UIClockState: Equatable {
  let time: String
  let fiveHoursBlocks: [Color]
  let oneHourBlocks: [Color]
  let fiveMinutesBlocks: [Color]
  let oneMinuteBlocks: [Color]
  let seconds: Color
}
