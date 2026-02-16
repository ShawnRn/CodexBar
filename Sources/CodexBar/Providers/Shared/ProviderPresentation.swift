import CodexBarCore
import Foundation

struct ProviderPresentation {
    let detailLine: @MainActor (ProviderPresentationContext) -> String

    @MainActor
    static func standardDetailLine(context: ProviderPresentationContext) -> String {
        let versionText = context.store.version(for: context.provider) ?? L10n.tr("not detected")
        return "\(context.metadata.cliName) \(versionText)"
    }
}
