import Foundation

public extension Bundle {
    /// True when this bundle is an App Extension bundle.
    /// - Note: Relies on presence of the `NSExtension` root key in Info.plist.
    var isAppExtension: Bool {
        if object(forInfoDictionaryKey: "NSExtension") != nil {
            return true
        }

        return bundleURL.pathExtension == "appex"
    }
}
