//
//  TrashConfigurationView.swift
//  TrashDay
//

import SwiftUI

enum Day: String, CaseIterable, Identifiable {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    
    var id: Self { self }
}

struct TrashConfigurationView: View {
    @State private var isTrashCollected: BooleanResponse = .undefined
    @State private var dayOfWeek: Day = .monday
    @State private var nextCollection: Date = Date()
    
    var body: some View {
        VStack {
            List {
                BooleanQuestion("Is trash collected this week?", value: $isTrashCollected)
                
                if isTrashCollected == .yes {
                    Picker("Day of week", selection: $dayOfWeek) {
                        ForEach(Day.allCases) { day in
                            Text(day.rawValue.capitalized).tag(day)
                        }
                    }
                }
                
                if isTrashCollected == .no {
                    DatePicker("When is it next collected?", selection: $nextCollection, displayedComponents: .date)
                }
                
                if isTrashCollected != .undefined {
                    HStack {
                        Spacer()
                        Button("Continue", action: {})
                        Spacer()
                    }
                }
            }
            
        }
    }
}

#Preview {
    TrashConfigurationView()
}
