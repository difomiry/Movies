import Foundation

/// The collection of configuration constants.
enum Configuration {

  /// An api key.
  static let apiKey: String = get(property: "ApiKey")

  /// The configuration from `Configuration.plist`.
  fileprivate static let dictionary: [String: Any] = {
    guard let path = Bundle.main.path(forResource: "Configuration", ofType: "plist") else {
      fatalError("`Configuration.plist` doesn't exist.")
    }
    return .init(from: path)
  }()

  /// Gets a typed property from the configuration dictionary.
  ///
  /// - Parameter property: The property key.
  /// - Returns: A typed property.
  fileprivate static func get<T>(property key: String) -> T {
    guard let property = dictionary[key] as? T else {
      fatalError("`\(key)` property doesn't exist.")
    }
    return property
  }

}
