// TrashDay

enum Frequency: String, CaseIterable, Identifiable {
    case daily, weekly, fortnightly, monthly

    var id: Self { self }
}
