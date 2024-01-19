// TrashDay

enum BooleanResponse: String, Identifiable {
    // swiftlint:disable:next identifier_name
    case undefined, no, yes

    var id: Self { self }
}
