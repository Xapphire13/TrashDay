//  TrashDay

import SwiftUI

struct BooleanQuestion: View {
    private let label: String
    private var value: Binding<BooleanResponse>
    @State private var noSelected = false
    @State private var yesSelected = false

    init(_ label: String, value: Binding<BooleanResponse>) {
        self.label = label
        self.value = value
    }

    var body: some View {
        HStack {
            Text(self.label)
            Spacer()
            Toggle("No", isOn: $noSelected).onChange(of: noSelected) { _, new in
                if new {
                    self.yesSelected = false
                    self.value.wrappedValue = .no
                } else if !yesSelected {
                    self.value.wrappedValue = .undefined
                }
            }
            Toggle("Yes", isOn: $yesSelected).onChange(of: yesSelected) { _, new in
                if new {
                    self.noSelected = false
                    self.value.wrappedValue = .yes
                } else if !noSelected {
                    self.value.wrappedValue = .undefined
                }
            }

        }.toggleStyle(.button)
    }
}

#Preview {
    BooleanQuestion("Yes or no?", value: Binding.constant(.undefined))
}
