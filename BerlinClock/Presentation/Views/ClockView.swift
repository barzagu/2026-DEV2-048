import SwiftUI

struct ClockView: View {
  @ObservedObject var viewModel: ClockViewModel
  private var clockState: UIClockState? { viewModel.clockState }

  var body: some View {
    VStack(spacing: 8) {
      VStack(spacing: 8) {
        TopLampView(color: clockState?.seconds ?? .clear)
        LampsRowView(colors: clockState?.fiveHoursBlocks ?? [])
        LampsRowView(colors: clockState?.oneHourBlocks ?? [])
        LampsRowView(colors: clockState?.fiveMinutesBlocks ?? [])
        LampsRowView(colors: clockState?.oneMinuteBlocks ?? [])
      }
      Text(clockState?.time ?? "").font(.title)
    }
    .padding()
    .onAppear { viewModel.startClock() }
  }
}

#Preview {
  let useCase = GetClockStateUseCasePreviewMock()
  ClockView(viewModel: .init(getStateUseCase: useCase))
}
