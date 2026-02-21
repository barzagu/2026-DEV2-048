import SwiftUI

struct ClockView: View {
  @ObservedObject var viewModel: ClockViewModel

  var body: some View {
    Text("Hello, World!")
  }
}

#Preview {
  let useCase = GetClockStateUseCasePreviewMock()
  ClockView(viewModel: .init(getStateUseCase: useCase))
}
