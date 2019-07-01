import UIKit

typealias NibReusable = Reusable & NibLoadable

protocol Reusable: class {
  static var reuseIdentifier: String { get }
}

extension Reusable {

  static var reuseIdentifier: String {
    return String(describing: self)
  }

}

protocol NibLoadable: class {
  static var nib: UINib { get }
}

extension NibLoadable {

  static var nib: UINib {
    return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
  }

}
