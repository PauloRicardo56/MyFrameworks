// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Localizable.strings
  ///   Localization
  /// 
  ///   Created by Paulo Ricardo de Araujo Vieira on 21/12/22.
  internal static let row1 = L10n.tr("Localizable", "row1", fallback: "1")
  /// 2
  internal static let row2 = L10n.tr("Localizable", "row2", fallback: "2")
  /// 3
  internal static let row3 = L10n.tr("Localizable", "row3", fallback: "3")
  /// 4
  internal static let row4 = L10n.tr("Localizable", "row4", fallback: "4")
  /// 5
  internal static let row5 = L10n.tr("Localizable", "row5", fallback: "5")
  /// 6
  internal static let row6 = L10n.tr("Localizable", "row6", fallback: "6")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
