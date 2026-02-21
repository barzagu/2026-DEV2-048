import SwiftUI

struct ClockView: View {
  @ObservedObject var viewModel: ClockViewModel

  var body: some View {
    VStack {
      if let state = viewModel.clockState {
        clockView(from: state)
      } else {
        noStateView
      }
    }
    .padding()
    .onAppear { viewModel.startClock() }
  }

  private var noStateView: some View {
    Text("Clock has no state yet").font(.title)
  }

  func clockView(from state: UIClockState) -> some View {
    VStack(spacing: 8) {
      VStack(spacing: 8) {
        TopLampView(color: state.seconds)
        LampsRowView(colors: state.fiveHoursBlocks)
        LampsRowView(colors: state.oneHourBlocks)
        LampsRowView(colors: state.fiveMinutesBlocks)
        LampsRowView(colors: state.oneMinuteBlocks)
      }
      Text(state.time).font(.title)
    }
  }
}

#Preview {
  let useCase = GetClockStateUseCasePreviewMock()
  ClockView(viewModel: .init(getStateUseCase: useCase))
}
