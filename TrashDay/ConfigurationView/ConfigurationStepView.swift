// TrashDay

import SwiftUI

struct ConfigurationStepView: View {
    private let name: String
    private let onContinue: (Date, Frequency) -> Void

    @State private var isCollected: BooleanResponse = .undefined
    @State private var dayOfWeek: DayOfWeek = .monday
    @State private var nextCollection: Date = .init()
    @State private var pickupFrequency: Frequency = .weekly

    init(
        name: String,
        onContinue: @escaping (Date, Frequency) -> Void
    ) {
        self.name = name
        self.onContinue = onContinue
    }

    var body: some View {
        VStack {
            List {
                BooleanQuestion("Is \(name) collected this week?", value: $isCollected)

                if isCollected == .yes {
                    Picker("Day of week", selection: $dayOfWeek) {
                        ForEach(DayOfWeek.allCases) { day in
                            Text(day.rawValue.capitalized).tag(day)
                        }
                    }
                }

                if isCollected == .no {
                    DatePicker("When is it next collected?", selection: $nextCollection, displayedComponents: .date)
                }

                if isCollected != .undefined {
                    Picker("How frequently is pickup?", selection: $pickupFrequency) {
                        ForEach(Frequency.allCases) { frequency in
                            Text(frequency.rawValue.capitalized).tag(frequency)
                        }
                    }
                }

                if isCollected != .undefined {
                    HStack {
                        Spacer()
                        Button("Continue", action: {
                            onContinue(nextCollection, pickupFrequency)
                        })
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    ConfigurationStepView(name: "Trash") { _, _ in }
}
