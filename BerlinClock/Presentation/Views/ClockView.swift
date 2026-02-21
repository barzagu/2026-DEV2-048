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
        topLampView(with: state.seconds)
        lampsRowView(with: state.fiveHoursBlocks)
        lampsRowView(with: state.oneHourBlocks)
        lampsRowView(with: state.fiveMinutesBlocks)
        lampsRowView(with: state.oneMinuteBlocks)
      }
      Text(state.time).font(.title)
    }
  }

  func topLampView(with color: Color) -> some View {
    Circle()
      .fill(color)
      .stroke(.black, lineWidth: 2)
      .frame(width: 48, height: 48)
  }

  func lampsRowView(with colors: [Color]) -> some View {
    HStack {
      ForEach(colors.enumerated(), id: \.offset) {
        Rectangle()
          .fill($0.element)
          .stroke(.black, lineWidth: 2)
          .frame(height: 48)
      }
    }
  }
}

#Preview {
  let useCase = GetClockStateUseCasePreviewMock()
  ClockView(viewModel: .init(getStateUseCase: useCase))
}
