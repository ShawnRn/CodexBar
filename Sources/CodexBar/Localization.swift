import Foundation

enum L10n {
    static func tr(_ key: String) -> String {
        NSLocalizedString(key, bundle: .module, comment: "")
    }

    static func format(_ key: String, _ arguments: CVarArg...) -> String {
        let format = Self.tr(key)
        return String(format: format, locale: .current, arguments: arguments)
    }
}
