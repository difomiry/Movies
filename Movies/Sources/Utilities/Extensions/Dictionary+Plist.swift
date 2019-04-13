import Foundation

extension Dictionary where Key == String {

  /// Initializes a dictionary from `.plist` file.
  ///
  /// - Parameter from: The `.plist` file path.
  init(from path: String) {

    guard let data = FileManager.default.contents(atPath: path) else {
      fatalError("File doesn't exist.")
    }

    guard
      let list = try? PropertyListSerialization.propertyList(from: data, options: PropertyListSerialization.ReadOptions(), format: nil),
      let dictionary = list as? [Key: Value]
      else {
        fatalError("Dictionary doesn't exist.")
    }

    self = dictionary
  }

}
