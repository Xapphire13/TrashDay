// TrashDay

import SwiftUI

enum ConfigurationStep {
    case trash, recycle
}

struct ConfigurationView: View {
    @State var step: ConfigurationStep = .trash

    var body: some View {
        switch step {
        case .trash:
            ConfigurationStepView(name: "Trash", onContinue: { _, _ in
                step = .recycle
            })

        case .recycle:
            ConfigurationStepView(name: "Recycling", onContinue: { _, _ in })
        }
    }
}

#Preview {
    ConfigurationView()
}
