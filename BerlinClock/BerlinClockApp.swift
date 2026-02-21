import SwiftUI

@main
struct BerlinClockApp: App {
  let stateUseCase = GetClockStateUseCase(
    transformUseCase: TransformTimeToClockStateUseCase(),
    timeProvider: TimeTrackingProvider(parsingProvider: TimeParsingProvider())
  )

  var body: some Scene {
    WindowGroup {
      ClockView(viewModel: ClockViewModel(getStateUseCase: stateUseCase))
    }
  }
}
