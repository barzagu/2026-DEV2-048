import SwiftUI

struct LampsRowView: View {
  let colors: [Color]

  var body: some View {
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
  LampsRowView(colors: [.red, .red, .red, .red])
}
