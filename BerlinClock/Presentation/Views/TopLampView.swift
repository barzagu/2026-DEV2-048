import SwiftUI

struct TopLampView: View {
  let color: Color

  var body: some View {
    Circle()
      .fill(color)
      .stroke(.black, lineWidth: 2)
      .frame(width: 48, height: 48)
  }
}

#Preview {
  TopLampView(color: .yellow)
}
