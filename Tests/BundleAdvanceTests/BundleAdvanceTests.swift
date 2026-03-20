import Foundation
import Testing
@testable import BundleAdvance

@Suite("BundleAdvance")
struct BundleAdvanceTests {
    @Test("appName reads CFBundleName from the fixture bundle")
    func appNameReadsBundleName() throws {
        let bundle = try fixtureBundle()

        #expect(bundle.appName == "BundleAdvanceFixture")
    }

    @Test("shortVersion reads CFBundleShortVersionString from the fixture bundle")
    func shortVersionReadsBundleShortVersion() throws {
        let bundle = try fixtureBundle()

        #expect(bundle.shortVersion == "1.2.3")
    }

    @Test("version reads CFBundleVersion from the fixture bundle")
    func versionReadsBundleVersion() throws {
        let bundle = try fixtureBundle()

        #expect(bundle.version == "123")
    }

    @Test("identifier reads CFBundleIdentifier from the fixture bundle")
    func identifierReadsBundleIdentifier() throws {
        let bundle = try fixtureBundle()

        #expect(bundle.identifier == "com.inekipelov.bundle-advance-fixture")
    }

    @Test("single import exposes BundleID")
    func singleImportExposesBundleID() throws {
        let bundle = try fixtureBundle()

        #expect(bundle.bundleID.rawValue == "com.inekipelov.bundle-advance-fixture")
    }

    @Test("single import exposes typed InfoDictionaryKeys APIs")
    func singleImportExposesTypedInfoDictionaryAPIs() throws {
        let bundle = try fixtureBundle()
        let requiresIPhoneOS = try bundle.bool(for: .requiresIPhoneOS)

        #expect(try bundle.string(for: .appName) == "BundleAdvanceFixture")
        #expect(requiresIPhoneOS == true)
    }

    @Test("isAppExtension is true when the bundle Info.plist contains NSExtension")
    func isAppExtensionUsesInfoDictionarySignal() throws {
        let bundle = try extensionFixtureBundle()

        #expect(bundle.isAppExtension == true)
    }

    @Test("isAppExtension falls back to the appex path extension")
    func isAppExtensionUsesPathExtensionFallback() throws {
        let bundle = try pathFallbackFixtureBundle()

        #expect(bundle.object(forInfoDictionaryKey: "NSExtension") == nil)
        #expect(bundle.isAppExtension == true)
    }

    @Test("isAppExtension is false for a regular bundle")
    func isAppExtensionIsFalseForRegularBundle() throws {
        let bundle = try fixtureBundle()

        #expect(bundle.object(forInfoDictionaryKey: "NSExtension") == nil)
        #expect(bundle.isAppExtension == false)
    }

    private func fixtureBundle() throws -> Bundle {
        try bundle(named: "BundleAdvanceFixture", extension: "bundle")
    }

    private func extensionFixtureBundle() throws -> Bundle {
        try bundle(named: "BundleAdvanceExtensionFixture", extension: "appex")
    }

    private func pathFallbackFixtureBundle() throws -> Bundle {
        try bundle(named: "BundleAdvancePathFallbackFixture", extension: "appex")
    }

    private func bundle(named name: String, extension ext: String) throws -> Bundle {
        let url = try #require(Bundle.module.url(forResource: name, withExtension: ext))
        let bundle = try #require(Bundle(url: url))

        return bundle
    }
}
