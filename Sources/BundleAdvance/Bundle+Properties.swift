import Foundation
import InfoDictionaryKeys

public extension Bundle {
    var appName: String {
        let appName = try? string(for: .appName)
        assert(appName != nil, "Application has non name")
        // swiftlint:disable:next force_unwrapping
        return appName!
    }

    var shortVersion: String {
        let shortVersion = try? string(for: .shortVersionString)
        assert(shortVersion != nil, "Application has no short version")
        // swiftlint:disable:next force_unwrapping
        return shortVersion!
    }

    var version: String {
        let version = try? string(for: .version)
        assert(version != nil, "Application has no version")
        // swiftlint:disable:next force_unwrapping
        return version!
    }

    var identifier: String {
        let identifier = try? string(for: .identifier)
        assert(identifier != nil, "Application has no identifier")
        // swiftlint:disable:next force_unwrapping
        return identifier!
    }
}
