import CodexBarCore
import Foundation

enum MenuBarDisplayText {
    static func percentText(window: RateWindow?, showUsed: Bool) -> String? {
        guard let window else { return nil }
        let percent = showUsed ? window.usedPercent : window.remainingPercent
        let clamped = min(100, max(0, percent))
        return String(format: "%.0f%%", clamped)
    }

    static func secondaryQuotaText(window: RateWindow?) -> String? {
        guard let window else { return nil }
        let clamped = min(100, max(0, window.remainingPercent))
        return String(format: "%.0f%%", clamped)
    }

    static func displayText(
        mode: MenuBarDisplayMode,
        percentWindow: RateWindow?,
        paceWindow: RateWindow?,
        showUsed: Bool) -> String?
    {
        let primaryPercent = self.percentText(window: percentWindow, showUsed: showUsed)
        let secondaryQuota = self.secondaryQuotaText(window: paceWindow)

        switch mode {
        case .percent:
            return primaryPercent
        case .pace:
            return secondaryQuota ?? primaryPercent
        case .both:
            guard let primaryPercent else { return secondaryQuota }
            guard let secondaryQuota else { return primaryPercent }
            return "\(primaryPercent) · \(secondaryQuota)"
        }
    }
}
